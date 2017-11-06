<%-- 
    Document   : dashboard
    Created on : 26/10/2017, 11:34:22 PM
    Author     : Yoel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AulaVirtual</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="assets/css/main.css">
    
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    
</head>

<body>
    <section id="container">
        <div id="header">
            <!--logo start-->
            <div class="brand">
                <a href="dashboard.jsp" class="logo"><span>Aula</span>Virtual</a>
            </div>
            <!--logo end-->
            <div class="toggle-navigation toggle-left">
                <button type="button" class="btn btn-default" id="toggle-left" data-toggle="tooltip" data-placement="right">
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
        </div>
        <!--sidebar left start-->
        <aside class="sidebar">
            <div id="leftside-navigation" class="nano">
                <ul class="nano-content">
                    <li class="active">
                        <a href="dashboard.jsp"><i class="fa fa-dashboard"></i><span>Inicio</span></a>
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:void(0);"><i class="fa fa-cogs"></i><span>Docentes</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                        <ul>
                            <li id="docente">
                                <a href="#"><!--<i class="fa fa-cogs"></i>--><span>Activos</span></a>
                            </li>
                        </ul>
                        
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-cogs"></i><span>Estudiantes</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-cogs"></i><span>Cursos</span></a>
                    </li>
                    <li id="bienvenida">
                        <a href="#" ><i class="fa fa-cogs"></i><span>Bienvenida</span></a>
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
        <!--sidebar left end-->
        <!--main content start-->
        
        <section class="main-content-wrapper">
            <section id="main-content">
                <!--tiles start-->
                <div id="contenidoDerecha">
                    <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-red">
                            <div class="content">
                                <h1 class="text-left timer" data-from="0" data-to="180" data-speed="2000"> </h1>
                                <p>Docentes</p>
                            </div>
                            <div class="icon"><i class="fa fa-users"></i>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-turquoise">
                            <div class="content">
                                <h1 class="text-left timer" data-from="0" data-to="56" data-speed="2000"> </h1>
                                <p>Alumnos</p>
                            </div>
                            <div class="icon"><i class="fa fa-user"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-blue">
                            <div class="content">
                                <h1 class="text-left timer" data-from="0" data-to="32" data-speed="2000"> </h1>
                                <p>Cursos</p>
                            </div>
                            <div class="icon"><i class="fa fa-book"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-purple">
                            <div class="content">
                                <h1 class="text-left timer" data-to="10" data-speed="2000"> </h1>
                                <p>Alumnos +1 Curso</p>
                            </div>
                            <div class="icon"><i class="fa fa-bar-chart-o"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row" >
                    <br>
                    <br>
                    <br>
                    <br>
                    <div class="col-sm-12" align="center">
                        <h1>BIENVENIDO A LA PLATAFORMA DE AULA VIRTUAL</h1>
                    </div>
                    
                </div>
               
                 </div>
               
            </section>
        </section>
            
        
    </section>
    <!--Global JS-->
    <script src="assets/js/jquery-1.10.2.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/waypoints/waypoints.min.js"></script>
    <script src="assets/js/application.js"></script>
    
    <!--para contenido derecha-->
    <script src="assets/plugins/countTo/jquery.countTo.js"></script>
    <script src="assets/plugins/weather/js/skycons.js"></script>
   
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <link rel="stylesheet" href="https://code.jquery.com/ui/jquery-ui-git.css">
    <script>
        $(document).ready(function() {
            
            
            
            $("#docente").click(function(){
                $("#contenidoDerecha").load("docente.jsp");
                $("#contenidoDerecha").load("docente.jsp");
            });
            
            app.timer();
            app.map();
            app.weather();
            app.morrisPie();
        });
    </script>
   

</body>

</html>

