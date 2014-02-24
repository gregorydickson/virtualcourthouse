package net.rcenergy



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubdivisionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Subdivision.list(params), model:[subdivisionInstanceCount: Subdivision.count()]
    }

    def show(Subdivision subdivisionInstance) {
        respond subdivisionInstance
    }

    def create() {
        respond new Subdivision(params)
    }

    @Transactional
    def save(Subdivision subdivisionInstance) {
        if (subdivisionInstance == null) {
            notFound()
            return
        }

        if (subdivisionInstance.hasErrors()) {
            respond subdivisionInstance.errors, view:'create'
            return
        }

        subdivisionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subdivisionInstance.label', default: 'Subdivision'), subdivisionInstance.id])
                redirect subdivisionInstance
            }
            '*' { respond subdivisionInstance, [status: CREATED] }
        }
    }

    def edit(Subdivision subdivisionInstance) {
        respond subdivisionInstance
    }

    @Transactional
    def update(Subdivision subdivisionInstance) {
        if (subdivisionInstance == null) {
            notFound()
            return
        }

        if (subdivisionInstance.hasErrors()) {
            respond subdivisionInstance.errors, view:'edit'
            return
        }

        subdivisionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Subdivision.label', default: 'Subdivision'), subdivisionInstance.id])
                redirect subdivisionInstance
            }
            '*'{ respond subdivisionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Subdivision subdivisionInstance) {

        if (subdivisionInstance == null) {
            notFound()
            return
        }

        subdivisionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Subdivision.label', default: 'Subdivision'), subdivisionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subdivisionInstance.label', default: 'Subdivision'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
