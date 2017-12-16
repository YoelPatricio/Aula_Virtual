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
    $('#txtIdPer').val('');
    $('#txtDNI').val('');
    $('#txtNombres').val('');
    $('#txtPaterno').val('');
    $('#txtMaterno').val('');
    $('#txtCorreo').val('');
    $('#txtCelular').val('');
    $('#txtDireccion').val('');
    $('#txtCIP').val('');
}



function dialogoPersona(accion, tipo, idPer, dni, nombres, paterno, materno, correo, celular, direccion, cip, imgDocente) {
    debugger;
    if (accion == 'edit') {
        $('#txtIdPer').val(idPer);
        $('#txtDNI').val(dni);
        $('#txtNombres').val(nombres);
        $('#txtPaterno').val(paterno);
        $('#txtMaterno').val(materno);
        $('#txtCorreo').val(correo);
        $('#txtCelular').val(celular);
        $('#txtDireccion').val(direccion);
        $('#txtCIP').val(cip);
    } else {
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
                    debugger;
                    var dni = $('#txtDNI').val();
                    var correo = $('#txtCorreo').val();
                    if (dni == "") {
                        alert('INGRESE EL DNI');
                        $('#txtDNI').focus();
                        return;
                    }
                    if (dni.length != 8) {
                        alert('EL DNI DEBE CONTENER 8 CARACTERES');
                        $('#txtDNI').focus();
                        return;
                    }
                    if ($('#txtNombres').val() == "") {
                        alert('INGRESE EL/LOS NOMBRES');
                        return;
                    }
                    if ($('#txtPaterno').val() == "") {
                        alert('INGRESE EL APELLIDO PATERNO');
                        return;
                    }
                    if ($('#txtMaterno').val() == "") {
                        alert('INGRESE EL APELLIDO MATERNO');
                        return;
                    }
                    if (correo == "") {
                        alert('INGRESE EL CORREO');
                        return;
                    }
                    if (correo.indexOf("@") == -1) {
                        alert('EL CORREO NO TIENE EL FORMATO ADECUADO');
                        return;
                    }
                    if (correo.indexOf(".com") == -1 && correo.indexOf(".es") == -1 && correo.indexOf(".COM") == -1 && correo.indexOf(".ES") == -1) {
                        alert('EL CORREO NO TIENE EL FORMATO ADECUADO');
                        return;
                    }
                    if ($('#txtCelular').val() == "") {
                        alert('INGRESE EL NÚMERO DE CELULAR');
                        return;
                    }
                    if ($('#txtDireccion').val() == "") {
                        alert('INGRESE LA DIRECCION');
                        return;
                    }
                    if ($('#txtCIP').val() == "") {
                        alert('INGRESE EL CIP');
                        return;
                    }
                    var inputFileImage = document.getElementById("imgDocente");
                    var file = inputFileImage.files[0];
                    var data = new FormData();

                    if (file == undefined) {
                        alert('INGRESE EL CERTIFICADO DE COLEGIATURA');
                        return;
                    }
                    if ((file.name).indexOf(".jpg") == -1 && (file.name).indexOf(".png") == -1 && (file.name).indexOf(".JPG") == -1 && (file.name).indexOf(".PNG") == -1) {
                        alert('EL CERTIFICADO DE COLEGIATURA DEBE SER DE FORMATO JPG/PNG');
                        return;
                    }

                    $.ajax({
                        url: 'ValidarDNIServlet',
                        type: 'POST',
                        data: {
                            dni: dni

                        },
                        success: function (responseText) {
                            debugger;
                            if (responseText == 'true') {
                                if (accion == 'add') {
                                    cargando();
                                }


                                data.append('imgDocente', file);
                                data.append('txtIdPer', $('#txtIdPer').val());
                                data.append('txtDNI', $('#txtDNI').val());
                                data.append('txtNombres', $('#txtNombres').val());
                                data.append('txtPaterno', $('#txtPaterno').val());
                                data.append('txtMaterno', $('#txtMaterno').val());
                                data.append('txtCorreo', $('#txtCorreo').val());
                                data.append('txtCelular', $('#txtCelular').val());
                                data.append('txtDireccion', $('#txtDireccion').val());
                                data.append('txtCIP', $('#txtCIP').val());
                                data.append('accion', accion);
                                data.append('tipo', tipo);

                                $(this).dialog("close");
                                if (accion == 'add') {
                                    addAjax(data);
                                } else {
                                    editAjax(data);
                                }


                            } else {
                                alert("EL DNI INGRESADO YA SE ENCUENTRA REGISTRADO");
                                return;

                            }

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

function dialogCertificado(img) {
    debugger;
    //$('#imgCertificado').html("<img src='C:/AulaVirtual_Files/certificate/logo_muni.png' height='300' width='700'>"); 

    var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
    var img = document.getElementById('myImg');
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");

    modal.style.display = "block";
    modalImg.src = "certificate/logo_muni.png";
    captionText.innerHTML = this.alt;


// Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

    //$("#contenidoDerecha").load("certificate.jsp?img=" + img);
}

function dialogCertificado2(img) {
    debugger;
    if (img == "undefined" || img == "") {
        $('#imgCertificado').html("<br><br><br><br><br><br><br><br><h1>NO EXISTE CERTIFICADO ADJUNTADO</h1>");

    } else {
        $('#imgCertificado').html("<img src='certificate/" + img + "' height='480' width='900'>");
    }


    $("#dialogCertificado").dialog({
        resizable: false,
        modal: true,
        width: 1000,
        height: 600,
        buttons: [
            {
                text: "Cerrar",
                click: function () {

                    $(this).dialog("close");
                }
            }
        ]
    });
}

function deletePersona(idPer) {
    debugger;
    cargando();
    $.ajax({
        url: 'PersonaServlet',
        type: 'POST',
        data: {
            idPer: idPer,
            accion: 'delete'
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

    //$(this).dialog("close");
}

function addAjax(data) {

    $.ajax({
        url: 'PersonaServlet',
        type: 'POST',
        contentType: false,
        data: data,
        processData: false,
        cache: false,
        success: function (responseText) {
            debugger;
            $("#dialogCargando").dialog("close");
            if (responseText == 'true') {

                mostrarAlerta();

            } else {

                mostrarAlertaError();

            }

        }
    });


}
function editAjax(data) {
    $.ajax({
        url: 'PersonaServlet',
        type: 'POST',
        contentType: false,
        data: data,
        processData: false,
        cache: false,
        success: function (responseText) {


            if (responseText == 'true') {

                mostrarAlerta();

            } else {

                mostrarAlertaError();

            }

        }
    });
}

function validarDNI(dni) {
    $.ajax({
        url: 'ValidarDNIServlet',
        type: 'POST',
        data: {
            dni: dni

        },
        success: function (responseText) {
            debugger;
            if (responseText == 'true') {


            } else {
                alert("EL DNI INGRESADO YA SE ENCUENTRA REGISTRADO");
                return;

            }

        }
    });
}