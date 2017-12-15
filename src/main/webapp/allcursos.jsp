<%-- 
    Document   : adm
    Created on : 22/11/2017, 12:49:07 AM
    Author     : Yoel
--%>

<%@page import="com.cpyt.dao.CursoDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.cpyt.dao.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <%
        String nameUser = "";
        int rol = 0;

        CursoDAO g = new CursoDAO();

        List<Object> doc = g.listCursoAll();


    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AulaVirtual</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
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
        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
        <!-- Feature detection -->
        <script src="assets/js/modernizr-2.6.2.min.js"></script>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <script src="assets/js/CursoJS.js"></script>
        <script src="assets/js/LoginJS.js"></script>
        <style>
            .dialogCargando .ui-widget-header {
                border: none;
                background: transparent;
            }
        </style>
    </head>
    <body>


        <section id="container">
            <header id="header">
                <!--logo start-->
                <div class="brand">
                    <a href="index.jsp" class="logo"><span>Aula</span>Virtual</a>
                </div>
                <!--logo end-->
                <div class="toggle-navigation toggle-left">
                    <button type="button" class="btn btn-default" id="toggle-left" data-toggle="tooltip" data-placement="right" title="Toggle Navigation">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <div class="user-nav">
                    <ul>

                        <!--<li class="profile-photo">
                            <img src="assets/img/avatar.png" alt="" class="img-circle">
                        </li>-->
                        <li class="dropdown settings">
                            <!--<a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                Inicio <i class="fa fa-angle-down"></i>
                            </a>-->
                            <ul class="dropdown-menu animated fadeInDown">
                                <!--<li>
                                    <a href="#"><i class="fa fa-user"></i> Mi Perfil</a>
                                </li>
                                <li>
                                    <a onclick="destroySession()"><i class="fa fa-power-off"></i> Salir</a>
                                </li>-->
                            </ul>
                        </li>

                    </ul>
                </div>
            </header>
            <!--sidebar start-->
            <aside class="sidebar">
                <div id="leftside-navigation" class="nano">
                    <ul class="nano-content">
                        <li >
                            <a href="index.jsp"><i class="fa fa-dashboard"></i><span>Inicio</span></a>
                        </li>


                        <li class="active">
                            <a href="allcursos.jsp"><i class="fa fa-cogs"></i><span>Cursos</span></a>
                        </li>

                        <!--<li class="sub-menu">
                            <a href="javascript:void(0);"><i class="fa fa fa-tasks"></i><span>Forms</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                            <ul>
                                <li><a href="forms-components.html">Components</a>
                                </li>
                                <li><a href="forms-validation.html">Validation</a>
                                </li>
                                <li><a href="forms-mask.html">Mask</a>
                                </li>
                                <li><a href="forms-wizard.html">Wizard</a>
                                </li>
                                <li><a href="forms-multiple-file.html">Multiple File Upload</a>
                                </li>
                                <li><a href="forms-wysiwyg.html">WYSIWYG Editor</a>
                                </li>
                            </ul>
                        </li>-->


                    </ul>
                </div>

            </aside>
            <!--sidebar end-->
            <!--main content start-->
            <section class="main-content-wrapper">
                <section id="main-content">
                    <div class="row">
                        <br>
                        <div class="col-md-10">

                            <h2 class="h1">Cursos</h2>

                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>

                    <div class="row" id="dataTable">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Listado de Cursos</h3>
                                    <div class="actions pull-right">
                                        <i class="fa fa-chevron-down"></i>
                                        <!--<i class="fa fa-times"></i>-->
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Docente</th>

                                                <th>Nombre de Curso</th>                                        
                                                <th>Precio</th>
                                                <th>Lecciones</th>






                                                <th>Inscripción</th>

                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%      for (int i = 0; i < doc.size(); i++) {
                                                    Object a[] = (Object[]) doc.get(i);
                                            %>
                                            <tr>

                                                <td><%= a[1].toString() + " " + a[2].toString() + ", " + a[3].toString()%></td>

                                                <td><%= a[4]%></td>
                                                <td><%= a[6]%></td>
                                                <td align="center">
                                                    <%
                                                        if (rol == 0) {

                                                        
                                                    %>
                                                    <a class="btn btn-default" href="alllecciones.jsp?idCur=<%= a[0]%>"><span class="glyphicon glyphicon-th-list"></span></a>

                                                    <%}else{%>
                                                    <a class="btn btn-default" href="alllecciones.jsp?idCur=<%= a[0]%>"><span class="glyphicon glyphicon-th-list"></span></a>
                                                     <%}%>
                                                </td>





                                                <td align="center">
                                                    <a class="btn btn-info" href="login.jsp"><span class="glyphicon glyphicon-new-window"></span></a>
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

                </section>
            </section>
            <!--main content end-->            
        </section>
        <!--Global JS-->
        <script src="assets/js/jquery-1.10.2.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/waypoints/waypoints.min.js"></script>
        <script src="assets/plugins/nanoScroller/jquery.nanoscroller.min.js"></script>
        <script src="assets/js/application.js"></script>
        <!--Page Leve JS -->
        <script src="assets/plugins/dataTables/js/jquery.dataTables.js"></script>
        <script src="assets/plugins/dataTables/js/dataTables.bootstrap.js"></script>

        <script src="assets/js/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="assets/css/jquery-ui.css">
        <script>
            $(document).ready(function () {
                $('#example').dataTable();
            });
        </script>

    </body>
</html>
