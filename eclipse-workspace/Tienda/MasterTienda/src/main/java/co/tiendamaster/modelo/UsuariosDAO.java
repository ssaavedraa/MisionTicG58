package co.tiendamaster.modelo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UsuariosDAO {
	Usuarios user= new Usuarios();
	BDConexion con= new BDConexion();
	Connection con1;
	PreparedStatement ps;
	ResultSet result;
	int rt=0;
	
	
	public int login (Usuarios user){
		String query = "SELECT * FROM usuarios WHERE nombre_usuario = ? AND password = ?";
		try {
		Connection con1= con.SQLConectar();
		ps = con1.prepareStatement(query);
		ps.setString(1, user.getNombreUsuario());
		ps.setString(2, user.getPassword());
		result = ps.executeQuery();
		while (result.next()) {
			rt=rt+1;
			user.setNombreUsuario((result.getString("nombre_usuario")));
			user.setPassword((result.getString("password")));
			
		}
		if (rt==1) {
			return 1;
		}else {
			return 0;
		}
		
			} catch(Exception e){
				
				return 0;
			}
		}
		

}