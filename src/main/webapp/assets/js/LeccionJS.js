//$(document).ready(function () {
//    $('#example').dataTable();

//});

function dialogoVideo(video) {
    debugger;
    if (video == "undefined" || video == "") {
        $('#divVideo').html("<br><br><br><br><br><br><br><br><h1>NO EXISTE VIDEO ADJUNTADO</h1>");

    } else {
        var src="lessons/video/"+video;
        $('#sourceVideo').html("<source src='"+src+"'  type='video/mp4'>");
        //$('#divVideo').html("<img src='certificate/" + img + "' height='480' width='900'>");
    }
    
    
    $("#dialogoVideo").dialog({
        resizable: false,
        modal: true,
        width: 750,
        height: 550,
        open: function (event, ui) {
            $(".ui-dialog-titlebar-close", ui.dialog).hide();
        },
        buttons: [
            {
                text: "Cerrar",
                click: function () {
                    //$("#contenidoDerecha").load("administrador.jsp");
                   
                    $(this).dialog("close");
                }
            }
        ]
    });
}



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
   
    $('#txtNombre').val('');
    


}

function dialogoLeccion(accion,idCur) {
    debugger;

    if (accion == 'edit') {


    } else {
        limpiarDialogo();
    }


    $("#dialog").dialog({
        resizable: false,
        modal: true,
        width: 650,
        height: 400,
        buttons: [
            {
                text: "Grabar",
                click: function () {
                    if (accion == 'add') {
                        cargando();
                    }

                    var inputFileVideo = document.getElementById("video");
                    var video = inputFileVideo.files[0];
                    var inputFileArchivo = document.getElementById("archivo");
                    var archivo = inputFileArchivo.files[0];
                    var data = new FormData();
                    debugger;

                    data.append('video', video);
                    data.append('archivo', archivo);
                    data.append('txtNombre', $('#txtNombre').val());
                    data.append('txtIdCur', idCur);
                    data.append('accion', accion);


                    $(this).dialog("close");
                    if (accion == 'add') {
                        addAjax(data);
                    } else {
                        editAjax(data);
                    }



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

function dialogoLeccionEdit(accion, idLec,idCur, nombre, video, archivo) {


    debugger;

  
    $('#txtIdLec').val(idLec); 
    $('#txtNombre').val(nombre);
    
    $("#dialog").dialog({
        resizable: false,
        modal: true,
        width: 650,
        height: 400,
        buttons: [
            {
                text: "Grabar",
                click: function () {


                    var inputFileVideo = document.getElementById("video");
                    var video = inputFileVideo.files[0];
                    var inputFileArchivo = document.getElementById("archivo");
                    var archivo = inputFileArchivo.files[0];
                    var data = new FormData();
                    debugger;
                    
                    data.append('video', video);
                    data.append('archivo', archivo);
                    data.append('txtIdLec', idLec);
                    data.append('txtIdCur', idCur);
                    data.append('txtNombre', $('#txtNombre').val());
                    
                  
                    data.append('accion', accion);




                    editAjax(data);

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




function deleteLeccion(idLec) {
    debugger;
    cargando();
    $.ajax({
        url: 'LeccionServlet',
        type: 'POST',
        data: {
            idLec: idLec,
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
        url: 'LeccionServlet',
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
                limpiarDialogo();
            }

        }
    });


}
function editAjax(data) {
    $.ajax({
        url: 'LeccionServlet',
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