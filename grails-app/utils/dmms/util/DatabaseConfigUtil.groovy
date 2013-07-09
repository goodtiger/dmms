package dmms.util
import java.util.Iterator;

import dmms.DatabaseConfig;
import dmms.dataobject.TableMetaData;

/**
 * 
 */

/**
 * @author Goodtiger
 *
 */
class DatabaseConfigUtil {
	
	def static final  DEFAULT_BEANS_DATABASECONFIG_NAME ="Default Beans' Databaseconfig"

	def static FILTE_TABLES = [
		"DUAL",
		"SYSTEM_PRIVILEGE_MAP",
		"TABLE_PRIVILEGE_MAP",
		"PRIV_TABLE",
		"PSTUBTBL",
		"AUDIT_ACTIONS",
		"HS_BULKLOAD_VIEW_OBJ",
		"HS_PARTITION_COL_NAME",
		"HS_PARTITION_COL_TYPE",
		"IMPDP_STATS",
		"STMT_AUDIT_OPTION_MAP"
	]

	def static getCatlog(DatabaseConfig config){
		config?.url.substring(config?.url.lastIndexOf(':')+1, config?.url.length())
	}

	def static filterTables(TableMetaData[] args){
		def result = []
		def tempNames =[]
		args.each{
			if(it.tableName.contains('$')){
			}else if(it.tableName.charAt(it.tableName.length()-1).isDigit()){
				if(it.tableName.endsWith("_00") && !tempNames.contains(it.tableName.substring(0, it.tableName.length()-3))){
					tempNames << it.tableName
					result << it
				}
			}else if(!FILTE_TABLES.contains(it.tableName)){
				tempNames << it.tableName
				result << it
			}
		}
		result
	}
}