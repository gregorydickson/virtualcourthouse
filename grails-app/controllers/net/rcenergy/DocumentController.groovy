package net.rcenergy


import grails.converters.JSON
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentController extends ControllerBase {

    static allowedMethods = [create:"GET",submitDocumentIndexer:"POST",createDocumentIndexer: "POST", updateDocumentIndexer: "POST"]
	
	
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
        if (SpringSecurityUtils.ifAllGranted('ROLE_INDEXER')) {
            respond Document.findAllByIndexer(currentUser());
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_REVIEWER')) {
            respond Document.findByReviewer(currentUser());
        } else {
            respond Document.list(params), model:[documentInstanceCount: Document.count()]
        }
        
    }

    def review(Document documentInstance) {
        respond documentInstance
    }
    def audit() {
		println params
		def doc = Document.get(params.id)
		def list = Document.getAll(doc.indexerVersionId, doc.id )
		render(view:"/document/audit",  model: [documentInstanceList: list])
         
    }	

    @Transactional
    def create(Document documentInstance) {
       def user = springSecurityService.currentUser
       def assignment =  user.currentAssignment
       println "assignment: " + assignment.id
       
       
       render(view:"/document/create", model: [assignmentInstance: assignment,documentInstance: documentInstance ])
    }

   
    def edit(Document documentInstance) {
        respond documentInstance
    }
    @Transactional
    def updateDocumentReviewer() {
		println "Here is request.JSON: ${request.JSON as JSON}"
		println "Here is params: $params"
		def input = request.JSON
		def doc = Document.get(input.id)
		
		doc.properties = input
        doc.save flush:true

     
        respond doc, [formats:[ 'json']]
      
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
    def submitDocumentIndexer() {
		println "Here is request.JSON: ${request.JSON as JSON}"
		println "Here is params: $params"
		
		//update the existing doc
		def input = request.JSON
		def doc = Document.get(input.id)
		doc.properties = input
		doc.isIndexerFinal = true
		//create the review copy
		def reviewerDocumentCopy = new Document(input)
		reviewerDocumentCopy.isReviewerCopy = true
		reviewerDocumentCopy.indexerVersionId = doc.id
		reviewerDocumentCopy.save flush:true
		//get the reviewer copy id
		doc.reviewerVersionId = reviewerDocumentCopy.id
     	
		doc.save flush:true
        respond doc, [formats:[ 'json']]
      
    }

    @Transactional
    def updateAssignment(Document document){
        def user = springSecurityService.currentUser
        def assignment =  user.currentAssignment
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
