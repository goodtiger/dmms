package dmms

class TableMapping {
	
	Long sourceTableId
	String sourceTableName
	String sourceTableRemarks
	String sourceTableMemo
	String sourceTableType
	Long targetTableId
	String targetTabelName
	String targetTableRemarks
	String targetTableMemo
	String targetTableType
	
	String memo
	
	static hasMany = [columnMppings:ColumnMapping]

	
	static constraints = {
		memo blank:true
		sourceTableId blank:false
		sourceTableName blank:false
		sourceTableRemarks blank:true
		sourceTableMemo blank:true
		sourceTableType blank:false
		targetTableId blank:false
		targetTabelName blank:false
		targetTableRemarks blank:true
		targetTableMemo blank:true 
		targetTableType blank:false
	}
	
	def encodeAsHTML(){
		sourceTableName +":"+targetTabelName;
	}
}
