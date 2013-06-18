// Place your Spring DSL code here
beans = {

	databaseConnectService(dmms.DatabaseConnectService){
	}
	tableInfoService(dmms.TableInfoService){ databaseConnectService=ref("databaseConnectService") }
}
