$("#btnIniciarSesion").click(function () {
    var nick = $("#txtNickname").val().toString();
    var cont = $("#txtContrasenia").val().toString();

    if (nick == "" || cont == "") {
        $("#alerta").show();
    } else {
        $("#alerta").hide();
        alert("Iniciar sesion con:\nNickname: " + nick + "\nContraseña: " + cont);
    }
});

$("#btnRegistrarse").click(function () {
    alert("Ir a pagina para registrarse...");
});

$("#txtNickname").click(function () {
    $("#alerta").hide();
});

$("#txtContrasenia").click(function () {
    $("#alerta").hide();
});