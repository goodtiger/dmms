package dmms



import org.junit.*
import grails.test.mixin.*

@TestFor(ColumnMappingController)
@Mock(ColumnMapping)
class ColumnMappingControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/columnMapping/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.columnMappingInstanceList.size() == 0
        assert model.columnMappingInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.columnMappingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.columnMappingInstance != null
        assert view == '/columnMapping/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/columnMapping/show/1'
        assert controller.flash.message != null
        assert ColumnMapping.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/columnMapping/list'

        populateValidParams(params)
        def columnMapping = new ColumnMapping(params)

        assert columnMapping.save() != null

        params.id = columnMapping.id

        def model = controller.show()

        assert model.columnMappingInstance == columnMapping
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/columnMapping/list'

        populateValidParams(params)
        def columnMapping = new ColumnMapping(params)

        assert columnMapping.save() != null

        params.id = columnMapping.id

        def model = controller.edit()

        assert model.columnMappingInstance == columnMapping
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/columnMapping/list'

        response.reset()

        populateValidParams(params)
        def columnMapping = new ColumnMapping(params)

        assert columnMapping.save() != null

        // test invalid parameters in update
        params.id = columnMapping.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/columnMapping/edit"
        assert model.columnMappingInstance != null

        columnMapping.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/columnMapping/show/$columnMapping.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        columnMapping.clearErrors()

        populateValidParams(params)
        params.id = columnMapping.id
        params.version = -1
        controller.update()

        assert view == "/columnMapping/edit"
        assert model.columnMappingInstance != null
        assert model.columnMappingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/columnMapping/list'

        response.reset()

        populateValidParams(params)
        def columnMapping = new ColumnMapping(params)

        assert columnMapping.save() != null
        assert ColumnMapping.count() == 1

        params.id = columnMapping.id

        controller.delete()

        assert ColumnMapping.count() == 0
        assert ColumnMapping.get(columnMapping.id) == null
        assert response.redirectedUrl == '/columnMapping/list'
    }
}
