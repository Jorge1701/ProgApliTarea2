
$("#btnRegistro").click(function () {
    if (correctoNickname === true && correctoEmail === true
            && correctoContrasenia === true && correctoConfContrasenia === true
            && correctoNombre === true && correctoApellido === true
            && correctoDia === true && correctoAnio === true && correctoMes === true) {

        $.ajax({
            type: "POST",
            url: "/Tarea2/SRegistro",
            data: {
                "nickname": $("#txtNickname").val().toString(),
                "email": $("#txtEmail").val().toString(),
                "contrasenia": $("#txtContrasenia").val().toString(),
                "nombre": $("#txtNombre").val().toString(),
                "apellido": $("#txtApellido").val().toString(),
                "dia": $("#txtDia").val().toString(),
                "mes": $("#txtMes").val().toString(),
                "anio": $("#txtAnio").val().toString(),
                "biografia": $("#txtBiografia").val().toString(),
                "link": $("#txtLink").val().toString(),
                "artista": artista,
                "verificacion": "registro"},
            success: function(data){
                window.location = "/Tarea2/SInicio?mensaje=¡Bienvenido! Disfrute de la musica online en vivo";
            },
            
            error: function () {
                alert("Error en el servelt, al momento de ingresar el perfil");
            }
        });

    } else {
        window.alert("Hay algun campo erroneo, verifique");
    }
});


//Verificar que no exista el nickname
var correctoNickname = false;
$("#txtNickname").focusout(function () {
    if ($("#txtNickname").val().toString() === "") {
        $("#nicknameAlerta").hide();
        $("#nicknameSuccess").hide();
        $("#faltaNickname").show();
        return correctoNickname = false;
    }

    $.ajax({
        type: "POST",
        url: "/Tarea2/SRegistro",
        data: {"nickname": $("#txtNickname").val().toString(),
            "verificacion": "nickname"},

        success: function (data) {
            if (data === "si") {
                $("#nicknameAlerta").show();
                $("#nicknameSuccess").hide();
                $("#faltaNickname").hide();
                return correctoNickname = false;
            } else {
                $("#nicknameAlerta").hide();
                $("#nicknameSuccess").show();
                $("#faltaNickname").hide();
                return correctoNickname = true;
            }
        },
        error: function () {
            alert("Error en el servlet, al momento de chequear el Nickname");
        }
    });

});

//Verificar que no exista el Email
var correctoEmail = false;
$("#txtEmail").focusout(function () {
    if ($("#txtEmail").val().toString() === "") {
        $("#emailAlerta").hide();
        $("#emailSuccess").hide();
        $("#faltaEmail").show();
        return correctoEmail = false;
    }

    $.ajax({
        type: "POST",
        url: "/Tarea2/SRegistro",
        data: {"email": $("#txtEmail").val().toString(),
            "verificacion": "email"},

        success: function (data) {
            if (data === "si") {
                $("#emailAlerta").show();
                $("#emailSuccess").hide();
                $("#faltaEmail").hide();
                return correctoEmail = false;
            } else {
                $("#emailAlerta").hide();
                $("#emailSuccess").show();
                $("#faltaEmail").hide();
                return correctoEmail = true;
            }
        },
        error: function () {
            alert("Error en el servlet, al momento de chequear el Email");
        },
    });

});


//Ocultar boton Registrarse(del header)

$("#btnRegistrarse").hide();

//Verificacion de contraseña

var correctoContrasenia = false;

$("#txtContrasenia").focusout(function () {
    var contrasenia = $("#txtContrasenia").val().toString();
    if (contrasenia === "") {
        $("#faltaContrasenia").show();
        return correctoContrasenia = false;
    } else {
        $("#faltaContrasenia").hide();
        return correctoContrasenia = true;
    }
});


var correctoConfContrasenia = false;
$("#txtConfContrasenia").keyup(function () {

    var contrasenia = $("#txtContrasenia").val().toString();
    var verifContrasenia = $("#txtConfContrasenia").val().toString();
    if (contrasenia !== verifContrasenia) {
        $("#alertaContrasenia").show();
        return correctoConfContrasenia = false;
    } else {
        $("#alertaContrasenia").hide();
        return correctoConfContrasenia = true;
    }

});
$("#txtContrasenia").click(function () {
    $("#alertaContrasenia").hide();
    $("#faltaContrasenia").hide();
});
$("#txtConfContrasenia").click(function () {
    $("#alertaContrasenia").hide();
});


//Comprobacion de Nombre y Apellido

var correctoNombre = false;
$("#txtNombre").focusout(function () {
    var nombre = $("#txtNombre").val().toString();

    if (nombre === "") {
        $("#alertaNombre").show();
        return correctoNombre = false;
    } else {
        $("#alertaNombre").hide();
        return correctoNombre = true;
    }
});
var correctoApellido = false;
$("#txtApellido").focusout(function () {
    var apellido = $("#txtApellido").val().toString();

    if (apellido === "") {
        $("#alertaNombre").show();
        return correctoApellido = false;
    } else {
        $("#alertaNombre").hide();
        return correctoApellido = true;
    }
});
//Comprobacion de fecha

var correctoDia = false;
$("#txtDia").focusout(function () {
    var d = $("#txtDia").val().toString();
    if (d === "") {
        $("#alertaFecha").show();
        return correctoDia = false;
    }

    var dia = parseInt(d);
    //Comprobar que no sean letras
    if (dia.toString() === "NaN") {
        $("#alertaFecha").show();
        return correctoDia = false;
    } else {

        if (dia <= 0 || dia >= 32) {
            $("#alertaFecha").show();
            return correctoDia = false;
        } else {
            $("#alertaFecha").hide();
            return correctoDia = true;
        }
    }
});

var correctoAnio = false;
$("#txtAnio").focusout(function () {
    var a = $("#txtAnio").val().toString();
    if (a === "") {
        $("#alertaFecha").show();
        return correctoAnio = false;
    }

    var anio = parseInt(a);
    if (anio.toString() === "NaN") {
        $("#alertaFecha").show();
        return correctoAnio = false;
    } else {

        if (anio <= 1900 || anio >= 2018) {
            $("#alertaFecha").show();
            return correctoAnio = false;
        } else {
            $("#alertaFecha").hide();
            return correctoAnio = true;
        }
    }
});
var correctoMes = false;
$("#txtMes").focusout(function () {
    var mes = $("#txtMes").val().toString();
    if (mes === "mes") {
        $("#alertaFecha").show();
        return correctoMes = false;
    } else {
        $("#alertaFecha").hide();
        return correctoMes = true;
    }
});
// Mostrar o ocultar datos del Artista

var artista = "no";
$("#btnCliente").click(function () {
    $("#datosArtista").hide();
    return artista = "no";
});


$("#btnArtista").click(function () {
    $("#datosArtista").show();
    return artista = "si";
});