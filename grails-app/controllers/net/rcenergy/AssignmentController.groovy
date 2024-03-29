package net.rcenergy



import static org.springframework.http.HttpStatus.*

import org.springframework.security.core.GrantedAuthority

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AssignmentController extends ControllerBase {

    static allowedMethods = [audit:"GET",reviewercomplete:"GET",review:"GET",indexercomplete:"GET",assignadmin:"POST",assignreviewer:"POST",assignindexer:"POST",supervisoredit:["GET","POST"],supervisor:"POST",assign:"GET",images:"GET",work:"GET",save:"POST", update:["PUT","GET","POST"], delete: "DELETE"]
    
    @Transactional
    def audit(Assignment assignmentInstance) {
        def user = springSecurityService.currentUser
        user.currentAssignment = assignmentInstance
        user.save flush:true 
        redirect(controller: "document", action: "index")
    }
    @Transactional
    def reviewercomplete(Assignment assignmentInstance) {
        assignmentInstance.reviewComplete = new Date()
        assignmentInstance.save flush:true
        redirect(action: "index")
    }
    @Transactional
    def indexercomplete(Assignment assignmentInstance) {
        assignmentInstance.indexingComplete = new Date()
        assignmentInstance.save flush:true
        redirect(action: "index")
    }
    @Transactional
    def assignindexer(Assignment assignmentInstance) {
        assignmentInstance.indexerAssigned = new Date()
        assignmentInstance.save flush:true
        redirect(action: "index")
    }
    @Transactional
    def assignreviewer(Assignment assignmentInstance) {
        assignmentInstance.reviewerAssigned = new Date()
        assignmentInstance.save flush:true
        redirect(action: "index")
    }

    @Transactional
    def assignadmin(Assignment assignmentInstance) {
        assignmentInstance.finalizedToAdmin = new Date()
        assignmentInstance.save flush:true
        redirect(action: "index")
    }
    @Transactional
    def supervisor()
    {
        params.entrySet().findAll {
            it.key.startsWith("assignment.")
        }.each {
            def assignment = Assignment.findByIdAndSupervisorAssignedIsNull(it.key.substring(11,12)) 
            if(assignment != null && it.value != ""){
                def user = User.get(it.value)
                assignment.supervisor = user
                assignment.supervisorAssigned = new Date()
                assignment.save flush:true
            }
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
            
			def assignmentInstanceList = Assignment.findAllByIndexerAndIndexingCompleteIsNull(currentUser())
            render(view:"/assignment/index", model: [assignmentInstanceList: assignmentInstanceList])
		} else if (SpringSecurityUtils.ifAllGranted('ROLE_REVIEWER')) {
			def assignmentInstanceList = Assignment.findAllByReviewerAndReviewCompleteIsNull(currentUser())
            render(view:"/assignment/index", model: [assignmentInstanceList: assignmentInstanceList])
		} else if (SpringSecurityUtils.ifAllGranted('ROLE_SUPERVISOR')) {
            def assignmentInstanceList = Assignment.findAllBySupervisorAndFinalizedToAdminIsNull(currentUser())
            render(view:"/assignment/index", model: [assignmentInstanceList: assignmentInstanceList])
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {
            def role = Role.findByAuthority("ROLE_SUPERVISOR")
            def supervisorInstanceList = UserRole.findAllByRole(role).user
            def assignmentInstanceList = Assignment.findAllBySupervisorAssignedIsNullOrFinalizedToAdminIsNotNull()
            render(view:"/assignment/index", model: [assignmentInstanceList: assignmentInstanceList,supervisorInstanceList: supervisorInstanceList ])
        } else {
        	respond Assignment.list(params), model:[assignmentInstanceCount: Assignment.count()]
        }
		
    }

    def show(Assignment assignmentInstance) {
        respond assignmentInstance
    }

    def create(Assignment assignmentInstance) {
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

        render(view:"/assignment/create",model: [imageInstanceList: imageInstanceList,assignmentInstance:assignmentInstance])
        println"AssignmentController CREATE RENDERED VIEW"
    }

    def supervisoredit(Assignment assignmentInstance) {
        def role = Role.findByAuthority("ROLE_ADMIN")
        def adminInstanceList = UserRole.findAllByRole(role).user
        role = Role.findByAuthority("ROLE_INDEXER")
        def indexerInstanceList = UserRole.findAllByRole(role).user
        role = Role.findByAuthority("ROLE_REVIEWER")
        def reviewerInstanceList = UserRole.findAllByRole(role).user
        render(view:"/assignment/supervisoredit",model: [assignmentInstance: assignmentInstance,indexerInstanceList:indexerInstanceList,reviewerInstanceList: reviewerInstanceList,adminInstanceList:adminInstanceList ])
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

    @Transactional
    def review(Assignment assignmentInstance) {
       def user = springSecurityService.currentUser
       user.currentAssignment = assignmentInstance
       user.save flush:true 
       redirect(controller: 'document', action:'index')
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
        println "ASSIGNMENT UPDATE params " + params
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
