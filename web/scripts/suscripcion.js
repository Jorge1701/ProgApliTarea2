function cancelarSuscripcion(estado, cuota, fecha, fechaVenc) {
    $.ajax({
        type: "POST",
        url: "/Tarea2/SSuscripcion",
        data: {
            "Estado": estado,
            "Cuota": cuota,
            "Fecha": fecha,
            "FechaVenc": fechaVenc,
            "accion": "cancelar"},
        success: function (data) {
            alert("Su suscripción fue cancelada con éxito");
            window.location = "/Tarea2/SSuscripcion?accion=redir1";
        },

        error: function () {
            alert("Ha ocurrido un error al procesar su solicitud");
        }
    });
}

function renovarSuscripcion(estado, cuota, fecha, fechaVenc) {
    $.ajax({
        type: "POST",
        url: "/Tarea2/SSuscripcion",
        data: {
            "Estado": estado,
            "Cuota": cuota,
            "Fecha": fecha,
            "FechaVenc" : fechaVenc,
            "accion": "renovar"},
        success: function (data) {
            alert("Su suscripción fue renovada con éxito");
            window.location = "/Tarea2/SSuscripcion?accion=redir1";
        },

        error: function () {
            alert("Ha ocurrido un error al procesar su solicitud");
        }
    });
}


$("#Cuota").change(function () {

    $.ajax({
        type: "POST",
        url: "/Tarea2/SSuscripcion",
        data: {
            "Cuota": $("#Cuota").val().toString(),
            "accion": "monto"},
        success: function (data) {
            $("#montototal").text("El monto total a pagar es: $" + data);
        },

        error: function () {
            alert("Error en el servlet");
        }
    });

});

//lo de arriba saca el monto a pagar

$("#btnConfirmar").click(function () {

    $.ajax({
        type: "POST",
        url: "/Tarea2/SSuscripcion",
        data: {
            "Cuota": $("#Cuota").val().toString(),
            "accion": "registro"},
        success: function (data) {
            alert("Su suscripción fue ingresada con éxito");
            window.location = "/Tarea2/SInicio";
        },

        error: function () {
            alert("Ha ocurrido un error al procesar su solicitud");
        }
    });
});

//envio del formulario

/*$("#btnCancelar").click(function () {
 
 $.ajax({
 type: "POST",
 url: "/Tarea2/SSuscripcion",
 data: {
 "accion": "cancelar"},
 success: function (data) {
 alert("Su suscripción fue cancelada con éxito");
 window.location = "/Tarea2/SSuscripcion?accion=redir1";
 },
 
 error: function () {
 alert("Ha ocurrido un error al procesar su solicitud");
 }
 });
 });*/

//renovar

/*$("#btnRenovar").click(function () {
 
 $.ajax({
 type: "POST",
 url: "/Tarea2/SSuscripcion",
 data: {
 "Estado": $("#Estado").val().toString(),
 "Cuota": $("#Cuota").val().toString(),
 "Fecha": $("#Fecha").val().toString(),
 "accion": "renovar"},
 success: function (data) {
 alert("Su suscripción fue renovada con éxito");
 window.location = "/Tarea2/SSuscripcion?accion=redir1";
 },
 
 error: function () {
 alert("Ha ocurrido un error al procesar su solicitud");
 }
 });
 });*/