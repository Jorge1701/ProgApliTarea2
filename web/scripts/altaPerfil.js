//Ocultar boton Registrarse

$("#btnRegistrarse").hide();

//Verificacion de contraseña

$("#txtContrasenia").focusout(function () {
    var contrasenia = $("#txtContrasenia").val().toString();

    if (contrasenia == "") {
        $("#faltaContrasenia").show();
        return false;
    } else {
        $("#faltaContrasenia").hide();
        return true;
    }
});


$("#txtConfContrasenia").focusout(function () {

    var contrasenia = $("#txtContrasenia").val().toString();
    var verifContrasenia = $("#txtConfContrasenia").val().toString();

    if (contrasenia != verifContrasenia) {
        $("#alertaContrasenia").show();
        return false;
    } else {
        $("#alertaContrasenia").hide();
        return true;
    }

});
$("#txtContrasenia").click(function () {
    $("#alertaContrasenia").hide();
    $("#faltaContrasenia").hide();
});

$("#txtConfContrasenia").click(function () {
    $("#alertaContrasenia").hide();
});



//Verificacion de Nombre y Apellido

$("#txtNombre").focusout(function () {
    var nombre = $("#txtNombre").val().toString();
    var apellido = $("#txtApellido").val().toString();

    if (nombre == "" || apellido == "") {
        $("#alertaNombre").show();
        return false;
    } else {
        $("#alertaNombre").hide();
        return true;
    }
});

$("#txtApellido").focusout(function () {
    var apellido = $("#txtApellido").val().toString();
    var nombre = $("#txtApellido").val().toString();

    if (apellido == "" || nombre == "") {
        $("#alertaNombre").show();
        return false;
    } else {
        $("#alertaNombre").hide();
        return true;
    }
});

// Mostrar o ocultar datos del Artista

$("#btnCliente").click(function () {
    $("#datosArtista").hide();
});

$("#btnArtista").click(function () {
    $("#datosArtista").show();
});





