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
		
		String strSQL = "SELECT * FROM usuarios WHERE usuario = ? AND password = ?";
		PreparedStatement ps = conexion.prepareStatement(strSQL);
		
		ps.setString(1, usuario);
		ps.setString(2, password);
		
		
		ResultSet result = ps.executeQuery();
		out.println(result.next());
		
		int i = 0;
		
		while(result.next()){
			i++;
		}
		
		if(i == 0){
			response.sendRedirect("index.html");
		}
		else{
			out.println("Usuario y/o contraseña incorrecto");
		}
	%>
</body>
</html>