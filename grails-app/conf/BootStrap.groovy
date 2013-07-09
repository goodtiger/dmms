import dmms.DatabaseConfig
import dmms.util.DatabaseConfigUtil

class BootStrap {

	def init = { servletContext ->
		def beansDatabaseConfigs = DatabaseConfig.findAllByType("beans")
		if(beansDatabaseConfigs==null || beansDatabaseConfigs.size()==0 ){
			new DatabaseConfig(name:DatabaseConfigUtil.DEFAULT_BEANS_DATABASECONFIG_NAME,type:"beans",url:"Default beans' url",username :"beans",password:"beans").save(flush: true)
		}
	}
	def destroy = {
	}
}
