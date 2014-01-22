package net.rcenergy



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BookTypesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BookTypes.list(params), model:[bookTypesInstanceCount: BookTypes.count()]
    }

    def show(BookTypes bookTypesInstance) {
        respond bookTypesInstance
    }

    def create() {
        respond new BookTypes(params)
    }

    @Transactional
    def save(BookTypes bookTypesInstance) {
        if (bookTypesInstance == null) {
            notFound()
            return
        }

        if (bookTypesInstance.hasErrors()) {
            respond bookTypesInstance.errors, view:'create'
            return
        }

        bookTypesInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bookTypesInstance.label', default: 'BookTypes'), bookTypesInstance.id])
                redirect bookTypesInstance
            }
            '*' { respond bookTypesInstance, [status: CREATED] }
        }
    }

    def edit(BookTypes bookTypesInstance) {
        respond bookTypesInstance
    }

    @Transactional
    def update(BookTypes bookTypesInstance) {
        if (bookTypesInstance == null) {
            notFound()
            return
        }

        if (bookTypesInstance.hasErrors()) {
            respond bookTypesInstance.errors, view:'edit'
            return
        }

        bookTypesInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BookTypes.label', default: 'BookTypes'), bookTypesInstance.id])
                redirect bookTypesInstance
            }
            '*'{ respond bookTypesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BookTypes bookTypesInstance) {

        if (bookTypesInstance == null) {
            notFound()
            return
        }

        bookTypesInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BookTypes.label', default: 'BookTypes'), bookTypesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookTypesInstance.label', default: 'BookTypes'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
