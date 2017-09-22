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

//

$("#btnConfirmar").click(function () {

    $.ajax({
        type: "POST",
        url: "/Tarea2/SSuscripcion",
        data: {
            "Cuota": $("#Cuota").val().toString(),
            "accion": "registro",},
        success: function (data) {
            window.location = "/Tarea2/SInicio";
        },

        error: function () {
            alert("Error en el servelt, al momento de ingresar la suscripcion");
        }
    });
});