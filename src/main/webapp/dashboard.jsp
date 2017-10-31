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
<html class="no-js">
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
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <link rel="stylesheet" href="https://code.jquery.com/ui/jquery-ui-git.css">
</head>

<body>
    <section id="container">
        <header id="header">
            <!--logo start-->
            <div class="brand">
                <a href="index.html" class="logo"><span>Aula</span>Virtual</a>
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
        <!--sidebar left start-->
        <aside class="sidebar">
            <div id="leftside-navigation" class="nano">
                <ul class="nano-content">
                    <li class="active">
                        <a href="dashboard.jsp"><i class="fa fa-dashboard"></i><span>Inicio</span></a>
                    </li>
                    <li id="docente">
                        <a href="#"><i class="fa fa-cogs"></i><span>Docentes</span></a>
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
                    
                   
                </ul>
            </div>

        </aside>
        <!--sidebar left end-->
        <!--main content start-->
        <div id="contenidoDerecha">
        <section class="main-content-wrapper">
            <section id="main-content">
                <!--tiles start-->
                
                    <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-red">
                            <div class="content">
                                <h1 class="text-left timer" data-from="0" data-to="180" data-speed="2500"> </h1>
                                <p>New Users</p>
                            </div>
                            <div class="icon"><i class="fa fa-users"></i>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-turquoise">
                            <div class="content">
                                <h1 class="text-left timer" data-from="0" data-to="56" data-speed="2500"> </h1>
                                <p>New Comments</p>
                            </div>
                            <div class="icon"><i class="fa fa-comments"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-blue">
                            <div class="content">
                                <h1 class="text-left timer" data-from="0" data-to="32" data-speed="2500"> </h1>
                                <p>New Messages</p>
                            </div>
                            <div class="icon"><i class="fa fa fa-envelope"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-purple">
                            <div class="content">
                                <h1 class="text-left timer" data-to="105" data-speed="2500"> </h1>
                                <p>New Sales</p>
                            </div>
                            <div class="icon"><i class="fa fa-bar-chart-o"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row" >
                    <div class="col-sm-12">
                        <h1>inicio</h1>
                    </div>
                    
                </div>
               
                
               
            </section>
        </section>
             </div>
        
    </section>
    <!--Global JS-->
    <script src="assets/js/jquery-1.10.2.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/waypoints/waypoints.min.js"></script>
    <script src="assets/js/application.js"></script>
    
    <!--para contenido derecha-->
    <script src="assets/plugins/countTo/jquery.countTo.js"></script>
    <script src="assets/plugins/weather/js/skycons.js"></script>
   
    
    <script>
        $(document).ready(function() {
            
            
            
            $("#docente").click(function(){
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

