package dmms



import org.junit.*
import grails.test.mixin.*

@TestFor(TableMappingController)
@Mock(TableMapping)
class TableMappingControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tableMapping/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tableMappingInstanceList.size() == 0
        assert model.tableMappingInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tableMappingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tableMappingInstance != null
        assert view == '/tableMapping/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tableMapping/show/1'
        assert controller.flash.message != null
        assert TableMapping.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tableMapping/list'

        populateValidParams(params)
        def tableMapping = new TableMapping(params)

        assert tableMapping.save() != null

        params.id = tableMapping.id

        def model = controller.show()

        assert model.tableMappingInstance == tableMapping
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tableMapping/list'

        populateValidParams(params)
        def tableMapping = new TableMapping(params)

        assert tableMapping.save() != null

        params.id = tableMapping.id

        def model = controller.edit()

        assert model.tableMappingInstance == tableMapping
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tableMapping/list'

        response.reset()

        populateValidParams(params)
        def tableMapping = new TableMapping(params)

        assert tableMapping.save() != null

        // test invalid parameters in update
        params.id = tableMapping.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tableMapping/edit"
        assert model.tableMappingInstance != null

        tableMapping.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tableMapping/show/$tableMapping.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tableMapping.clearErrors()

        populateValidParams(params)
        params.id = tableMapping.id
        params.version = -1
        controller.update()

        assert view == "/tableMapping/edit"
        assert model.tableMappingInstance != null
        assert model.tableMappingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tableMapping/list'

        response.reset()

        populateValidParams(params)
        def tableMapping = new TableMapping(params)

        assert tableMapping.save() != null
        assert TableMapping.count() == 1

        params.id = tableMapping.id

        controller.delete()

        assert TableMapping.count() == 0
        assert TableMapping.get(tableMapping.id) == null
        assert response.redirectedUrl == '/tableMapping/list'
    }
}
