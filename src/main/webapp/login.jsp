<%-- 
    Document   : login
    Created on : 24/10/2017, 10:33:33 PM
    Author     : Yoel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>LogIn</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="assets/css-login/main.css">
</head>
<body class="cover" style="background-image: url(assets/img/loginFont.jpg);">
	<form action="dashboard.jsp" method="" autocomplete="off" class="full-box logInForm">
		<p class="text-center text-muted"></i></p>
		<p class="text-center text-muted text-uppercase">Inicia sesión con tu cuenta</p>
		<div class="form-group label-floating">
		  <label class="control-label" for="UserEmail">E-mail</label>
		  <input class="form-control" id="UserEmail" type="email">
		  <p class="help-block">Escribe tú E-mail</p>
		</div>
		<div class="form-group label-floating">
		  <label class="control-label" for="UserPass">Contraseña</label>
		  <input class="form-control" id="UserPass" type="text">
		  <p class="help-block">Escribe tú contraseña</p>
		</div>
		<div class="form-group text-center">
			<input type="submit" value="Iniciar sesión" class="btn btn-raised btn-danger">
		</div>
	</form>
	<!--====== Scripts -->
	<script src="assets/js-login/jquery-3.1.1.min.js"></script>
	<script src="assets/js-login/bootstrap.min.js"></script>
	<script src="assets/js-login/material.min.js"></script>
	<script src="assets/js-login/ripples.min.js"></script>
	<script src="assets/js-login/sweetalert2.min.js"></script>
	<script src="assets/js-login/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="assets/js-login/main.js"></script>
	<script>
		$.material.init();
	</script>
</body>
</html>
