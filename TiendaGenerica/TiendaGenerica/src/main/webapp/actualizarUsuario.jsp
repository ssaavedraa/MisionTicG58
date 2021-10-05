<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Actualizar Usuario</title>
</head>
<body>
	<%
	String cedula =  request.getParameter("cedula");
	
	Connection conexion = null;
	int loginResult = 0;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");		
		conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","santiago","Vape2018!");
		
		String strSQL = "SELECT * FROM usuarios WHERE cedula_usuario = ?";
		PreparedStatement ps = conexion.prepareStatement(strSQL);
		
		ps.setString(1, cedula);
		
		ResultSet result = ps.executeQuery();
		
		int i = 0;
		
		while (result.next()){
			i++;
		}
		
		if (i == 1){
			response.sendRedirect("actualizar.html");
		}
		else{
			loginResult = 1;
			response.sendRedirect("procesoError.html");
		}
	} catch (Exception e) {
		out.println(e);
	}
	// insert into usuarios (cedula_usuario, email_usuario, nombre_usuario, password, usuario) values (1020830069, 'santi@go.com', 'santiago', 'Vape2018!', 'ssaavedraa');
//	response.sendRedirect("usuario.html");
	%>
</body>
</html>