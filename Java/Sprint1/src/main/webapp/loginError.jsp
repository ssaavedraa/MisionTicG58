<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	    <title> Iniciar sesión </title>
	    <link rel="stylesheet" href="css/staticStyles.css">
		<link rel="stylesheet" href="css/Bootstrap/bootstrap.css" type="text/css">
	
	</head>
	<body class="d-flex flex-column h-100">
		
	    <h1 style="text-align: center; margin-top: 12%;">Iniciar sesión</h1>
	    <div class="formulario flex-shrink-0" style="margin-top: 30px;">
	        <form action="comprobarUsuario.jsp" method="post">
	        	<div class="alert alert-danger ">
	        		Usuario y/o contraseña incorrectos
	        	</div>
	            <div class="mb-3">
	                <label for="username" class="form-label">Usuario</label>
	                <input type="text" class="form-control is-invalid" id="usuario" name="usuario" required>
	            </div>
	            <div class="mb-3">
	                <label for="password" class="form-label">Contraseña</label>
	                <input type="password" class="form-control is-invalid" id="password" name="password" required>
	            </div>
	
	
	            <div class="d-flex justify-content-center" style="text-align:center; margin-top: 30px;">
	                <button class="btn btn-primary" type="submit">Aceptar</button>
	                <button class="btn btn-primary" type="reset">Cancelar</button>
	            </div>
	        </form>
	    </div>
	    
	</body>
	<footer>
	    <p> Desarrollado por: Archicoms</p>
	</footer>
</html>