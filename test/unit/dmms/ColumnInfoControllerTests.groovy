package dmms



import org.junit.*
import grails.test.mixin.*

@TestFor(ColumnInfoController)
@Mock(ColumnInfo)
class ColumnInfoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/columnInfo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.columnInfoInstanceList.size() == 0
        assert model.columnInfoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.columnInfoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.columnInfoInstance != null
        assert view == '/columnInfo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/columnInfo/show/1'
        assert controller.flash.message != null
        assert ColumnInfo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/columnInfo/list'

        populateValidParams(params)
        def columnInfo = new ColumnInfo(params)

        assert columnInfo.save() != null

        params.id = columnInfo.id

        def model = controller.show()

        assert model.columnInfoInstance == columnInfo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/columnInfo/list'

        populateValidParams(params)
        def columnInfo = new ColumnInfo(params)

        assert columnInfo.save() != null

        params.id = columnInfo.id

        def model = controller.edit()

        assert model.columnInfoInstance == columnInfo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/columnInfo/list'

        response.reset()

        populateValidParams(params)
        def columnInfo = new ColumnInfo(params)

        assert columnInfo.save() != null

        // test invalid parameters in update
        params.id = columnInfo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/columnInfo/edit"
        assert model.columnInfoInstance != null

        columnInfo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/columnInfo/show/$columnInfo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        columnInfo.clearErrors()

        populateValidParams(params)
        params.id = columnInfo.id
        params.version = -1
        controller.update()

        assert view == "/columnInfo/edit"
        assert model.columnInfoInstance != null
        assert model.columnInfoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/columnInfo/list'

        response.reset()

        populateValidParams(params)
        def columnInfo = new ColumnInfo(params)

        assert columnInfo.save() != null
        assert ColumnInfo.count() == 1

        params.id = columnInfo.id

        controller.delete()

        assert ColumnInfo.count() == 0
        assert ColumnInfo.get(columnInfo.id) == null
        assert response.redirectedUrl == '/columnInfo/list'
    }
}
