package net.rcenergy



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.SpringSecurityUtils

@Transactional(readOnly = true)
class ContainerController {

    static allowedMethods = [assignments: [ "POST", "GET", "PUT"], update: "POST", delete: "DELETE"]
    

    @Transactional
    def assignments(Container containerInstance){
        println "ContainerController assignments  "
        def containerDistrict = containerInstance.district
        containerInstance.usstate = containerInstance.district.usstate
        containerInstance.save flush:true
        def query = Assignment.where {
                hasContainer == false && district == containerDistrict
            }
        def assignmentInstanceList = query.list()
        
        render(view:"/container/assignments",model: [assignmentInstanceList: assignmentInstanceList,containerInstance: containerInstance])
        
    }


    def index(Integer max) {
        println "ContainerController Index" 
        if (SpringSecurityUtils.ifAllGranted('ROLE_SUPERVISOR')) {
            def query = Container.where {
                supervisor == currentUser() && complete == false 
            }
            def results = query.list()
            respond results
        } else {
            params.max = Math.min(max ?: 10, 100)
            respond Container.list(params), model:[containerInstanceCount: Container.count()]
        }
    }

    def show(Container containerInstance) {
        println "ContainerController Show" 
        respond containerInstance
    }

    def create() {
        println "ContainerController create" 
        def role = Role.findByAuthority("ROLE_SUPERVISOR")
        def supervisorInstanceList = UserRole.findAllByRole(role).user
        println "supervisorInstanceList: " + supervisorInstanceList
        render(view:"/container/create", model: [supervisorInstanceList: supervisorInstanceList])
    }

    
    def edit(Container containerInstance) {
        println "ContainerController EDIT"
        def query = Assignment.where {
                hasContainer == false
            }
        def assignmentInstanceList = query.list()
        
        render(view:"/container/edit",model: [assignmentInstanceList: assignmentInstanceList,containerInstance: containerInstance])

    }

    @Transactional
    def update(Container containerInstance) {
        println "ContainerController UPDATE"
        def assignments = Assignment.getAll(params.assignments) 
        println "ContainerController assignments : " + assignments
        assignments*.hasContainer = true
        assignments*.save flush:true
        if (containerInstance == null) {
            notFound()
            return
        }

        if (containerInstance.hasErrors()) {
            respond containerInstance.errors, view:'edit'
            return
        }

        containerInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Container.label', default: 'Container'), containerInstance.id])
                redirect containerInstance
            }
            '*'{ respond containerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Container containerInstance) {

        if (containerInstance == null) {
            notFound()
            return
        }

        containerInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Container.label', default: 'Container'), containerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'containerInstance.label', default: 'Container'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
