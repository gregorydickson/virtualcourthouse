package net.rcenergy



import grails.test.mixin.*
import spock.lang.*

@TestFor(InstrumentTypesController)
@Mock(InstrumentTypes)
class InstrumentTypesControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.instrumentTypesInstanceList
            model.instrumentTypesInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.instrumentTypesInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def instrumentTypes = new InstrumentTypes()
            instrumentTypes.validate()
            controller.save(instrumentTypes)

        then:"The create view is rendered again with the correct model"
            model.instrumentTypesInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            instrumentTypes = new InstrumentTypes(params)

            controller.save(instrumentTypes)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/instrumentTypes/show/1'
            controller.flash.message != null
            InstrumentTypes.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def instrumentTypes = new InstrumentTypes(params)
            controller.show(instrumentTypes)

        then:"A model is populated containing the domain instance"
            model.instrumentTypesInstance == instrumentTypes
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def instrumentTypes = new InstrumentTypes(params)
            controller.edit(instrumentTypes)

        then:"A model is populated containing the domain instance"
            model.instrumentTypesInstance == instrumentTypes
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/instrumentTypes/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def instrumentTypes = new InstrumentTypes()
            instrumentTypes.validate()
            controller.update(instrumentTypes)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.instrumentTypesInstance == instrumentTypes

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            instrumentTypes = new InstrumentTypes(params).save(flush: true)
            controller.update(instrumentTypes)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/instrumentTypes/show/$instrumentTypes.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/instrumentTypes/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def instrumentTypes = new InstrumentTypes(params).save(flush: true)

        then:"It exists"
            InstrumentTypes.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(instrumentTypes)

        then:"The instance is deleted"
            InstrumentTypes.count() == 0
            response.redirectedUrl == '/instrumentTypes/index'
            flash.message != null
    }
}
