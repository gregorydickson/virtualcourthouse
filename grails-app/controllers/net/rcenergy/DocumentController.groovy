package net.rcenergy


import grails.converters.JSON
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentController {

    static allowedMethods = [save: "POST",createDocumentWithChildren: "POST", update: "PUT", delete: "DELETE"]
	DocumentService documentService
	
	@Transactional
	def createDocumentWithChildren(){
     
		
		def input = request.JSON
		println request.JSON as JSON
		println "Here is params: $params"
    	def p = new Document(input)
    	println p
    	if (p.save(flush: true)) {
    		render status: 200, text: 'ok'
    	} else {
    		for (error in p.errors.allErrors) println "$error.field: $error.code"
    		render status: 422, text: 'there are errors'
    	}
	}

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Document.list(params), model:[documentInstanceCount: Document.count()]
    }

    def show(Document documentInstance) {
        respond documentInstance
    }

    def create() {
        respond new Document(params)
    }

    @Transactional
    def save(Document documentInstance) {
    	

		
		if (params.fileDate != ""){
			documentInstance.fileDate =  new Date().parse("yyyy-MM-dd", params.fileDate) 
		}
		if (params.instrumentDate != ""){
			documentInstance.instrumentDate =  new Date().parse("yyyy-MM-dd", params.instrumentDate) 
		}
		if (params.grantor != ""){
			documentInstance.grantor =  params.list('grantor')
		}
		if (params.grantee != ""){
			documentInstance.grantee =  params.list('grantee')
		}
		
		
	    documentInstance.save flush:true
	   		log.debug("SAVED DOCUMENT")
	   		respond  status: OK

	   		//SCAFFOLDED CODE:
	   		//respond documentInstance, [formats:[ 'json']]
	           //request.withFormat {
	           //    form {
	           //        flash.message = message(code: 'default.created.message', args: [message(code: 'documentInstance.label', default: 'Document'), documentInstance.id])
	           //        redirect documentInstance
	           //    }
	           //    '*' { respond documentInstance, [status: CREATED] }
	           //}
		
       
		
		
    }

    def edit(Document documentInstance) {
        respond documentInstance
    }

    @Transactional
    def update(Document documentInstance) {
        if (documentInstance == null) {
            notFound()
            return
        }

        if (documentInstance.hasErrors()) {
            respond documentInstance.errors, view:'edit'
            return
        }

        documentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Document.label', default: 'Document'), documentInstance.id])
                redirect documentInstance
            }
            '*'{ respond documentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Document documentInstance) {

        if (documentInstance == null) {
            notFound()
            return
        }

        documentInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Document.label', default: 'Document'), documentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentInstance.label', default: 'Document'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
