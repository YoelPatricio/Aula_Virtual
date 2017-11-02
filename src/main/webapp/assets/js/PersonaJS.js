$(document).ready(function () {

});


$('#example').dataTable();


function cargando() {
    $("#dialogCargando").dialog({
        resizable: false,
        modal: true,
        width: 350,
        height: 200,
        open: function (event, ui) {
            $(".ui-dialog-titlebar-close", ui.dialog).hide();
        }
    });
}
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



function dialogoPersona() {

    $("#dialog").dialog({
        resizable: false,
        modal: true,
        width: 650,
        height: 550,
        buttons: [
            {
                text: "Grabar",

                click: function () {
                    $(this).dialog("close");

                    $.ajax({
                        url: 'PersonaServlet',
                        type: 'POST',
                        data: {
                            txtDNI: $('#txtDNI').val(),
                            txtNombres: $('#txtNombres').val(),
                            txtPaterno: $('#txtPaterno').val(),
                            txtMaterno: $('#txtMaterno').val(),
                            txtCorreo: $('#txtCorreo').val(),
                            txtCelular: $('#txtCelular').val(),
                            txtDireccion: $('#txtDireccion').val(),
                            txtCIP: $('#txtCIP').val(),
                            imgDocente: $('#imgDocente').val()
                        },
                        success: function (responseText) {



                            mostrarAlerta();

                            

                        }
                    });
                }


                // Uncommenting the following line would hide the text,
                // resulting in the label being used as a tooltip
                //showText: false
            }, {
                text: "Cancelar",
                click: function () {
                    $(this).dialog("close");
                }
            }
        ]
    });
}