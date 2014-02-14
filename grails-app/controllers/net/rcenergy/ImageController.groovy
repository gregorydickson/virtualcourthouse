package net.rcenergy



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ImageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Image.list(params), model:[imageInstanceCount: Image.count()]
    }

    def show(Image imageInstance) {
        respond imageInstance
    }
	def viewImage (){

	      def image_record = Image.get( params.id )
	      byte[] an_image = image_record.image 
		  //response.setHeader('Content-length', an_image.length)
		  response.contentType = 'image/tiff' // or the appropriate image content type
		  response.outputStream << an_image
		  //response.outputStream.flush()
	} 
    def create() {
        respond new Image(params)
    }

    @Transactional
    def save(Image imageInstance) {
        if (imageInstance == null) {
            notFound()
            return
        }

        if (imageInstance.hasErrors()) {
            respond imageInstance.errors, view:'create'
            return
        }

        imageInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'imageInstance.label', default: 'Image'), imageInstance.id])
                redirect imageInstance
            }
            '*' { respond imageInstance, [status: CREATED] }
        }
    }

    def edit(Image imageInstance) {
        respond imageInstance
    }

    @Transactional
    def update(Image imageInstance) {
        if (imageInstance == null) {
            notFound()
            return
        }

        if (imageInstance.hasErrors()) {
            respond imageInstance.errors, view:'edit'
            return
        }

        imageInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Image.label', default: 'Image'), imageInstance.id])
                redirect imageInstance
            }
            '*'{ respond imageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Image imageInstance) {

        if (imageInstance == null) {
            notFound()
            return
        }

        imageInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Image.label', default: 'Image'), imageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'imageInstance.label', default: 'Image'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
