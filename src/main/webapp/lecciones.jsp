<%-- 
    Document   : adm
    Created on : 22/11/2017, 12:49:07 AM
    Author     : Yoel
--%>

<%@page import="com.cpyt.model.Curso"%>
<%@page import="com.cpyt.dao.LeccionDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.cpyt.dao.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <%

        Integer idCur = Integer.parseInt(request.getParameter("idCur"));
        LeccionDAO ld = new LeccionDAO();
        List<Object> lec = ld.listLeccion(idCur);
        List<Curso> c = ld.listCursoE(idCur);
        String nombCurso = c.get(0).getNomCur();
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

        <script src="assets/js/LeccionJS.js"></script>
    </head>
    <body>
        <!-- The Modal -->
        <div id="myModal" class="modal">
            <span class="close">&times;</span>
            <img class="modal-content" id="img01">
            <div id="caption"></div>
        </div>

        <div id="dialogoVideo" title="Video" style="display: none;">
            
            <div align="center">
            <video id="sourceVideo" width="700" height="420" controls>
               
            </video>
                <div id="divVideo">
                    
                </div>
                
            </div>


        </div>

        <div id="dialogMensaje" title="Mensaje" style="display: none;">
            <br>
            <div align="center">
                <h3>Proceso Ejecutado Correctamente!</h3> 
            </div>


        </div>

        <div id="dialogError" title="Error" style="display: none;">
            <br>
            <div align="center">
                <h3>Ocurrio un error !</h3>
            </div>


        </div>



        <div id="dialogCargando" title="Cargando..." style="display: none;">
            <br>
            <img id="gif" src="assets/img/loading.gif" width="128" height="128" alt="loading"/>

        </div>
        <div id="dialog" title="Datos de Lección" style="display: none;">
            <div class="row">
                <br>
                <div class="col-md-12">
                    <label for="txtNombre">Nombre de Lección:</label>
                    <input type="text" id="txtNombre" placeholder="Nombre de Lección" class="form-control"/>
                    <input type="hidden" id="txtIdLec"/>
                </div>

            </div>
            <br>
            <div class="row">
                <div class="col-md-8">
                    <label for="video">Adjuntar Video:</label>
                    <input type="file" id="video" class="form-control"/>
                </div>

            </div>
            <br>
            <div class="row">
                <div class="col-md-8">
                    <label for="archivo">Adjuntar Archivo:</label>
                    <input type="file" id="archivo" class="form-control"/>
                </div>

            </div>




        </div>

        <section id="container">
            <header id="header">
                <!--logo start-->
                <div class="brand">
                    <a href="dashboard.jsp" class="logo"><span>Aula</span>Virtual</a>
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
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                Mike Adams <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li>
                                    <a href="#"><i class="fa fa-user"></i> Mi Perfil</a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-power-off"></i> Salir</a>
                                </li>
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
                            <a href="dashboard.jsp"><i class="fa fa-dashboard"></i><span>Inicio</span></a>
                        </li>
                        <li id="admin">
                            <a href="administrador.jsp"><i class="fa fa-cogs"></i><span>Administradores</span></a>
                        </li>
                        <li id="docente">
                            <a href="docente.jsp"><i class="fa fa-cogs"></i><span>Docentes</span></a>
                        </li>
                        <li id="estudiante">
                            <a href="estudiante.jsp"><i class="fa fa-cogs"></i><span>Estudiantes</span></a>
                        </li>
                        <li id="cursos" class="active">
                            <a href="curso.jsp"  ><i class="fa fa-cogs"></i><span>Cursos</span></a>
                        </li>

                        <li class="sub-menu">
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
                        </li>


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

                            <h2 class="h1"><%=nombCurso%></h2>

                        </div>
                        <div class="col-md-2">

                            <button id="interesAddButton" class="btn btn-success"  onClick="dialogoLeccion('add',<%=idCur%>)"><span class="glyphicons glyphicon-plus"></span> Agregar</button> 

                        </div>
                    </div>

                    <div class="row" id="dataTable">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Listado de Lecciones</h3>
                                    <div class="actions pull-right">
                                        <i class="fa fa-chevron-down"></i>
                                        <!--<i class="fa fa-times"></i>-->
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Nombre de Lección</th>
                                                <th>Video</th>                                        
                                                <th>Archivo</th>                                                                             

                                                <th>Action</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%      for (int i = 0; i < lec.size(); i++) {
                                                    Object a[] = (Object[]) lec.get(i);

                                            %>
                                            <tr>

                                                <td><%= a[2]%></td>
                                                <td align="center">
                                                    <button class="btn btn-info" onclick="dialogoVideo('<%= a[3]%>')"><span class="glyphicon glyphicon-play"></span></button>
                                                </td>
                                                <td align="center">
                                                    <button class="btn btn-info" onclick=""><span class="glyphicon glyphicon-cloud-download"></span></button>
                                                </td>


                                                <td align="center">
                                                    <button class="btn btn-info" onclick="dialogoLeccionEdit('edit', '<%= a[0]%>', '<%= idCur%>', '<%= a[2]%>', '<%= a[3]%>', '<%= a[4]%>')"><span class="glyphicon glyphicon-edit"></span></button>
                                                    <button class="btn btn-danger" onclick="deleteLeccion('<%= a[0]%>')"><span class="glyphicon glyphicon-remove"></span></button>

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
