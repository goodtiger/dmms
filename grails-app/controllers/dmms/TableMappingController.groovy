package dmms

import org.springframework.dao.DataIntegrityViolationException

class TableMappingController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def listTables(){
		[tables: TableInfo.list()]
	}

	def saveMapping(){
		TableInfo sourceTable = TableInfo.get(params.get("sourceTable").toLong())
		TableInfo targetTable = TableInfo.get(params.get("targetTable").toLong())
		if (!sourceTable || !targetTable) {
			flash.message = message(code: 'default.not.found.message')
			redirect(action: "listTables")
			return
		}
		TableMapping tableMapping = TableMapping.findBySourceTableIdAndTargetTableId(sourceTable.id,targetTable.id) ?: new TableMapping()
		tableMapping.memo="Auto:" +sourceTable.name +"-"+targetTable.name
		tableMapping.sourceTableId = sourceTable.id
		tableMapping.sourceTableName = sourceTable.name
		tableMapping.sourceTableMemo = sourceTable.memo
		tableMapping.sourceTableRemarks = sourceTable.remarks
		tableMapping.sourceTableType = sourceTable.tableType
		tableMapping.targetTableId = targetTable.id
		tableMapping.targetTabelName = targetTable.name
		tableMapping.targetTableMemo = targetTable.memo
		tableMapping.targetTableRemarks = targetTable.remarks
		tableMapping.targetTableType =targetTable.tableType
		tableMapping.save(flush: true)
		redirect(action: "show", id: tableMapping.id)
	}

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[tableMappingInstanceList: TableMapping.list(params), tableMappingInstanceTotal: TableMapping.count()]
	}

	def create() {
		[tableMappingInstance: new TableMapping(params)]
	}

	def save() {
		def tableMappingInstance = new TableMapping(params)
		if (!tableMappingInstance.save(flush: true)) {
			render(view: "create", model: [tableMappingInstance: tableMappingInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'tableMapping.label', default: 'TableMapping'),
			tableMappingInstance.id
		])
		redirect(action: "show", id: tableMappingInstance.id)
	}

	def show(Long id) {
		def tableMappingInstance = TableMapping.get(id)
		if (!tableMappingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tableMapping.label', default: 'TableMapping'),
				id
			])
			redirect(action: "list")
			return
		}

		[tableMappingInstance: tableMappingInstance]
	}

	def edit(Long id) {
		def tableMappingInstance = TableMapping.get(id)
		if (!tableMappingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tableMapping.label', default: 'TableMapping'),
				id
			])
			redirect(action: "list")
			return
		}

		[tableMappingInstance: tableMappingInstance]
	}

	def update(Long id, Long version) {
		def tableMappingInstance = TableMapping.get(id)
		if (!tableMappingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tableMapping.label', default: 'TableMapping'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (tableMappingInstance.version > version) {
				tableMappingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'tableMapping.label', default: 'TableMapping')] as Object[],
						"Another user has updated this TableMapping while you were editing")
				render(view: "edit", model: [tableMappingInstance: tableMappingInstance])
				return
			}
		}

		tableMappingInstance.properties = params

		if (!tableMappingInstance.save(flush: true)) {
			render(view: "edit", model: [tableMappingInstance: tableMappingInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'tableMapping.label', default: 'TableMapping'),
			tableMappingInstance.id
		])
		redirect(action: "show", id: tableMappingInstance.id)
	}

	def delete(Long id) {
		def tableMappingInstance = TableMapping.get(id)
		if (!tableMappingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tableMapping.label', default: 'TableMapping'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			tableMappingInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'tableMapping.label', default: 'TableMapping'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'tableMapping.label', default: 'TableMapping'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
