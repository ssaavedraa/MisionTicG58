<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	    <title> Gestión de usuario</title>
	    <link rel="stylesheet" href="css/staticStyles.css">
		<link rel="stylesheet" href="css/Bootstrap/bootstrap.css" type="text/css">
</head>
<body>
	<%
	String usuario = request.getParameter("usuario");
	String password = request.getParameter("password");
	String cedula = request.getParameter("cedula");
	String correo = request.getParameter("email");
	String nombre = request.getParameter("nombre");
	String boton = request.getParameter("button");
	
	out.println(boton);
	
	if(boton.equals("1")){
		Connection conexion = null;
		int loginResult = 0;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");		
			conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","santiago","Vape2018!");
			
			String strSQL = "INSERT INTO usuarios (cedula_usuario, email_usuario, nombre_usuario, usuario, password)" +
					"VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps = conexion.prepareStatement(strSQL);
			
			ps.setString(1, cedula);
			ps.setString(2, correo);
			ps.setString(3, nombre);
			ps.setString(4, usuario);
			ps.setString(5, password);
			
			int result = ps.executeUpdate();
			if (result == 1) {
				response.sendRedirect("procesoExitoso.html");			
			}else{
				out.println("Usuario no encontrado");
			}
		} catch (Exception e) {
			out.println(e);
		}
	}
	else if (boton.equals("2")) {
		out.println("Estos son los resultados");
	}
	else if (boton.equals("3")) {
		out.println("Usuario Actualizado");	
	}
	else if (boton.equals("4")) {
		response.sendRedirect("eliminarUsuario.html");
	}
	%>
</body>
</html>	