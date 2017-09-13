//Verificacion de contraseña

$("#txtVerifContrasenia").focusout(function () {

    var contrasenia = $("#txtContrasenia").val().toString();
    var verifContrasenia = $("#txtVerifContrasenia").val().toString();

    if (contrasenia != verifContrasenia) {
        $("#alertaContrasenia").show();
        return false;
    } else {
        $("#alertaContrasenia").hide();
        return true;
    }

});

$("#txtVerifContrasenia").click(function () {
    $("#alertaContrasenia").hide();
});


$("#txtContrasenia").click(function () {
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

$("#btnCliente").click(function (){
    $("#datosArtista").hide();
});

$("#btnArtista").click(function (){
    $("#datosArtista").show();
});





