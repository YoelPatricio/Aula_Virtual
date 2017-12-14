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




function dialogoNota(idTra,idIns) {
    debugger;
    $('#nota').val(null);

    $("#dialog").dialog({
        resizable: false,
        modal: true,
        width: 350,
        height: 280,
        buttons: [
            {
                text: "Grabar",
                click: function () {

                    debugger;
                    cargando();
                    $.ajax({
                        url: 'NotaServlet',
                        type: 'POST',
                        data: {
                            idTra: idTra,
                            nota: $('#nota').val(),
                            idIns: idIns
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
