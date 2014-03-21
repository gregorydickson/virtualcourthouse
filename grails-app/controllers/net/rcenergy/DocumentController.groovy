package net.rcenergy


import grails.converters.JSON
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentController extends ControllerBase {

    static allowedMethods = [create:"GET",submitDocumentIndexer:"POST",createDocumentIndexer: "POST", updateDocumentIndexer: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if (SpringSecurityUtils.ifAllGranted('ROLE_INDEXER')) {

            println "Getting Documents for Indexer"
            def results = Document.findAllByIndexer(currentUser()) {
                isIndexerFinal = false
            }
            respond results
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_REVIEWER')) {
            def results = Document.findByReviewer(currentUser()) {
                reviewFinal = false
            }
            respond results
        } else {
            respond Document.list(params), model:[documentInstanceCount: Document.count()]
        }
        
    }

    def review(Document documentInstance) {
        respond documentInstance
    }

    def audit() {
		def doc = Document.get(params.id)
		def list = Document.getAll(doc.indexerVersionId, doc.id )
		render(view:"/document/audit",  model: [documentInstanceList: list])
    }	

    @Transactional
    def create(Document documentInstance) {
       def user = springSecurityService.currentUser
       def assignment =  user.currentAssignment
       render(view:"/document/create", model: [assignmentInstance: assignment,documentInstance: documentInstance ])
    }

    def edit(Document documentInstance) {
        def user = springSecurityService.currentUser
        def assignmentInstance =  user.currentAssignment
        render(view:"/document/create", model: [assignmentInstance: assignmentInstance,documentInstance: documentInstance ])
    }

    @Transactional
    def updateDocumentReviewer() {
		println "update Document Reviewer"
        println "Here is request.JSON: ${request.JSON as JSON}"
		println "Here is params: $params"
		def input = request.JSON
		def doc = Document.get(input.id)
		doc.properties = input
        doc.save flush:true
        def indexerCopy = Document.get(doc.indexerVersionId)
        auditReview(indexerCopy, doc)
        respond doc, [formats:[ 'json']]
    }
    @Transactional
    def submitDocumentReviewer() {
        println "update Document Reviewer"
        println "Here is request.JSON: ${request.JSON as JSON}"
        println "Here is params: $params"
        def input = request.JSON
        def doc = Document.get(input.id)
        doc.properties = input
        doc.reviewFinal = true
        doc.save flush:true
        respond doc, [formats:[ 'json']]
    }

    @Transactional
    def createDocumentIndexer(){
        def input = request.JSON
        def user = springSecurityService.currentUser
        def assignment =  user.currentAssignment
        def aJSONArray = input.optJSONArray('imagesRemaining')
        def imagesList = Image.getAll(aJSONArray)
        assignment.imagesRemaining = imagesList
        assignment.started = true
        input.remove('imagesRemaining')
        def document = new Document(input)
        document.indexer = user
        if (document.save(flush: true)) {
            assignment.save flush:true
            respond document, [formats:[ 'json']]
        } else {
            for (error in p.errors.allErrors) println "$error.field: $error.code"
            render status: 422, text: 'there are errors'
        }
    }

    @Transactional
    def updateDocumentIndexer() {
		def input = request.JSON
        def aJSONArray = input.optJSONArray('imagesRemaining')
        def imagesList = Image.getAll(aJSONArray)
        def user = springSecurityService.currentUser
        def assignment =  user.currentAssignment
		assignment.imagesRemaining = imagesList
        input.remove('imagesRemaining')
        def doc = Document.get(input.id)
		doc.properties = input
        doc.save flush:true
        assignment.save flush:true
        respond doc, [formats:[ 'json']]
    }

    @Transactional
    def submitDocumentIndexer() {
		def input = request.JSON
        def aJSONArray = input.optJSONArray('imagesRemaining')
        def imagesList = Image.getAll(aJSONArray)
        def user = springSecurityService.currentUser
        def assignment =  user.currentAssignment
        assignment.imagesRemaining = imagesList
        input.remove('imagesRemaining')
		def doc = Document.get(input.id)
		doc.properties = input
		doc.isIndexerFinal = true
		def reviewerDocumentCopy = new Document(input)
		reviewerDocumentCopy.isReviewerCopy = true
		reviewerDocumentCopy.indexerVersionId = doc.id
		reviewerDocumentCopy.save flush:true
		doc.reviewerVersionId = reviewerDocumentCopy.id
		doc.save flush:true
        assignment.save flush:true
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


    def auditReview(indexerCopy, reviewerDocumentCopy){
        def auditCount = 0
        if (indexerCopy.fileDate != reviewerDocumentCopy.fileDate)  {
            auditCount++
        }
        if (indexerCopy.instrumentDate != reviewerDocumentCopy.instrumentDate)  {
            auditCount++
        }
        if (indexerCopy.grantor.sort() != reviewerDocumentCopy.grantor.sort())  {
            auditCount++
        }
        if (indexerCopy.grantee.sort() != reviewerDocumentCopy.grantee.sort())  {
            auditCount++
        }
        if (indexerCopy.legalDescriptionCitySubBlkLot.sort() != reviewerDocumentCopy.legalDescriptionCitySubBlkLot.sort())  {
            auditCount++
            println "City Sub Block Lot Audit change"
        }

    }
}
