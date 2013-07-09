package dmms


class DatabaseConfig {
	String name
	String type
	String url
	String username
	String password
	
	static hasMany = [tables:TableInfo]
	
	static constraints = {
		name blank:false
		type blank:false , inList:["oracle", "mysql" ,"beans"]
		url blank:false
		username blank:false
		password blank:false
	}	
	def encodeAsHTML(){
		id +":"+name;
	}

}
