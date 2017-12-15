//$(document).ready(function () {
//    $('#example').dataTable();

//});





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
                    //$("#contenidoDerecha").load("administrador.jsp");
                    window.location.reload();
                    $(this).dialog("close");
                }
            }
        ]
    });
}

function mostrarAlertaError() {

    $("#dialogError").dialog({
        resizable: false,
        modal: true,
        width: 350,
        height: 200,
        buttons: [
            {
                text: "Cerrar",
                click: function () {
                    window.location.reload();
                    $(this).dialog("close");
                }
            }
        ]
    });
}

function limpiarDialogo() {
    $('#txtIdCur').val('');
    $('#txtNombre').val('');
    $('#txtDesc').val('');
    $('#txtDoc').val(0);
    $('#txtPrecio').val('');
   

}

function dialogoInscripcion(idPer,idCur,precio) {
    debugger;

            $('#tarjeta').val(null);
            $('#fv').val('');
            $('#ccv').val(null);
            
    $("#dialog").dialog({
        resizable: false,
        modal: true,
        width: 400,
        height: 350,
        buttons: [
            {
                text: "Inscribir",
                click: function () {
                    
                    debugger;
                    cargando();
                    $.ajax({
                        url: 'InscripcionServlet',
                        type: 'POST',
                        data: {
                            idPer: idPer,
                            idCur: idCur,
                            tarjeta: $('#tarjeta').val(),
                            fv: $('#fv').val(),
                            ccv : $('#ccv').val(),
                            precio: precio
                        },
                        success: function (responseText) {
                            debugger;
                            if (responseText == 'true') {
                                $("#dialogCargando").dialog("close");
                                mostrarAlerta();

                            } else {
                                $("#dialogCargando").dialog("close");
                                mostrarAlertaError();

                            }

                        }
                    });
                    $(this).dialog("close");
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


