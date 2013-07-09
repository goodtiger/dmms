package dmms

import org.springframework.dao.DataIntegrityViolationException

class TableInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tableInfoInstanceList: TableInfo.list(params), tableInfoInstanceTotal: TableInfo.count()]
    }
	
	def export(Long id){
		def headers = ['Name', 'Description', 'Valid Till', 'Product Number', 'Price']
		def withProperties = ['name', 'description', 'validTill', 'productNumber', 'price.value']
	}

    def create() {
        [tableInfoInstance: new TableInfo(params)]
    }

    def save() {
        def tableInfoInstance = new TableInfo(params)
        if (!tableInfoInstance.save(flush: true)) {
            render(view: "create", model: [tableInfoInstance: tableInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tableInfo.label', default: 'TableInfo'), tableInfoInstance.id])
        redirect(action: "show", id: tableInfoInstance.id)
    }

    def show(Long id) {
        def tableInfoInstance = TableInfo.get(id)
        if (!tableInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tableInfo.label', default: 'TableInfo'), id])
            redirect(action: "list")
            return
        }

        [tableInfoInstance: tableInfoInstance]
    }

    def edit(Long id) {
        def tableInfoInstance = TableInfo.get(id)
        if (!tableInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tableInfo.label', default: 'TableInfo'), id])
            redirect(action: "list")
            return
        }

        [tableInfoInstance: tableInfoInstance]
    }

    def update(Long id, Long version) {
        def tableInfoInstance = TableInfo.get(id)
        if (!tableInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tableInfo.label', default: 'TableInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tableInfoInstance.version > version) {
                tableInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tableInfo.label', default: 'TableInfo')] as Object[],
                          "Another user has updated this TableInfo while you were editing")
                render(view: "edit", model: [tableInfoInstance: tableInfoInstance])
                return
            }
        }

        tableInfoInstance.properties = params

        if (!tableInfoInstance.save(flush: true)) {
            render(view: "edit", model: [tableInfoInstance: tableInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tableInfo.label', default: 'TableInfo'), tableInfoInstance.id])
        redirect(action: "show", id: tableInfoInstance.id)
    }

    def delete(Long id) {
        def tableInfoInstance = TableInfo.get(id)
        if (!tableInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tableInfo.label', default: 'TableInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            tableInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tableInfo.label', default: 'TableInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tableInfo.label', default: 'TableInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}
