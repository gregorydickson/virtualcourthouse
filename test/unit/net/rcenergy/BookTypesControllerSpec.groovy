package net.rcenergy



import grails.test.mixin.*
import spock.lang.*

@TestFor(BookTypesController)
@Mock(BookTypes)
class BookTypesControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.bookTypesInstanceList
            model.bookTypesInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.bookTypesInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def bookTypes = new BookTypes()
            bookTypes.validate()
            controller.save(bookTypes)

        then:"The create view is rendered again with the correct model"
            model.bookTypesInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            bookTypes = new BookTypes(params)

            controller.save(bookTypes)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/bookTypes/show/1'
            controller.flash.message != null
            BookTypes.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def bookTypes = new BookTypes(params)
            controller.show(bookTypes)

        then:"A model is populated containing the domain instance"
            model.bookTypesInstance == bookTypes
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def bookTypes = new BookTypes(params)
            controller.edit(bookTypes)

        then:"A model is populated containing the domain instance"
            model.bookTypesInstance == bookTypes
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/bookTypes/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def bookTypes = new BookTypes()
            bookTypes.validate()
            controller.update(bookTypes)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.bookTypesInstance == bookTypes

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            bookTypes = new BookTypes(params).save(flush: true)
            controller.update(bookTypes)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/bookTypes/show/$bookTypes.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/bookTypes/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def bookTypes = new BookTypes(params).save(flush: true)

        then:"It exists"
            BookTypes.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(bookTypes)

        then:"The instance is deleted"
            BookTypes.count() == 0
            response.redirectedUrl == '/bookTypes/index'
            flash.message != null
    }
}
