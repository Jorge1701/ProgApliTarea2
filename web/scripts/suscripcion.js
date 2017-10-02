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
            
        },

        error: function () {
            alert("Ha ocurrido un error *bttn-confirmar*");
        }
    });
});

//envio del formulario 