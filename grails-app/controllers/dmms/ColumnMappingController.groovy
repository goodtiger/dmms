package dmms

import org.springframework.dao.DataIntegrityViolationException

class ColumnMappingController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def showColumns(Long id){
		def tableMappingInstance = TableMapping.get(id)
		if (!tableMappingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tableMapping.label', default: 'TableMapping'),
				id
			])
			redirect(action: "list")
			return
		}
		[id:id,sourceColumns:ColumnInfo.findAllByTable(TableInfo.get(tableMappingInstance.sourceTableId)),targetColumns:ColumnInfo.findAllByTable( TableInfo.get(tableMappingInstance.targetTableId))]
	}

	def saveMapping(){
		def tableMapping = TableMapping.get(params.get("tableMappingId").toLong())
		def keySet = params.keySet() as String[]
		for (int i = 0; i < keySet.size(); i++) {
			def key =keySet[i]
			if(key.isLong() && params.get(key).isLong()){
				def sourceColumn = ColumnInfo.get(key.toLong())
				def targetColumn = ColumnInfo.get(params.get(key).toLong())
				def columnMapping = ColumnMapping.findBySourceColumnIdAndTargetColumnId(sourceColumn.id,targetColumn.id) ?: new ColumnMapping()
				columnMapping.memo = params.get(key+"_memo")  ?: "AUTO:" +sourceColumn.columnName +"-"+targetColumn.columnName
				columnMapping.sourceColumnId = sourceColumn.id
				columnMapping.sourceColumnName = sourceColumn.columnName
				columnMapping.sourceColumnSize = sourceColumn.columnSize
				columnMapping.sourceColumnTypeName = sourceColumn.columnTypeName
				columnMapping.targetColumnId = targetColumn.id
				columnMapping.targetColumnName = targetColumn.columnName
				columnMapping.targetColumnSize = targetColumn.columnSize
				columnMapping.targetColumnTypeName = targetColumn.columnTypeName
				columnMapping.tableMapping = tableMapping
				columnMapping.save(flush: true)
			}
		}
		redirect(action: "list")
	}
	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[columnMappingInstanceList: ColumnMapping.list(params), columnMappingInstanceTotal: ColumnMapping.count()]
	}

	def create() {
		[columnMappingInstance: new ColumnMapping(params)]
	}

	def save() {
		def columnMappingInstance = new ColumnMapping(params)
		if (!columnMappingInstance.save(flush: true)) {
			render(view: "create", model: [columnMappingInstance: columnMappingInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'columnMapping.label', default: 'ColumnMapping'),
			columnMappingInstance.id
		])
		redirect(action: "show", id: columnMappingInstance.id)
	}

	def show(Long id) {
		def columnMappingInstance = ColumnMapping.get(id)
		if (!columnMappingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'columnMapping.label', default: 'ColumnMapping'),
				id
			])
			redirect(action: "list")
			return
		}

		[columnMappingInstance: columnMappingInstance]
	}

	def edit(Long id) {
		def columnMappingInstance = ColumnMapping.get(id)
		if (!columnMappingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'columnMapping.label', default: 'ColumnMapping'),
				id
			])
			redirect(action: "list")
			return
		}

		[columnMappingInstance: columnMappingInstance]
	}

	def update(Long id, Long version) {
		def columnMappingInstance = ColumnMapping.get(id)
		if (!columnMappingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'columnMapping.label', default: 'ColumnMapping'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (columnMappingInstance.version > version) {
				columnMappingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'columnMapping.label', default: 'ColumnMapping')] as Object[],
						"Another user has updated this ColumnMapping while you were editing")
				render(view: "edit", model: [columnMappingInstance: columnMappingInstance])
				return
			}
		}

		columnMappingInstance.properties = params

		if (!columnMappingInstance.save(flush: true)) {
			render(view: "edit", model: [columnMappingInstance: columnMappingInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'columnMapping.label', default: 'ColumnMapping'),
			columnMappingInstance.id
		])
		redirect(action: "show", id: columnMappingInstance.id)
	}

	def delete(Long id) {
		def columnMappingInstance = ColumnMapping.get(id)
		if (!columnMappingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'columnMapping.label', default: 'ColumnMapping'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			columnMappingInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'columnMapping.label', default: 'ColumnMapping'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'columnMapping.label', default: 'ColumnMapping'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
