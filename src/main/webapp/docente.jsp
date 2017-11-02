<%-- 
    Document   : docente
    Created on : 31/10/2017, 01:41:26 AM
    Author     : Yoel
--%>

<%@page import="com.cpyt.model.Persona"%>
<%@page import="com.cpyt.dao.PersonaDAO"%>

<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PersonaDAO g = new PersonaDAO();
    List<Persona> per = g.listPersona();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- DataTables-->
        <!-- Favicon -->
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <!-- Fonts from Font Awsome -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <!-- CSS Animate -->
        <link rel="stylesheet" href="assets/css/animate.css">
        <!-- Custom styles for this theme -->
        <link rel="stylesheet" href="assets/css/main.css">
        <!-- DataTables-->
        <link rel="stylesheet" href="assets/plugins/dataTables/css/dataTables.css">
        <!-- Fonts 
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
        <!-- Feature detection -->
        <script src="assets/js/modernizr-2.6.2.min.js"></script>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.js"></script>        
        <![endif]-->
        <script src="assets/js/PersonaJS.js"></script>
        
        
    </head>
    <body>
        <div id="dialogMensaje" title="Mensaje" style="display: none;">
            <br>

            <h3>Grabado Correctamente!</h3> 

        </div>

        <div id="dialogCargando" title="Cargando..." style="display: none;">
            <br>

            <h3 id="label">Grabado Correctamente!</h3> 
            <img id="gif" src="assets/img/loading.gif" width="128" height="128" alt="loading"/>

        </div>
        <div id="dialog" title="Datos del Docente" style="display: none;">
            <div class="row">
                <br>
                <div class="col-md-6">
                    <label for="txtDNI">DNI:</label>
                    <input type="text" id="txtDNI" placeholder="DNI" class="form-control"/>
                </div>
                <div class="col-md-6">
                    <label for="txtNombres">Nombres:</label>
                    <input type="text" id="txtNombres" placeholder="Nombres" class="form-control"/>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-6">
                    <label for="txtPaterno">Apellido Paterno:</label>
                    <input type="text" id="txtPaterno" placeholder="Apellido Paterno" class="form-control"/>
                </div>
                <div class="col-md-6">
                    <label for="txtMaterno">Apellido Materno:</label>
                    <input type="text" id="txtMaterno"  placeholder="Apellido Materno" class="form-control"/>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-6">
                    <label for="txtCorreo">Correo Electrónico:</label>
                    <input type="text" id="txtCorreo" placeholder="Correo Electrónico" class="form-control"/>
                </div>
                <div class="col-md-6">
                    <label for="txtCelular">Celular:</label>
                    <input type="text" id="txtCelular"  placeholder="Celular" class="form-control"/>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-6">
                    <label for="txtDireccion">Dirección:</label>
                    <input type="text" id="txtDireccion" placeholder="Dirección" class="form-control"/>
                </div>
                <div class="col-md-6">
                    <label for="txtCIP">CIP:</label>
                    <input type="text" id="txtCIP"  placeholder="CIP" class="form-control"/>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-12">
                    <label for="imgDocente">Certificado de Colegiatura:</label>
                    <input type="file" id="imgDocente" class="form-control"/>
                </div>

            </div>



        </div>

        <div id="contenidoIncrustado">
            <div class="row">
                <br>
                <div class="col-md-10">

                    <h2 class="h1">Docentes</h2>

                </div>
                <div class="col-md-2">

                    <button id="interesAddButton" class="btn btn-success"  onClick="dialogoPersona()"><span class="glyphicons glyphicon-plus"></span> Agregar</button> 

                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Listado de Docentes</h3>
                            <div class="actions pull-right">
                                <i class="fa fa-chevron-down"></i>
                                <!--<i class="fa fa-times"></i>-->
                            </div>
                        </div>
                        <div class="panel-body">
                            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Apellidos y Nombres</th>                                        
                                        <th>Correo</th>
                                        <th>Celular</th>
                                        <th>Dirección</th>                                        
                                        <th>CIP</th>
                                        <th>Certificado</th>

                                        <th>Action</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <%                                            for (int i = 0; i < per.size(); i++) {


                                    %>
                                    <tr>
                                        
                                        <td><%= per.get(i).getDni()%></td>
                                        <td><%= per.get(i).getApaterno().toString()+" "+per.get(i).getAmaterno().toString()+","+per.get(i).getNombres().toString()  %></td>
                                        <td><%= per.get(i).getCorreo() %></td>
                                        <td><%= per.get(i).getCelular() %></td>
                                        <td><%= per.get(i).getDireccion() %></td>
                                        <td><%= per.get(i).getCip() %></td>
                                        
                                        <td align="center">
                                            <button class="btn btn-warning"><span class="glyphicon glyphicon-certificate"></span></button>
                                        </td>
                                        <td align="center">
                                            <button class="btn btn-info"><span class="glyphicon glyphicon-edit"></span></button>
                                            <button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button>

                                        </td>
                                    </tr>
                                    <%

                                        }
                                    %>


                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>                                


        <!--Global JS-->
        <script src="assets/js/jquery-1.10.2.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/waypoints/waypoints.min.js"></script>
        <script src="assets/js/application.js"></script>

        <script src="assets/plugins/dataTables/js/jquery.dataTables.js"></script>
        <script src="assets/plugins/dataTables/js/dataTables.bootstrap.js"></script>

        <script src="assets/js/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="assets/css/jquery-ui.css">

        <script>
            

        </script>
    </body>
</html>
