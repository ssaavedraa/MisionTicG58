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
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("password");
		
		Class.forName("com.mysql.jdbc.Driver");		
		Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","santiago","Vape2018!");
				
		try{
			String strSQL = "SELECT * FROM usuarios WHERE usuario = ? AND password = ?";
			PreparedStatement ps = conexion.prepareStatement(strSQL);
			
			ps.setString(1, usuario);
			ps.setString(2, password);
			
			ResultSet result = ps.executeQuery();
			
			int i = 0;
			out.println("Password: " + result.getString(4));
			out.println("User: " + result.getString(5));
			
			response.sendRedirect("index.html");
		}
		catch(Exception e){
			out.println("Usuario y/o contraseña incorrectos");
		}
	%>
</body>
</html>