<%-- 
    Document   : docente
    Created on : 31/10/2017, 01:41:26 AM
    Author     : Yoel
--%>

<%@page import="com.cpyt.model.Tarjeta"%>
<%@page import="java.util.List"%>
<%@page import="com.cpyt.dao.GenericDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GenericDAO g = new GenericDAO();
    List<Tarjeta> tj = g.listAll("Tarjeta");

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
    </head>
    <body>
        <div id="dialogMensaje" title="Mensaje" style="display: none;">
            <br>

            <h3>Grabado Correctamente!</h3> 

        </div>
        <div id="dialog" title="Lecciones" style="display: none;">



            Num:<input type="text" id="numTar" placeholder="Numero de Tarjeta" class="form-control"/>
            <br>
            <input type="text" id="fecVen" placeholder="Fecha de Vencimiento" class="form-control"/>
            <br>
            <input type="text" id="numCvv" placeholder="CVV" class="form-control"/>
            <br>
            <input type="text" id="saldo"  placeholder="Saldo" class="form-control"/>



        </div>





    </div>

    <section class="main-content-wrapper">
        <section id="main-content">
            <div class="row">
                <br>
                <div class="col-md-10">

                    <h2 class="h1">Docentes</h2>

                </div>
                <div class="col-md-2">

                    <button id="interesAddButton" class="btn btn-success">Agregar</button> 

                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Data Tables</h3>
                            <div class="actions pull-right">
                                <i class="fa fa-chevron-down"></i>
                                <!--<i class="fa fa-times"></i>-->
                            </div>
                        </div>
                        <div class="panel-body">
                            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Numero Tarjeta</th>
                                        <th>Fecha Vencimiento</th>
                                        <th>Numero CVV</th>
                                        <th>Saldo</th>

                                        <th>Action</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <%                                            for (int i = 0; i < tj.size(); i++) {


                                    %>
                                    <tr>
                                        <td><%= tj.get(i).getIdTar()%></td>
                                        <td><%= tj.get(i).getNumTar()%></td>
                                        <td><%= tj.get(i).getFecVen()%></td>
                                        <td><%= tj.get(i).getNumCvv()%></td>
                                        <td><%= tj.get(i).getSaldo()%></td>

                                        <td align="center">
                                            <button>Editar</button>
                                            <button>Borrar</button>

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
        $(document).ready(function () {

            var español = {
                "sProcessing": "Procesando...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "NingÃºn dato disponible en esta tabla",
                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "sInfoThousands": ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ãšltimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                }
            };
            $('#example').dataTable({
                "languaje": español
            });


            jQuery("#interesAddButton").click(function () {

                $(function () {
                    $("#dialog").dialog({
                        resizable: false,
                        modal: true,
                        width: 500,
                        height: 400,
                        buttons: [
                            {
                                text: "Ok",

                                click: function () {
                                    $(this).dialog("close");

                                    $.ajax({
                                        url: 'TarjetaController',
                                        data: {
                                            numTar: $('#numTar').val(),
                                            fecVen: $('#fecVen').val(),
                                            numCvv: $('#numCvv').val(),
                                            saldo: $('#saldo').val()
                                        },
                                        success: function (responseText) {
                                            //alert(responseText);


                                            mostrarAlerta();

                                            $('#numTar').val('');
                                            $('#fecVen').val('');
                                            $('#numCvv').val('');
                                            $('#saldo').val('');

                                        }
                                    });
                                }
                                // Uncommenting the following line would hide the text,
                                // resulting in the label being used as a tooltip
                                //showText: false
                            }
                        ]
                    });
                });
            });
        });

        function mostrarAlerta() {
            $("#dialogMensaje").dialog({
                resizable: false,
                modal: true,
                width: 350,
                height: 200,
                buttons: [
                    {
                        text: "Ok",

                        click: function () {
                            $("#contenidoDerecha").load("docente.jsp");
                            $(this).dialog("close");
                        }
                    }
                ]
            });
        }

    </script>
</body>
</html>
