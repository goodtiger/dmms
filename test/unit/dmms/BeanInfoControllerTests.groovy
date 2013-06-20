package dmms



import org.junit.*
import grails.test.mixin.*

@TestFor(BeanInfoController)
@Mock(BeanInfo)
class BeanInfoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/beanInfo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.beanInfoInstanceList.size() == 0
        assert model.beanInfoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.beanInfoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.beanInfoInstance != null
        assert view == '/beanInfo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/beanInfo/show/1'
        assert controller.flash.message != null
        assert BeanInfo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/beanInfo/list'

        populateValidParams(params)
        def beanInfo = new BeanInfo(params)

        assert beanInfo.save() != null

        params.id = beanInfo.id

        def model = controller.show()

        assert model.beanInfoInstance == beanInfo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/beanInfo/list'

        populateValidParams(params)
        def beanInfo = new BeanInfo(params)

        assert beanInfo.save() != null

        params.id = beanInfo.id

        def model = controller.edit()

        assert model.beanInfoInstance == beanInfo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/beanInfo/list'

        response.reset()

        populateValidParams(params)
        def beanInfo = new BeanInfo(params)

        assert beanInfo.save() != null

        // test invalid parameters in update
        params.id = beanInfo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/beanInfo/edit"
        assert model.beanInfoInstance != null

        beanInfo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/beanInfo/show/$beanInfo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        beanInfo.clearErrors()

        populateValidParams(params)
        params.id = beanInfo.id
        params.version = -1
        controller.update()

        assert view == "/beanInfo/edit"
        assert model.beanInfoInstance != null
        assert model.beanInfoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/beanInfo/list'

        response.reset()

        populateValidParams(params)
        def beanInfo = new BeanInfo(params)

        assert beanInfo.save() != null
        assert BeanInfo.count() == 1

        params.id = beanInfo.id

        controller.delete()

        assert BeanInfo.count() == 0
        assert BeanInfo.get(beanInfo.id) == null
        assert response.redirectedUrl == '/beanInfo/list'
    }
}
