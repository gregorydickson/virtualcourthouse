package net.rcenergy



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InstrumentTypesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", ajaxsave: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond InstrumentTypes.list(params), model:[instrumentTypesInstanceCount: InstrumentTypes.count()]
    }

    def show(InstrumentTypes instrumentTypesInstance) {
        respond instrumentTypesInstance
    }

    def create() {
		log.info("PARAMS: " + params)
		log.info("INstrumentType: " + params.instrumentType)
		log.info("class: " + params.class)
		log.info("VALUE: " + params.value)
        respond new InstrumentTypes(params)
    }

    @Transactional
    def save(InstrumentTypes instrumentTypesInstance) {
        if (instrumentTypesInstance == null) {
            notFound()
            return
        }

        if (instrumentTypesInstance.hasErrors()) {
            respond instrumentTypesInstance.errors, view:'create'
            return
        }

        instrumentTypesInstance.save flush:true
		respond instrumentTypesInstance, [formats:[ 'json']]
        //request.withFormat {
        //    form {
        //        flash.message = message(code: 'default.created.message', args: [message(code: 'instrumentTypesInstance.label', default: 'InstrumentTypes'), instrumentTypesInstance.id])
        //        redirect instrumentTypesInstance
       //     }
        //    '*' { respond instrumentTypesInstance, [status: CREATED] }
       // }
    }

    def edit(InstrumentTypes instrumentTypesInstance) {
        respond instrumentTypesInstance
    }

    @Transactional
    def update(InstrumentTypes instrumentTypesInstance) {
        if (instrumentTypesInstance == null) {
            notFound()
            return
        }

        if (instrumentTypesInstance.hasErrors()) {
            respond instrumentTypesInstance.errors, view:'edit'
            return
        }

        instrumentTypesInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'InstrumentTypes.label', default: 'InstrumentTypes'), instrumentTypesInstance.id])
                redirect instrumentTypesInstance
            }
            '*'{ respond instrumentTypesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(InstrumentTypes instrumentTypesInstance) {

        if (instrumentTypesInstance == null) {
            notFound()
            return
        }

        instrumentTypesInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'InstrumentTypes.label', default: 'InstrumentTypes'), instrumentTypesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'instrumentTypesInstance.label', default: 'InstrumentTypes'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
