<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String cedula =  request.getParameter("cedula");
	
	Connection conexion = null;
	int loginResult = 0;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");		
		conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","santiago","Vape2018!");
		
		String strSQL = "DELETE FROM usuarios WHERE cedula_usuario = ?";
		PreparedStatement ps = conexion.prepareStatement(strSQL);
		
		ps.setString(1, cedula);
		
		int result = ps.executeUpdate();
		if (result > 0) {
			response.sendRedirect("procesoExitoso.html");			
		}else{
			response.sendRedirect("procesoError.html");
		}
	} catch (Exception e) {
		out.println(e);
	}
	%>
</body>
</html>