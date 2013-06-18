package dmms

class ColumnMapping {

	Long sourceColumnId
	String sourceColumnName
	String sourceColumnTypeName
	String sourceColumnSize
	Long targetColumnId
	String targetColumnName
	String targetColumnTypeName
	String targetColumnSize

	String memo
	
	static belongsTo = [tableMapping:TableMapping]

	static constraints = {
		memo blank:true
		sourceColumnId blank:false
		sourceColumnName blank:false
		sourceColumnTypeName blank:false
		sourceColumnSize blank:false
		targetColumnId blank:false
		targetColumnName blank:false
		targetColumnTypeName blank:false
		targetColumnSize blank:false
	}
	
	def encodeAsHTML(){
		sourceColumnName +":"+targetColumnName;
	}
}
