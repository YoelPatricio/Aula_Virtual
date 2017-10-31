<%-- 
    Document   : dialog
    Created on : 29-oct-2017, 13:28:07
    Author     : limati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Dialog - Default functionality</title>



    <link rel="stylesheet" href="https://code.jquery.com/ui/jquery-ui-git.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script type="text/javascript" src="C:/tools3/workspace_patricio/Practice/resources/js/jquery.jqGrid.min.js"></script>
     <!-- The jQuery library is a prerequisite for all jqSuite products -->

    <script type="C:\tools3\workspace_patricio\Practice\resources\js\i18n/grid.locale-en.js"></script>
    <!-- This is the Javascript file of jqGrid -->   


    <link rel="stylesheet" type="text/css" media="screen" href="C:\tools3\workspace_patricio\Practice\resources\css/ui.jqgrid.css" />





  
</head>
<body>
 
<div id="dialog" title="Lecciones" style="display: none;">
  <p>Listado de lecciones del Módulo</p> 
  <input type="text" id="numTar" placeholder="Numero de Tarjeta"/><br><br>
  <input type="text" id="fecVen" placeholder="Fecha de Vencimiento"/><br><br>
  <input type="text" id="numCvv" placeholder="CVV"/><br><br>
  <input type="text" id="saldo"  placeholder="Saldo"/>
  
</div>


<a href="#" id="interesAddButton">Ver dialog</a>



 <script type="text/javascript"> 
        $(document).ready(function () {
           
        
           jQuery("#interesAddButton").click( function(){

             $( function() {
    $( "#dialog" ).dialog({
        resizable: false,
        modal : true,
        width : 750,
        height: 500,
        buttons: [
            {
              text: "Ok",
             
              click: function() {
                $( this ).dialog( "close" );
                alert('Cerrado');
                    $.ajax({
                            url : 'TarjetaController',
                            data : {
                                    numTar : $('#numTar').val(),
                                    fecVen : $('#fecVen').val(),
                                    numCvv : $('#numCvv').val(),
                                    saldo : $('#saldo').val()
                            },
                            success : function(responseText) {
                                    alert(responseText);
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
  } );
            });




        });

         
 
   </script>
 
</body>
</html>