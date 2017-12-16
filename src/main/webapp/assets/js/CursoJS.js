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

function dialogoCurso(accion, idCur, nombre, desc, doc, precio, trabajo) {
    debugger;


    if (accion == 'edit') {
        $('#txtIdCur').val(idCur);
        $('#txtNombre').val(nombre);
        $('#txtDesc').val(desc);
        $('#txtDoc').val(doc);
        $('#txtPrecio').val(precio);

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
                    
                    if($('#txtNombre').val()==""){
                        alert('INGRESE EL NOMBRE DEL CURSO');
                  
                        return;
                    }
                    if($('#txtDesc').val()==""){
                        alert('INGRESE LA DESCRIPCION DEL CURSO');
                  
                        return;
                    }
                    if($('#txtDoc').val()==0){
                        alert('SELECCIONE AL DOCENTE');
                  
                        return;
                    }
                    if($('#txtPrecio').val()==""){
                        alert('INGRESE EL PRECIO');
                  
                        return;
                    }
                    
                    
                    
                    
                    if (accion == 'add') {
                        cargando();
                    }


                    var data = new FormData();
                    debugger;

                    data.append('txtIdCur', idCur);
                    data.append('txtNombre', $('#txtNombre').val());
                    data.append('txtDesc', $('#txtDesc').val());
                    data.append('txtDoc', $('#txtDoc').val());
                    data.append('txtPrecio', $('#txtPrecio').val());
                    data.append('txtTrabajo', '');


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

function dialogoCursoEdit(accion, idCur, nombre, desc, doc, precio, trabajo) {


    debugger;

    $('#txtIdCur').val(idCur);
    $('#txtNombre').val(nombre);
    $('#txtDesc').val(desc);
    $('#txtDoc').val(doc);
    $('#txtPrecio').val(precio);




    $("#dialog").dialog({
        resizable: false,
        modal: true,
        width: 650,
        height: 550,
        buttons: [
            {
                text: "Grabar",
                click: function () {

                    if($('#txtNombre').val()==""){
                        alert('INGRESE EL NOMBRE DEL CURSO');
                  
                        return;
                    }
                    if($('#txtDesc').val()==""){
                        alert('INGRESE LA DESCRIPCION DEL CURSO');
                  
                        return;
                    }
                    if($('#txtDoc').val()==0){
                        alert('SELECCIONE AL DOCENTE');
                  
                        return;
                    }
                    if($('#txtPrecio').val()==""){
                        alert('INGRESE EL PRECIO');
                  
                        return;
                    }
                    cargando();
                    var data = new FormData();
                    debugger;

                    data.append('txtIdCur', idCur);
                    data.append('txtNombre', $('#txtNombre').val());
                    data.append('txtDesc', $('#txtDesc').val());
                    data.append('txtDoc', $('#txtDoc').val());
                    data.append('txtPrecio', $('#txtPrecio').val());
                    data.append('txtTrabajo', trabajo);

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




function deleteCurso(idCurso) {
    debugger;
    cargando();
    $.ajax({
        url: 'CursoServlet',
        type: 'POST',
        data: {
            idCur: idCurso,
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
        url: 'CursoServlet',
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
        url: 'CursoServlet',
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

function uploadJob(idCur) {
    debugger;



    $("#uploadJob").dialog({
        resizable: false,
        modal: true,
        width: 650,
        height: 270,
        buttons: [
            {
                text: "Grabar",
                click: function () {

                    
                    var inputFileImage = document.getElementById("job");
                    var file = inputFileImage.files[0];
                    var data = new FormData();
                    if(file==undefined){
                        alert('INGRESE EL TRABAJO FINAL DEL CURSO');
                        return;
                    }
                    if((file.name).indexOf(".JAR")==-1 && (file.name).indexOf(".jar")==-1 && (file.name).indexOf(".ZIP")==-1 && (file.name).indexOf(".zip")==-1){
                        alert('EL ARCHIVO DEL TRABAJO FINAL DEBE SER DE FORMATO JAR/ZIP');
                        return;
                    }
                    
                    cargando();
                   
                    data.append('job', file);
                    data.append('idCur', idCur);


                    $.ajax({
                        url: 'UploadJobServlet',
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

            }, {
                text: "Cancelar",
                click: function () {
                    $(this).dialog("close");
                }
            }
        ]
    });
}


function uploadStudentJob(idIns) {
    debugger;



    $("#uploadJob").dialog({
        resizable: false,
        modal: true,
        width: 650,
        height: 270,
        buttons: [
            {
                text: "Grabar",
                click: function () {

                    


                    debugger;
                    var inputFileImage = document.getElementById("job");
                    var file = inputFileImage.files[0];
                    var data = new FormData();
                    if(file==undefined){
                        alert('INGRESE EL TRABAJO FINAL DEL CURSO');
                        return;
                    }
                    if((file.name).indexOf(".JAR")==-1 && (file.name).indexOf(".jar")==-1 && (file.name).indexOf(".ZIP")==-1 && (file.name).indexOf(".zip")==-1){
                        alert('EL ARCHIVO DEL TRABAJO FINAL DEBE SER DE FORMATO JAR/ZIP');
                        return;
                    }
                    cargando();
                    debugger;
                    data.append('job', file);
                    data.append('idIns', idIns);


                    $.ajax({
                        url: 'UploadStudentJobServlet',
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

            }, {
                text: "Cancelar",
                click: function () {
                    $(this).dialog("close");
                }
            }
        ]
    });
}


function dialogoPublicar(idCur) {


    $('#publicar').val(-1);


    $("#dialogoPublicar").dialog({
        resizable: false,
        modal: true,
        width: 250,
        height: 250,
        buttons: [
            {
                text: "Grabar",
                click: function () {
                        if($('#publicar').val()==-1){
                            alert("Eliga opción");
                            return;
                    }
                        debugger;
                        cargando();
                        $.ajax({
                            url: 'PublicarServlet',
                            type: 'POST',
                            data: {
                                idCur: idCur,
                                estado: $('#publicar').val()
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