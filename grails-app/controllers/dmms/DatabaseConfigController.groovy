package dmms

import java.sql.DatabaseMetaData;

import org.springframework.dao.DataIntegrityViolationException

import dmms.util.DatabaseConfigUtil;

class DatabaseConfigController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def databaseConnectService
	def tableInfoService

	def showTables(Long id){
		def config = DatabaseConfig.get(id)
		if(!config){
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
				id
			])
			redirect(action: "list")
			return
		}
		DatabaseMetaData dmd = databaseConnectService.getMetaData(config)
		[tables: databaseConnectService.getTables(dmd,true),id:id]
	}

	def showColumns(Long id,String tableName){
		def config = DatabaseConfig.get(id)
		if(!config){
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
				id
			])
			redirect(action: "list")
			return
		}
		DatabaseMetaData dmd = databaseConnectService.getMetaData(config)
		[columns:databaseConnectService.getColumns(dmd, tableName),id:id]
	}

	def storeTable(Long id,String tableName){
		def config = DatabaseConfig.get(id)
		if(!config){
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
				id
			])
			redirect(action: "list")
			return
		}
		TableInfo info  = tableInfoService.storeTable(config, tableName)
		redirect(controller:'TableInfo', action: "list")
	}

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[databaseConfigInstanceList: DatabaseConfig.list(params), databaseConfigInstanceTotal: DatabaseConfig.count()]
	}

	def create() {
		[databaseConfigInstance: new DatabaseConfig(params)]
	}

	def save() {
		def databaseConfigInstance = new DatabaseConfig(params)
		if (!databaseConfigInstance.save(flush: true)) {
			render(view: "create", model: [databaseConfigInstance: databaseConfigInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
			databaseConfigInstance.id
		])
		redirect(action: "show", id: databaseConfigInstance.id)
	}

	def show(Long id) {
		def databaseConfigInstance = DatabaseConfig.get(id)
		if (!databaseConfigInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
				id
			])
			redirect(action: "list")
			return
		}

		[databaseConfigInstance: databaseConfigInstance]
	}

	def edit(Long id) {
		def databaseConfigInstance = DatabaseConfig.get(id)
		if (!databaseConfigInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
				id
			])
			redirect(action: "list")
			return
		}

		[databaseConfigInstance: databaseConfigInstance]
	}

	def update(Long id, Long version) {
		def databaseConfigInstance = DatabaseConfig.get(id)
		if (!databaseConfigInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (databaseConfigInstance.version > version) {
				databaseConfigInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'databaseConfig.label', default: 'DatabaseConfig')] as Object[],
						"Another user has updated this DatabaseConfig while you were editing")
				render(view: "edit", model: [databaseConfigInstance: databaseConfigInstance])
				return
			}
		}

		databaseConfigInstance.properties = params

		if (!databaseConfigInstance.save(flush: true)) {
			render(view: "edit", model: [databaseConfigInstance: databaseConfigInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
			databaseConfigInstance.id
		])
		redirect(action: "show", id: databaseConfigInstance.id)
	}

	def delete(Long id) {
		def databaseConfigInstance = DatabaseConfig.get(id)
		if (!databaseConfigInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			databaseConfigInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'databaseConfig.label', default: 'DatabaseConfig'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
