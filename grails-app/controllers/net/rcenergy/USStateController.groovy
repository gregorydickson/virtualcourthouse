package net.rcenergy



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class USStateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond USState.list(params), model:[USStateInstanceCount: USState.count()]
    }

    def show(USState USStateInstance) {
        respond USStateInstance
    }

    def create() {
        respond new USState(params)
    }

    @Transactional
    def save(USState USStateInstance) {
        if (USStateInstance == null) {
            notFound()
            return
        }

        if (USStateInstance.hasErrors()) {
            respond USStateInstance.errors, view:'create'
            return
        }

        USStateInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'USStateInstance.label', default: 'USState'), USStateInstance.id])
                redirect USStateInstance
            }
            '*' { respond USStateInstance, [status: CREATED] }
        }
    }

    def edit(USState USStateInstance) {
        respond USStateInstance
    }

    @Transactional
    def update(USState USStateInstance) {
        if (USStateInstance == null) {
            notFound()
            return
        }

        if (USStateInstance.hasErrors()) {
            respond USStateInstance.errors, view:'edit'
            return
        }

        USStateInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'USState.label', default: 'USState'), USStateInstance.id])
                redirect USStateInstance
            }
            '*'{ respond USStateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(USState USStateInstance) {

        if (USStateInstance == null) {
            notFound()
            return
        }

        USStateInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'USState.label', default: 'USState'), USStateInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'USStateInstance.label', default: 'USState'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
