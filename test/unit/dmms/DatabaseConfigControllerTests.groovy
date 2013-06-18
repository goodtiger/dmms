package dmms



import org.junit.*
import grails.test.mixin.*

@TestFor(DatabaseConfigController)
@Mock(DatabaseConfig)
class DatabaseConfigControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/databaseConfig/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.databaseConfigInstanceList.size() == 0
        assert model.databaseConfigInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.databaseConfigInstance != null
    }

    void testSave() {
        controller.save()

        assert model.databaseConfigInstance != null
        assert view == '/databaseConfig/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/databaseConfig/show/1'
        assert controller.flash.message != null
        assert DatabaseConfig.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/databaseConfig/list'

        populateValidParams(params)
        def databaseConfig = new DatabaseConfig(params)

        assert databaseConfig.save() != null

        params.id = databaseConfig.id

        def model = controller.show()

        assert model.databaseConfigInstance == databaseConfig
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/databaseConfig/list'

        populateValidParams(params)
        def databaseConfig = new DatabaseConfig(params)

        assert databaseConfig.save() != null

        params.id = databaseConfig.id

        def model = controller.edit()

        assert model.databaseConfigInstance == databaseConfig
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/databaseConfig/list'

        response.reset()

        populateValidParams(params)
        def databaseConfig = new DatabaseConfig(params)

        assert databaseConfig.save() != null

        // test invalid parameters in update
        params.id = databaseConfig.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/databaseConfig/edit"
        assert model.databaseConfigInstance != null

        databaseConfig.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/databaseConfig/show/$databaseConfig.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        databaseConfig.clearErrors()

        populateValidParams(params)
        params.id = databaseConfig.id
        params.version = -1
        controller.update()

        assert view == "/databaseConfig/edit"
        assert model.databaseConfigInstance != null
        assert model.databaseConfigInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/databaseConfig/list'

        response.reset()

        populateValidParams(params)
        def databaseConfig = new DatabaseConfig(params)

        assert databaseConfig.save() != null
        assert DatabaseConfig.count() == 1

        params.id = databaseConfig.id

        controller.delete()

        assert DatabaseConfig.count() == 0
        assert DatabaseConfig.get(databaseConfig.id) == null
        assert response.redirectedUrl == '/databaseConfig/list'
    }
}
