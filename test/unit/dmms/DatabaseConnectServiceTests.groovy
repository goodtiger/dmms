package dmms



import java.sql.Connection;

import grails.test.mixin.*

import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(DatabaseConnectService)
class DatabaseConnectServiceTests {

	void testSomething() {
		DatabaseConnectService dcs = new DatabaseConnectService()
		DatabaseConfig config = new DatabaseConfig(url:'jdbc:oracle:thin:@payplus.devdb.alipay.net:1521:payplus', type:'oracle',username:'accfront00',password:'ali88')
		Connection con = dcs.connect(config)
		con.getMetaData()
	}
}
