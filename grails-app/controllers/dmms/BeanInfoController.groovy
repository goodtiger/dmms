package dmms

import org.springframework.dao.DataIntegrityViolationException

class BeanInfoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def beanInfoService

	def save2Table(Long id){
		def beanInfo = BeanInfo.get(id)
		def table = beanInfoService.createTableFromBean(beanInfo.name)
		redirect(controller :"TableInfo",action:"show",id:table.id)
	}
	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[beanInfoInstanceList: BeanInfo.list(params), beanInfoInstanceTotal: BeanInfo.count()]
	}

	def create() {
		[beanInfoInstance: new BeanInfo(params)]
	}

	def save() {
		def beanInfoInstance = new BeanInfo(params)
		if (!beanInfoInstance.save(flush: true)) {
			render(view: "create", model: [beanInfoInstance: beanInfoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'beanInfo.label', default: 'BeanInfo'),
			beanInfoInstance.id
		])
		redirect(action: "show", id: beanInfoInstance.id)
	}

	def show(Long id) {
		def beanInfoInstance = BeanInfo.get(id)
		if (!beanInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'beanInfo.label', default: 'BeanInfo'),
				id
			])
			redirect(action: "list")
			return
		}

		[beanInfoInstance: beanInfoInstance]
	}

	def edit(Long id) {
		def beanInfoInstance = BeanInfo.get(id)
		if (!beanInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'beanInfo.label', default: 'BeanInfo'),
				id
			])
			redirect(action: "list")
			return
		}

		[beanInfoInstance: beanInfoInstance]
	}

	def update(Long id, Long version) {
		def beanInfoInstance = BeanInfo.get(id)
		if (!beanInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'beanInfo.label', default: 'BeanInfo'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (beanInfoInstance.version > version) {
				beanInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'beanInfo.label', default: 'BeanInfo')] as Object[],
						"Another user has updated this BeanInfo while you were editing")
				render(view: "edit", model: [beanInfoInstance: beanInfoInstance])
				return
			}
		}

		beanInfoInstance.properties = params

		if (!beanInfoInstance.save(flush: true)) {
			render(view: "edit", model: [beanInfoInstance: beanInfoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'beanInfo.label', default: 'BeanInfo'),
			beanInfoInstance.id
		])
		redirect(action: "show", id: beanInfoInstance.id)
	}

	def delete(Long id) {
		def beanInfoInstance = BeanInfo.get(id)
		if (!beanInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'beanInfo.label', default: 'BeanInfo'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			beanInfoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'beanInfo.label', default: 'BeanInfo'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'beanInfo.label', default: 'BeanInfo'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
