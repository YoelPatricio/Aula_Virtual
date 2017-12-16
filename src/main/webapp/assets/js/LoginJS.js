//$(document).ready(function () {
//    $('#example').dataTable();

//});

function validarLogin(){
    debugger;
    var user = $('#user').val();
    var pass = $('#pass').val();
    $.ajax({
        url: 'LoginServlet',
        type: 'POST',
        data: {
            user: user,
            pass: pass
        },
        success: function (responseText) {
            debugger;
       
           if (responseText == 'false') {

                //document.getElementById("errorSession").innerHTML = "<p style='color: red'>Usuario o Contraseña Incorrecto</p>";
                
            } 

        }
    });
}

function destroySession(){
    debugger;

    $.ajax({
        url: 'LoginServlet',
        type: 'POST',
        data: {
            accion: 'destroy'  
        },
        success: function (responseText) {
            debugger;
            var url='login.jsp';
            
            location.href = url;
        }
    });
}

function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57)
}

function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }

/*
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
    $('#txtIdPer').val('');
    $('#txtDNI').val('');
    $('#txtNombres').val('');
    $('#txtPaterno').val('');
    $('#txtMaterno').val('');
    $('#txtCorreo').val('');
    $('#txtCelular').val('');
    $('#txtDireccion').val('');

}



function dialogoPersona(accion, tipo, idPer, dni, nombres, paterno, materno, correo, celular, direccion) {
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
                    if (accion == 'add') {
                        cargando();
                    }
                    var txtDNI = $('#txtDNI').val();
                    var porId=document.getElementById("txtDNI").value;
                    debugger;

                    var data = new FormData();
                    debugger;

                    data.append('txtIdPer', idPer);
                    data.append('txtDNI', $('#txtDNI').val());
                    data.append('txtNombres', $('#txtNombres').val());
                    data.append('txtPaterno', $('#txtPaterno').val());
                    data.append('txtMaterno', $('#txtMaterno').val());
                    data.append('txtCorreo', $('#txtCorreo').val());
                    data.append('txtCelular', $('#txtCelular').val());
                    data.append('txtDireccion', $('#txtDireccion').val());

                    data.append('accion', accion);
                    data.append('tipo', tipo);

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

function dialogoPersonaEdit(accion, tipo, idPer, dni, nombres, paterno, materno, correo, celular, direccion) {


    debugger;
       
            $('#txtIdPer').val(idPer);
            $('#txtDNI').val(dni);
            $('#txtNombres').val(nombres);
            $('#txtPaterno').val(paterno);
            $('#txtMaterno').val(materno);
            $('#txtCorreo').val(correo);
            $('#txtCelular').val(celular);
            $('#txtDireccion').val(direccion);

        
    

    $("#dialog").dialog({
        resizable: false,
        modal: true,
        width: 650,
        height: 550,
        buttons: [
            {
                text: "Grabar",
                click: function () {
                    
                    var txtDNI = $('#txtDNI').val();
                    var porId=document.getElementById("txtDNI").value;
                    debugger;

                    var data = new FormData();
                    debugger;

                    data.append('txtIdPer', idPer);
                    data.append('txtDNI', $('#txtDNI').val());
                    data.append('txtNombres', $('#txtNombres').val());
                    data.append('txtPaterno', $('#txtPaterno').val());
                    data.append('txtMaterno', $('#txtMaterno').val());
                    data.append('txtCorreo', $('#txtCorreo').val());
                    data.append('txtCelular', $('#txtCelular').val());
                    data.append('txtDireccion', $('#txtDireccion').val());

                    data.append('accion', accion);
                    data.append('tipo', tipo);

                    
                   
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




function deletePersona(idPer) {
    debugger;
    cargando();
    $.ajax({
        url: 'AdministradorServlet',
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
        url: 'AdministradorServlet',
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
        url: 'AdministradorServlet',
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
}*/

