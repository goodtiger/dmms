package dmms



import org.junit.*
import grails.test.mixin.*

@TestFor(TableInfoController)
@Mock(TableInfo)
class TableInfoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tableInfo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tableInfoInstanceList.size() == 0
        assert model.tableInfoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tableInfoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tableInfoInstance != null
        assert view == '/tableInfo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tableInfo/show/1'
        assert controller.flash.message != null
        assert TableInfo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tableInfo/list'

        populateValidParams(params)
        def tableInfo = new TableInfo(params)

        assert tableInfo.save() != null

        params.id = tableInfo.id

        def model = controller.show()

        assert model.tableInfoInstance == tableInfo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tableInfo/list'

        populateValidParams(params)
        def tableInfo = new TableInfo(params)

        assert tableInfo.save() != null

        params.id = tableInfo.id

        def model = controller.edit()

        assert model.tableInfoInstance == tableInfo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tableInfo/list'

        response.reset()

        populateValidParams(params)
        def tableInfo = new TableInfo(params)

        assert tableInfo.save() != null

        // test invalid parameters in update
        params.id = tableInfo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tableInfo/edit"
        assert model.tableInfoInstance != null

        tableInfo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tableInfo/show/$tableInfo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tableInfo.clearErrors()

        populateValidParams(params)
        params.id = tableInfo.id
        params.version = -1
        controller.update()

        assert view == "/tableInfo/edit"
        assert model.tableInfoInstance != null
        assert model.tableInfoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tableInfo/list'

        response.reset()

        populateValidParams(params)
        def tableInfo = new TableInfo(params)

        assert tableInfo.save() != null
        assert TableInfo.count() == 1

        params.id = tableInfo.id

        controller.delete()

        assert TableInfo.count() == 0
        assert TableInfo.get(tableInfo.id) == null
        assert response.redirectedUrl == '/tableInfo/list'
    }
}
