<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	    <title>Consulta</title>
	    <link rel="stylesheet" href="css/staticStyles.css">
		<link rel="stylesheet" href="css/Bootstrap/bootstrap.css" type="text/css">
	</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">Tienda generica</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
              <a class="nav-link active" href="http://localhost:8080/TiendaGenerica/usuario.html">Usuarios</a>
              <a class="nav-link" href="http://localhost:8080/TiendaGenerica/clientes.html">Clientes</a>
              <a class="nav-link" href="http://localhost:8080/TiendaGenerica/proveedores.html">Proveedores</a>
              <a class="nav-link" href="http://localhost:8080/TiendaGenerica/productos.html">Productos</a>
              <a class="nav-link" href="http://localhost:8080/TiendaGenerica/ventas.html">Ventas</a>
              <a class="nav-link" href="http://localhost:8080/TiendaGenerica/reportes.html">Reportes</a>
            </div>
          </div>
        </div>
      </nav>
      <div class="container" style="margin-top: 30px; height: 100%;">     	
	<%
	String cedula =  request.getParameter("cedula");
	String nombre =  request.getParameter("nombre");
	String email =  request.getParameter("email");
	String usuario =  request.getParameter("usuario");
	
	Connection conexion = null;
	int loginResult = 0;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");		
		conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","santiago","Vape2018!");
		PreparedStatement ps = conexion.prepareStatement("select * from usuarios where cedula_usuario = ? or email_usuario = ? or nombre_usuario = ? or usuario = ?");
		ps.setString(1,cedula);
		ps.setString(2,email);
		ps.setString(3,nombre);
		ps.setString(4,usuario);
		ResultSet result = ps.executeQuery();
		int i = 0; 
        %>
        <h1 style="text-align: center; margin-top: 5%;">Lista de usuarios</h1>
        <table class="table" style="margin-top:50px;">
		<tr>
			<th>Cedula</th>
			<th>Email</th>
			<th>Nombre</th>
		</tr>
		<%while (result.next()){%>
			<tr>
			<td><%= result.getInt("cedula_usuario") %></td>
			<td><%= result.getString("email_usuario") %></td>
			<td><%= result.getString("nombre_usuario") %></td>
			</tr>	
		<%i++;} %>
	</table>
		<%if(i<1){%>
			<p class="text-danger d-flex justify-content-center" id="banner-error"> No se encuentra el usuario en la base de datos	</p> <%} %>
	<% 				
	} catch (Exception e) {
		out.println(e);
	}
	%>
	
    </div>
    
    <div class="d-flex justify-content-center" style="text-align:center; margin-top: 30px;"> 
        <a class="btn btn-primary" type="button" href="consulta.html">Volver a consultar</a> 
    </div> 
    
    
</body>
</html>