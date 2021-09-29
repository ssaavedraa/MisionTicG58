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
		Connection conexion = null;
		int loginResult = 0;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");		
			conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","root","12345678");
			
			String strSQL = "SELECT * FROM usuarios WHERE usuario = ? AND password = ?";
			PreparedStatement ps = conexion.prepareStatement(strSQL);
			
			ps.setString(1, usuario);
			ps.setString(2, password);
			
			ResultSet result = ps.executeQuery();

			int i = 0;
			
			while (result.next()){
				i++;
			}
			
			if (i == 1){
				response.sendRedirect("usuario.html");
			}
			else{
				loginResult = 1;
				response.sendRedirect("loginError.html");
			}
		} catch (Exception e) {
			out.println(e);
		}

	%>
</body>
</html>