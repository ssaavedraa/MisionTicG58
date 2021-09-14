package co.tiendamaster.modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class BDConexion {
	private String driver= "com.mysql.cj.jdbc.Driver";
	private String url= "jdbc:mysql://localhost:3306/tienda";
	private String timeZone="?useUnicode=true&use"+"JDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&server"+"Timezone=UTC";
	private String user= "root";
	private String password="qwer2212";
	
	public Connection SQLConectar() {
		Connection con = null;
		try {
			Class.forName(driver);	
			con= DriverManager.getConnection(url+timeZone,user,password);	
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return con;
		
		
	}
	
}