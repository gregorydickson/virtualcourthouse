package net.rcenergy



import static org.springframework.http.HttpStatus.*

import org.springframework.security.core.GrantedAuthority

import grails.plugin.springsecurity.annotation.Secured

import grails.transaction.Transactional

@Transactional(readOnly = true)
class AssignmentController extends ControllerBase {

    static allowedMethods = [work:"GET",save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
		// TODO: handle when multiple roles are present
		// TODO: handle paging 		
		if (hasRole('ROLE_INDEXER')) {
			respond Assignment.findAllByIndexer(currentUser());
		} else if (hasRole('ROLE_REVIEWER')) {
			respond Assignment.findByReviewer(currentUser());
		} else {
        	respond Assignment.list(params), model:[assignmentInstanceCount: Assignment.count()]
		}
    }

    def show(Assignment assignmentInstance) {
        respond assignmentInstance
    }

    def create() {
        respond new Assignment(params)
    }

    @Transactional
    def save(Assignment assignmentInstance) {
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
        respond assignmentInstance
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
