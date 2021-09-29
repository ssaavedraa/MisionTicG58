<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		out.println("Usuario creado");
	}
	else if (boton.equals("2")) {
		response.sendRedirect("consultas.html");
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