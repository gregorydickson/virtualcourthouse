package net.rcenergy


import grails.converters.JSON
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentController {

    static allowedMethods = [ createDocumentIndexer: "POST", updateDocumentIndexer: "POST"]
	
	
	@Transactional
	def createDocumentIndexer(){
     
		
		def input = request.JSON
		println "Here is request.JSON: ${request.JSON as JSON}"
		println "Here is params: $params"
    	def p = new Document(input)
    	println p
    	if (p.save(flush: true)) {
    		//render status: 200, text: 'ok'
			respond p, [formats:[ 'json']]
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
    	

		def input = request.JSON
		println "Here is request.JSON: ${request.JSON as JSON}"
		println "Here is params: $params"
    	def p = new Document(input)
    	println p
    	if (p.save(flush: true)) {
    		respond p as JSON
    	} else {
    		for (error in p.errors.allErrors) println "$error.field: $error.code"
    		render status: 422, text: 'there are errors'
    	}

		
		
	   // documentInstance.save flush:true
	   //		log.debug("SAVED DOCUMENT")
	   //		respond  status: OK

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
    def updateDocumentIndexer() {
		println "Here is request.JSON: ${request.JSON as JSON}"
		println "Here is params: $params"
		def input = request.JSON
		def doc = Document.get(input.id)
		
		doc.properties = input
        doc.save flush:true

     
        respond doc, [formats:[ 'json']]
      
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
