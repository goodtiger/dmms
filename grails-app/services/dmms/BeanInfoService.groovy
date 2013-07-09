package dmms


import com.iwallet.biz.event.business.TradeEvent
import dmms.util.DatabaseConfigUtil;

class BeanInfoService {
	
	 def grailsApplication

	def createTableFromBean(String beanName) {
		def defaultBeansConfig = DatabaseConfig.findByName(DatabaseConfigUtil.DEFAULT_BEANS_DATABASECONFIG_NAME)
		Class clazz = 	grailsApplication.getClassLoader().loadClass(beanName)
		Class loader = grailsApplication.getClassLoader()
		while (loader != null) {
			System.out.println(loader.toString())
			loader = loader.getParent()
		}
		// Class.forName(beanName,true,Thread.currentThread().contextClassLoader)
	//	Class clazz = Thread.currentThread().contextClassLoader.loadClass(beanName)
		TableInfo table = TableInfo.findByName(beanName) ?: new TableInfo()
		table.name = clazz.getName()
		table.remarks = clazz.getName()
		table.database = defaultBeansConfig
		table.tableType = "BEAN"
		table.memo = clazz.getName()
		def fields = clazz.getDeclaredFields()
		def columns = []
		for (int i = 0; i < fields.length; i++) {
			def column = new ColumnInfo()
			column.tableName = clazz.getName()
			column.columnName = fields[i].getName()
			column.remarks = fields[i].getType()
			column.columnTypeName= fields[i].getType()
			column.columnSize= "NAN"
			column.table = table
			columns << column
		}
		table.columns = columns
		if(!table.save(flush: true)){
			table.errors.each { println it }
		}
		return table
	}
}
