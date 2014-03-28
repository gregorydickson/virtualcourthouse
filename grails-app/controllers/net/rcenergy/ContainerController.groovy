package net.rcenergy



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ContainerController {

    static allowedMethods = [saveinitial: "POST",addassignments:"POST",save: "POST", update: "PUT", delete: "DELETE"]

    @Transactional
    def saveinitial(Container containerInstance){
        def containerDistrict = containerInstance.district
        containerInstance.usstate = containerInstance.district.usstate
        containerInstance.save flush:true
        

        def query = Assignment.where {
                hasContainer == false 
            }
        def assignmentInstanceList = query.list()
        
        render(view:"/container/assignments", model: [assignmentInstanceList: assignmentInstanceList,containerInstance: containerInstance])
    }

    @Transactional
    def addassignments(){
        println "Container:assignments params " + params
        def acontainer = Container.get(params.id)
        acontainer.properties = params
        acontainer.save flush:true
        redirect(action: "index")
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Container.list(params), model:[containerInstanceCount: Container.count()]
    }

    def show(Container containerInstance) {
        respond containerInstance
    }

    def create() {
        def role = Role.findByAuthority("ROLE_SUPERVISOR")
        def supervisorInstanceList = UserRole.findAllByRole(role).user
        println "supervisorInstanceList: " + supervisorInstanceList
        render(view:"/container/create", model: [supervisorInstanceList: supervisorInstanceList])
    }

    @Transactional
    def save(Container containerInstance) {
        if (containerInstance == null) {
            notFound()
            return
        }

        if (containerInstance.hasErrors()) {
            respond containerInstance.errors, view:'create'
            return
        }

        containerInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'containerInstance.label', default: 'Container'), containerInstance.id])
                redirect containerInstance
            }
            '*' { respond containerInstance, [status: CREATED] }
        }
    }

    def edit(Container containerInstance) {
        respond containerInstance
    }

    @Transactional
    def update(Container containerInstance) {
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
