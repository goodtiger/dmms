package dmms

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import dmms.util.DatabaseConfigUtil;
import dmms.dataobject.*

import groovy.sql.Sql

class DatabaseConnectService {


	/**
	 * ����������Ϣ��ȡ���ݿ�����
	 * @param config
	 * @return {@link Connection}
	 */
	def connect(DatabaseConfig config) {
		def driver
		switch(config?.type){
			case 'oracle':
				driver = 'oracle.jdbc.driver.OracleDriver'
				break
			case 'mysql':
				driver = 'com.mysql.jdbc.Driver'
				break
			default:
				driver = 'com.mysql.jdbc.Driver'
		}
		Properties props =new Properties()
		props.put("remarksReporting","true")
		props.put("user", config?.username)
		props.put("password", config?.password)
		def db= Sql.newInstance(config?.url , props ,driver)
		db.getConnection()
	}

	/**
	 *  �������ݿ���Ϣ
	 * @param config
	 * @return {@link DatabaseMetaData}
	 */
	def getMetaData(DatabaseConfig config){
		Connection con = this.connect(config)
		con?.getMetaData()
	}

	/**
	 * ��ȡ���еı�
	 * @param dmd
	 * @return ����
	 */
	def getTables(DatabaseMetaData dmd,boolean filter){
		ResultSet rs = dmd.getTables(null, null, null, ['TABLE'] as String[])
		def tableMetaDatas = []
		while(rs.next()){
			TableMetaData tableMetaData = new TableMetaData()
			tableMetaData.tableName = rs.getString("TABLE_NAME")
			tableMetaData.remarks = rs.getString("REMARKS")
			tableMetaDatas << tableMetaData
		}
		return filter? DatabaseConfigUtil.filterTables(tableMetaDatas as TableMetaData[]):tableMetaDatas
	}


	/**
	 *  ��ȡָ�������ı���Ϣ
	 * @param dmd
	 * @param tableName
	 * @return
	 */
	def getTable(DatabaseMetaData dmd,String tableName){
		TableMetaData tableMetaData = new TableMetaData()
		ResultSet rs = dmd.getTables(null, null, tableName, ['TABLE'] as String[])
		while(rs.next()){
			tableMetaData.tableName = rs.getString("TABLE_NAME")
			tableMetaData.remarks = rs.getString("REMARKS")
		}
		return tableMetaData
	}

	/**
	 * 
	 * @param dmd
	 * @param tableName
	 * @return
	 */
	def getColumns(DatabaseMetaData dmd,String tableName){
		ResultSet rs =  dmd.getColumns(null, null, tableName,null )
		def columnMetaDatas = []
		while(rs.next()){
			ColumnMetaData columnMetaData = new ColumnMetaData()
			columnMetaData.tableName = rs.getString("TABLE_NAME")
			columnMetaData.columnName = rs.getString("COLUMN_NAME")
			columnMetaData.columnTypeName = rs.getString("TYPE_NAME")
			columnMetaData.columnSize = rs.getInt("COLUMN_SIZE")
			columnMetaData.remarks = rs.getString("REMARKS")
			columnMetaDatas << columnMetaData
		}
		columnMetaDatas
	}
}
