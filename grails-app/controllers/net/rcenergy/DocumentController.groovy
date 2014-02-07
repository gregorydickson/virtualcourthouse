package net.rcenergy



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	DocumentService documentService
	
	def createDocumentWithChildren(Document documentInstance){
     
		
		
		//document.instrumentType = params.instrumentType
		documentInstance.bookNumber = new Integer (params.bookNumber)
		//document.bookType = new BookTypes(params.bookType)
		documentInstance.pageNumber = new Integer(params.pageNumber)
		documentInstance.instrumentNumber = new String(params.instrumentNumber)
		documentInstance.fileDate = new Date().parse("yyyy-MM-dd", params.fileDate)
		documentInstance.instrumentDate =  new Date().parse("yyyy-MM-dd", params.instrumentDate)
		
		//documentInstance.grantor = params.list('grantor')
		//documentInstance.grantee = params.list('grantee')

		documentInstance.save flush:true
        respond documentInstance, [formats:[ 'json']]
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
		log.error("SAVING")
        if (documentInstance == null) {
            notFound()
            return
        }

       
		log.error("Getting filedate: " + params.fileDate)
		documentInstance.fileDate = new Date().parse("yyyy-MM-dd", params.fileDate)
		log.error("DOCUMENT File Date Is:" + documentInstance.fileDate.toString())
		documentInstance.instrumentDate =  new Date().parse("yyyy-MM-dd", params.instrumentDate)
		documentInstance.grantor = params.list('grantor')
		documentInstance.grantee = params.list('grantee')
        documentInstance.save flush:true
		log.error("SAVED DOCUMENT")
		respond  status: OK
		
		//Only respond with json when saving
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
