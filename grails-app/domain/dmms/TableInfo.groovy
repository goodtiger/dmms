package dmms

import java.util.Date

class TableInfo {
	String name
	String remarks
	String memo
	String tableType

	static belongsTo =[database:DatabaseConfig]

	static hasMany = [columns:ColumnInfo]

	static constraints = {
		tableType blank:false,inList:["TABLE", "BEAN"]
	}
	def encodeAsHTML(){
		id +":"+name;
	}
}
