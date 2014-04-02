package net.rcenergy



import static org.springframework.http.HttpStatus.*

import org.springframework.security.core.GrantedAuthority

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AssignmentController extends ControllerBase {

    static allowedMethods = [supervisor:"POST",assign:"GET",images:"GET",work:"GET",save:"POST", update:["PUT","GET","POST"], delete: "DELETE"]
    @Transactional
    def supervisor()
    {
        params.entrySet().findAll {
            it.key.startsWith("assignment.")
        }.each {
            def assignment = Assignment.get(it.key.substring(11,12)) 
            def user = User.get(it.value)
            assignment.supervisor = user
            assignment.supervisorAssigned = new Date()
            assignment.save flush:true
        }
        redirect(action: "index")
    }
    def start()
    {
    }
    def assign(Assignment assignmentInstance) {
        respond assignmentInstance
    }
    def images(Assignment assignmentInstance) {
        respond assignmentInstance
    }
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
		// TODO: handle when multiple roles are present
		// TODO: handle paging 		
		if (SpringSecurityUtils.ifAllGranted('ROLE_INDEXER')) {
            
			def assignmentInstanceList = Assignment.findAllByIndexer(currentUser())
            render(view:"/assignment/index", model: [assignmentInstanceList: assignmentInstanceList])
		} else if (SpringSecurityUtils.ifAllGranted('ROLE_REVIEWER')) {
			respond Assignment.findByReviewer(currentUser())
		} else if (SpringSecurityUtils.ifAllGranted('ROLE_SUPERVISOR')) {
            println "ASSIGNMENT SUPER current user : " + currentUser()
            
            def assignmentInstanceList = Assignment.findAllBySupervisor(currentUser())
            render(view:"/assignment/index", model: [assignmentInstanceList: assignmentInstanceList])
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
            def role = Role.findByAuthority("ROLE_SUPERVISOR")
            def supervisorInstanceList = UserRole.findAllByRole(role).user
            def assignmentInstanceList = Assignment.findAllBySupervisorAssignedIsNull()
            render(view:"/assignment/index", model: [assignmentInstanceList: assignmentInstanceList,supervisorInstanceList: supervisorInstanceList ])
        } else {
        	respond Assignment.list(params), model:[assignmentInstanceCount: Assignment.count()]
        }
		
    }

    def show(Assignment assignmentInstance) {
        respond assignmentInstance
    }

    def create() {
        def adistrict
        if (params?.district?.id == null)
        {
            adistrict = District.get(session.getAttribute("district.id"))
        } else {
            session.setAttribute("district.id", params.district.id) 
            adistrict = District.get(params.district.id)
        }
        println"AssignmentController CREATE SET DISTRICT"
        
        def imageInstanceList = Image.findAllByHasAssignmentAndDistrict(false,adistrict)
        println"AssignmentController CREATE found image list"

        render(view:"/assignment/create",model: [imageInstanceList: imageInstanceList])
        println"AssignmentController CREATE RENDERED VIEW"
    }

    @Transactional
    def save(Assignment assignmentInstance) {
        println "ASSIGNMENT SAVE"
        def adistrict = District.get(session.getAttribute("district.id"))
        assignmentInstance.district = adistrict
        def images = Image.getAll(params.images) 
        println "AssignmentController images : " + images
        images*.hasAssignment = true
        images*.save flush:true
        if (assignmentInstance == null) {
            notFound()
            return
        }

        if (assignmentInstance.hasErrors()) {
            respond assignmentInstance.errors, view:'create'
            return
        }
        assignmentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'assignmentInstance.label', default: 'Assignment'), assignmentInstance.id])
                redirect assignmentInstance
            }
            '*' { respond assignmentInstance, [status: CREATED] }
        }
    }

    def edit(Assignment assignmentInstance) {
        def role = Role.findByAuthority("ROLE_ADMIN")
        def adminInstanceList = UserRole.findAllByRole(role).user
        role = Role.findByAuthority("ROLE_INDEXER")
        def indexerInstanceList = UserRole.findAllByRole(role).user
        role = Role.findByAuthority("ROLE_REVIEWER")
        def reviewerInstanceList = UserRole.findAllByRole(role).user
        render(view:"/assignment/edit",model: [assignmentInstance: assignmentInstance,indexerInstanceList:indexerInstanceList,reviewerInstanceList: reviewerInstanceList,adminInstanceList:adminInstanceList ])
    }
    
    @Transactional
    def work(Assignment assignmentInstance) {
       def user = springSecurityService.currentUser
       user.currentAssignment = assignmentInstance
       user.save flush:true 
       redirect(controller: 'document', action:'create')
    }

    @Transactional
    def update(Assignment assignmentInstance) {
        println "ASSINMENT UPDATE params " + params
        if (assignmentInstance == null) {
            notFound()
            return
        }

        if (assignmentInstance.hasErrors()) {
            respond assignmentInstance.errors, view:'edit'
            return
        }

        assignmentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Assignment.label', default: 'Assignment'), assignmentInstance.id])
                redirect assignmentInstance
            }
            '*'{ respond assignmentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Assignment assignmentInstance) {

        if (assignmentInstance == null) {
            notFound()
            return
        }

        assignmentInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Assignment.label', default: 'Assignment'), assignmentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'assignmentInstance.label', default: 'Assignment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}
