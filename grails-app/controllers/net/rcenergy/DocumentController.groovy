package net.rcenergy


import grails.converters.JSON
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentController extends ControllerBase {

    static allowedMethods = [images:"GET",create:"GET",submitDocumentIndexer:"POST",createDocumentIndexer: "POST", updateDocumentIndexer: "POST"]
    
    def images(Document documentInstance) {
        respond documentInstance
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if (SpringSecurityUtils.ifAllGranted('ROLE_INDEXER')) {
           def query = Document.where {
                indexer == currentUser() && isIndexerFinal == false && isReviewerCopy == false
            }
            def results = query.list()
            println "Getting Documents for Indexer"
            respond results
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_REVIEWER')) {
            def currentAssignment = currentUser().currentAssignment
            println "assignment " + currentAssignment
            def results = Document.findAllByAssignmentAndReviewFinalAndIsReviewerCopy(currentAssignment,false, true ) 
            
            println "Getting Documents for Reviewer results: " + results
            respond results
        } else if (SpringSecurityUtils.ifAllGranted('ROLE_SUPERVISOR')) {
            def query = Document.where {
                supervisor == currentUser()
            }
            def results = query.list()
            println "Getting Documents for super"
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
       println"Document controller CREATE assignment is: " + assignment
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
        def indexerCopy = Document.get(doc.indexerVersionId)
        doc.numberOfChangesReview = auditReview(indexerCopy, doc)
        doc.save flush:true
        respond doc, [formats:[ 'json']]
    }
    @Transactional
    def submitDocumentReviewer() {
        println "SUBMIT Document Reviewer"
        println "Here is request.JSON: ${request.JSON as JSON}"
        println "Here is params: $params"
        def input = request.JSON
        def doc = Document.get(input.id)
        def indexerCopy = Document.get(doc.indexerVersionId)
        doc.properties = input
        doc.numberOfChangesReview = auditReview(indexerCopy, doc)
        doc.reviewFinal = true
        doc.save flush:true
        respond doc, [formats:[ 'json']]
    }

    @Transactional
    def createDocumentIndexer(){
        def input = request.JSON
        def user = currentUser()
        def assignment =  user.currentAssignment
        def aJSONArray = input.optJSONArray('imagesRemaining')
        def imagesList = Image.getAll(aJSONArray)
        assignment.imagesRemaining = imagesList
        assignment.indexStarted = true
        input.remove('imagesRemaining')
        def document = new Document(input)
        document.assignment = assignment
        document.indexer = user
        if (document.save(flush: true)) {
            assignment.save flush:true
            respond document, [formats:[ 'json']]
        } else {
            for (error in document.errors.allErrors) println "$error.field: $error.code"
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
        reviewerDocumentCopy.assignment = user.currentAssignment
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
        if ((indexerCopy.fileDate <=> reviewerDocumentCopy.fileDate) != 0)  {
            auditCount++
            println "Audit change fileDate, auditCount = " + auditCount
        }
        if ((indexerCopy.instrumentDate <=> reviewerDocumentCopy.instrumentDate) != 0)  {
            auditCount++
            println "Audit change instrumentDate, auditCount = " + auditCount
        }
        if ((indexerCopy.instrumentNumber <=> reviewerDocumentCopy.instrumentNumber) != 0)  {
            auditCount++
            println "Audit change instrumentNumber, auditCount = " + auditCount
        }
        if ((indexerCopy.pageNumber <=> reviewerDocumentCopy.pageNumber) != 0)  {
            auditCount++
            println "Audit change pageNumber, auditCount = " + auditCount
        }
        if (indexerCopy.grantor.sort() != reviewerDocumentCopy.grantor.sort())  {
            auditCount++
            println "Audit change grantor, auditCount = " + auditCount
        }
        if (indexerCopy.grantee.sort() != reviewerDocumentCopy.grantee.sort())  {
            auditCount++
            println "Audit change grantee, auditCount = " + auditCount
        }
        if (indexerCopy.images.sort() != reviewerDocumentCopy.images.sort())  {
            auditCount++
            println "Audit change images, auditCount = " + auditCount
        }
        if (indexerCopy.parentDocument.size() != reviewerDocumentCopy.parentDocument.size())  {
            auditCount++
            println "Audit change Related Documents Diff size, auditCount = " + auditCount
        } else  {
            for(int i =0; i < indexerCopy.parentDocument.size(); i++) {
                if (indexerCopy.parentDocument[i].compareTo(reviewerDocumentCopy.parentDocument[i])  != 0) {
                    auditCount++
                    println "Audit change Related Documents text DIFF, auditCount = " + auditCount
                    break
                } 
            } 
        }

        if (indexerCopy.legalDescriptionCitySubBlkLot.size() != reviewerDocumentCopy.legalDescriptionCitySubBlkLot.size())  {
            auditCount++
            println "Audit change CITYSUBBLKLOT Diff size, auditCount = " + auditCount
            return auditCount
        } else  {
            for(int i =0; i < indexerCopy.legalDescriptionCitySubBlkLot.size(); i++) {
                if (indexerCopy.legalDescriptionCitySubBlkLot[i].compareTo(reviewerDocumentCopy.legalDescriptionCitySubBlkLot[i])  != 0) {
                    auditCount++
                    println "Audit change CITYSUBBLKLOT text DIFF, auditCount = " + auditCount
                    return auditCount
                    break
                } 
            } 
        }
        if (indexerCopy.legalDescriptionSecTwnRge.size() != reviewerDocumentCopy.legalDescriptionSecTwnRge.size())  {
            auditCount++
            println "Audit change SecTwnRge Diff size, auditCount = " + auditCount
            return auditCount
        } else  {
            for(int i =0; i < indexerCopy.legalDescriptionSecTwnRge.size(); i++) {
                if (indexerCopy.legalDescriptionSecTwnRge[i].compareTo(reviewerDocumentCopy.legalDescriptionSecTwnRge[i])  != 0) {
                    auditCount++
                    println "Audit change CITYSUBBLKLOT text DIFF, auditCount = " + auditCount
                    return auditCount
                    break
                } 
            } 
        }
        if (indexerCopy.legalDescriptionSurveyAbstract.size() != reviewerDocumentCopy.legalDescriptionSurveyAbstract.size())  {
            auditCount++
            println "Audit change SurveyAbstract Diff size, auditCount = " + auditCount
            return auditCount
        } else  {
            for(int i =0; i < indexerCopy.legalDescriptionSurveyAbstract.size(); i++) {
                if (indexerCopy.legalDescriptionSurveyAbstract[i].compareTo(reviewerDocumentCopy.legalDescriptionSurveyAbstract[i])  != 0) {
                    auditCount++
                    println "Audit change Survey Abstract text DIFF, auditCount = " + auditCount
                    return auditCount
                    break
                } 
            } 
        }       
        if (indexerCopy.legalDescriptionTaxMapParcel.size() != reviewerDocumentCopy.legalDescriptionTaxMapParcel.size())  {
            auditCount++
            println "Audit change Tax Map Parcel Diff size, auditCount = " + auditCount
            return auditCount
        } else  {
            for(int i =0; i < indexerCopy.legalDescriptionTaxMapParcel.size(); i++) {
                if (indexerCopy.legalDescriptionTaxMapParcel[i].compareTo(reviewerDocumentCopy.legalDescriptionTaxMapParcel[i])  != 0) {
                    auditCount++
                    println "Audit change Tax Map Parceltext DIFF, auditCount = " + auditCount
                    return auditCount
                    break
                } 
            } 
        }  

        return auditCount
    }
}