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

function limpiarDialogo() {
        $('#txtDNI').val('');        
        $('#txtNombres').val('');
        $('#txtPaterno').val('');
        $('#txtMaterno').val('');
        $('#txtCorreo').val('');
        $('#txtCelular').val('');
        $('#txtDireccion').val('');
        $('#txtCIP').val('');
}



function dialogoPersona(accion,idPer,dni,nombres,paterno,materno,correo,celular,direccion,cip,imgDocente) {
    debugger;
    if(accion=='editar'){
        $('#txtDNI').val(dni);        
        $('#txtNombres').val(nombres);
        $('#txtPaterno').val(paterno);
        $('#txtMaterno').val(materno);
        $('#txtCorreo').val(correo);
        $('#txtCelular').val(celular);
        $('#txtDireccion').val(direccion);
        $('#txtCIP').val(cip);   
    }else{
        limpiarDialogo();
    }

    $("#dialog").dialog({
        resizable: false,
        modal: true,
        width: 650,
        height: 550,
        buttons: [
            {
                text: "Grabar",

                click: function () {

                    var inputFileImage = document.getElementById("imgDocente");
                    var file = inputFileImage.files[0];
                    var data = new FormData();
                    debugger;
                    data.append('imgDocente', file);
                    data.append('txtDNI',$('#txtDNI').val());
                    data.append('txtNombres',$('#txtNombres').val());
                    data.append('txtPaterno',$('#txtPaterno').val());
                    data.append('txtMaterno',$('#txtMaterno').val());
                    data.append('txtCorreo',$('#txtCorreo').val());
                    data.append('txtCelular',$('#txtCelular').val());
                    data.append('txtDireccion',$('#txtDireccion').val());
                    data.append('txtCIP',$('#txtCIP').val());
                    data.append('accion',accion);
                   

                    $.ajax({
                        url: 'PersonaServlet',
                        type: 'POST',
                        contentType: false,
                        data: data,
                        processData: false,
                        cache: false,
                        success: function (responseText) {
                            mostrarAlerta();
                            limpiarDialogo();
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