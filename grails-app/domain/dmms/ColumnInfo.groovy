package dmms

class ColumnInfo {

	String tableName
	String columnName
	String remarks
	String columnTypeName
	String columnSize

	static belongsTo = [table:TableInfo]
	
	static constraints = {
	}
	
	def encodeAsHTML(){
		id +":"+remarks;
	}


	
	

}