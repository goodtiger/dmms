package dmms

import java.nio.charset.CoderMalfunctionError;
import java.sql.DatabaseMetaData
import java.util.Iterator;

import dmms.dataobject.ColumnMetaData;
import dmms.dataobject.TableMetaData;
import dmms.enums.TableTypeEnum;

class TableInfoService {


	def databaseConnectService

	/**
	 * 
	 * @param config
	 * @param tableName
	 * @return
	 */
	def storeTable(DatabaseConfig config,String tableName){
		DatabaseMetaData dmd = databaseConnectService.getMetaData(config)
		TableMetaData tableMetaData = databaseConnectService.getTable(dmd, tableName)
		TableInfo tableInfo = TableInfo.findByDatabaseAndName(config,tableName) ?: new TableInfo()
		tableInfo.database = config
		tableInfo.name = tableMetaData.tableName
		tableInfo.remarks = tableMetaData.remarks
		tableInfo.memo = !tableInfo.memo ? tableMetaData.remarks :tableInfo.memo
		tableInfo.tableType = TableTypeEnum.TABLE.name()
		def columnMetaDatas = databaseConnectService.getColumns(dmd, tableName)
		def columnInfos = []
		for (int i = 0; i < columnMetaDatas.size(); i++) {
			ColumnMetaData metaData = columnMetaDatas[i]
			ColumnInfo columnInfo = new ColumnInfo()
			columnInfo.table = tableInfo
			columnInfo.tableName = tableName
			columnInfo.columnName = metaData.columnName
			columnInfo.remarks = metaData.remarks
			columnInfo.columnTypeName = metaData.columnTypeName
			columnInfo.columnSize = metaData.columnSize
			columnInfos << columnInfo
		}
		tableInfo.columns = columnInfos
		
		if(!tableInfo.save(flush: true)){
			tableInfo.errors.each {
				println it
			}
		}
		return tableInfo
	}


	def storeTables(DatabaseConfig dbConfig) {
	}
}
