package dmms

import org.springframework.dao.DataIntegrityViolationException

class ColumnInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [columnInfoInstanceList: ColumnInfo.list(params), columnInfoInstanceTotal: ColumnInfo.count()]
    }

    def create() {
        [columnInfoInstance: new ColumnInfo(params)]
    }

    def save() {
        def columnInfoInstance = new ColumnInfo(params)
        if (!columnInfoInstance.save(flush: true)) {
            render(view: "create", model: [columnInfoInstance: columnInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'columnInfo.label', default: 'ColumnInfo'), columnInfoInstance.id])
        redirect(action: "show", id: columnInfoInstance.id)
    }

    def show(Long id) {
        def columnInfoInstance = ColumnInfo.get(id)
        if (!columnInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'columnInfo.label', default: 'ColumnInfo'), id])
            redirect(action: "list")
            return
        }

        [columnInfoInstance: columnInfoInstance]
    }

    def edit(Long id) {
        def columnInfoInstance = ColumnInfo.get(id)
        if (!columnInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'columnInfo.label', default: 'ColumnInfo'), id])
            redirect(action: "list")
            return
        }

        [columnInfoInstance: columnInfoInstance]
    }

    def update(Long id, Long version) {
        def columnInfoInstance = ColumnInfo.get(id)
        if (!columnInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'columnInfo.label', default: 'ColumnInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (columnInfoInstance.version > version) {
                columnInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'columnInfo.label', default: 'ColumnInfo')] as Object[],
                          "Another user has updated this ColumnInfo while you were editing")
                render(view: "edit", model: [columnInfoInstance: columnInfoInstance])
                return
            }
        }

        columnInfoInstance.properties = params

        if (!columnInfoInstance.save(flush: true)) {
            render(view: "edit", model: [columnInfoInstance: columnInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'columnInfo.label', default: 'ColumnInfo'), columnInfoInstance.id])
        redirect(action: "show", id: columnInfoInstance.id)
    }

    def delete(Long id) {
        def columnInfoInstance = ColumnInfo.get(id)
        if (!columnInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'columnInfo.label', default: 'ColumnInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            columnInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'columnInfo.label', default: 'ColumnInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'columnInfo.label', default: 'ColumnInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}
