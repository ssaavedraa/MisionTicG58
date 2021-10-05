<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	    <title> Actualizar usuario</title>
	    <link rel="stylesheet" href="css/staticStyles.css">
		<link rel="stylesheet" href="css/Bootstrap/bootstrap.css" type="text/css">
</head>
<body>
	<%
	Connection conexion = null;
	int loginResult = 0;
	
	String usuario, password, correo, nombre, boton, cedula;
	
	usuario = request.getParameter("usuario");
	password = request.getParameter("password");
	correo = request.getParameter("email");
	nombre = request.getParameter("nombre");	
	boton = request.getParameter("button");
	cedula =  request.getParameter("cedula");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");		
		conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","santiago","Vape2018!");
		
		String strSQL = "SELECT * FROM usuarios WHERE cedula_usuario = ?";
		PreparedStatement ps = conexion.prepareStatement(strSQL);

		ps.setString(1, cedula);
		
		ResultSet result = ps.executeQuery();
		
		while (result.next()){
			if (request.getParameter("usuario") == ""){

				usuario = result.getString(5);
			}
			if (request.getParameter("password") == ""){

				password = result.getString(4);
			}
			if (request.getParameter("nombre") == ""){

				nombre = result.getString(3);
			}
			if (request.getParameter("email") == ""){

				correo = result.getString(2);
			}
		}
		
		
	} catch (Exception e) {
		out.println(e);
	}
	
	if(boton.equals("Actualizar")){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");		
			conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","santiago","Vape2018!");
			
			String strSQL = "UPDATE usuarios SET email_usuario = ?, nombre_usuario = ?, usuario = ?, password= ? WHERE cedula_usuario = ?";
			PreparedStatement ps = conexion.prepareStatement(strSQL);
			
			ps.setString(1, correo);
			ps.setString(2, nombre);
			ps.setString(3, usuario);
			ps.setString(4, password);
			ps.setString(5, cedula);
			
			int result = ps.executeUpdate();
			if (result == 1) {
				response.sendRedirect("procesoExitoso.html");			
			}else{
				response.sendRedirect("procesoError.html");
			}
		} catch (Exception e) {
			out.println(e);
		}
	}
	else if (boton.equals("Cancelar")) {
		out.println("Proceso cancelado");
	}
	%>
</body>
</html>