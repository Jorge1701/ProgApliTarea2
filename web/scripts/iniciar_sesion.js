$("#cerrarSesion").click(function () {
    window.location = "index.jsp";
});

$("#btnSesion").hide();


$("#btnIniciarSesion").click(function () {

    $.ajax({
        type: "POST",
        url: "/Tarea2/SSesion",
        data: {"accion": "iniciarSesion",
            "nickname": $("#txtNickname").val().toString(),
            "contrasenia": md5($("#txtPass").val().toString())
        },
        success: function (data) {
            window.location = "/Tarea2/SInicio";
        }

    });

});