<%-- 
    Document   : login
    Created on : 24/10/2017, 10:33:33 PM
    Author     : Yoel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>AulaVirtual - LogIn</title>
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="assets/css-login/main.css">
        <script src="assets/js/LoginJS.js"></script>
        <script src="assets/js/AdmJS.js"></script>
    </head>
    <body class="cover" style="background-image: url(assets/img/loginFont.jpg);">

        <!-- The Modal -->
        <div id="myModal" class="modal">
            <span class="close">&times;</span>
            <img class="modal-content" id="img01">
            <div id="caption"></div>
        </div>



        <div id="dialogMensaje" title="Exitoso!" style="display: none;">
            <br>
            <div align="center">
                
                <p>Se le envio un correo</p>
                <p>con su usuario y contraseña</p>
            </div>


        </div>

        <div id="dialogError" title="Error" style="display: none;">
            <br>
            <div align="center">
                <h3>Ocurrio un error !</h3>
            </div>


        </div>



        <div id="dialogCargando" title="Cargando..." style="display: none;">
            <div align="center">
                <br>
                <img id="gif" src="assets/img/loading.gif" width="128" height="128" alt="loading"/>
            </div>
        </div>
        <div id="dialog" title="Datos del Estudiante" style="display: none;">
            <div class="row">
                <br>
                <div class="col-md-6">
                    <!--<label for="txtDNI">DNI:</label>-->
                    <input type="text" id="txtDNI" placeholder="DNI" class="form-control"/>
                    <input type="hidden" id="txtIdPer"/>
                </div>
                <div class="col-md-6">
                    <!--<label for="txtNombres">Nombres:</label>-->
                    <input type="text" id="txtNombres" placeholder="Nombres" class="form-control"/>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <!--<label for="txtPaterno">Apellido Paterno:</label>-->
                    <input type="text" id="txtPaterno" placeholder="Apellido Paterno" class="form-control"/>
                </div>
                <div class="col-md-6">
                    <!--<label for="txtMaterno">Apellido Materno:</label>-->
                    <input type="text" id="txtMaterno"  placeholder="Apellido Materno" class="form-control"/>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <!--<label for="txtCorreo">Correo Electrónico:</label>-->
                    <input type="text" id="txtCorreo" placeholder="Correo Electrónico" class="form-control"/>
                </div>
                <div class="col-md-6">
                    <!--<label for="txtCelular">Celular:</label>-->
                    <input type="text" id="txtCelular"  placeholder="Celular" class="form-control"/>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <!--<label for="txtDireccion">Dirección:</label>-->
                    <input type="text" id="txtDireccion" placeholder="Dirección" class="form-control"/>
                </div>

            </div>





        </div>




        <form method="post" action="LoginServlet" autocomplete="off" class="full-box logInForm">
            <p class="text-center text-muted"></i></p>
            <p class="text-center text-muted text-uppercase">Inicia sesión con tu cuenta</p>
            <div class="form-group label-floating">
                <label class="control-label" for="user">Usuario</label>
                <input class="form-control" id="user" name="user" type="text">
                <p class="help-block">Escribe tú Usuario</p>
            </div>
            <div class="form-group label-floating">
                <label class="control-label" for="pass">Contraseña</label>
                <input class="form-control" id="pass" name="pass" type="password">
                <p class="help-block">Escribe tú contraseña</p>
            </div>
            <div class="form-group text-center">
                <button class="btn btn-raised btn-danger" onclick="validarLogin()">Iniciar sesión</button><br>


                <button type="button" class="btn btn-success"  onClick="dialogoPersona('add', 'est', null, null, null, null, null, null, null, null)">Registrate</button> 


                <div id="errorSession">

                </div>
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
        <script src="assets/js/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="assets/css/jquery-ui.css">
    </body>
</html>
