$("#btnCrearAlbum").click(function () {
    var tabla = document.getElementById("tabla");
    var lista = document.getElementById("listaGeneroFinal");
    var temas = "";
    var generos = "";
    var i;
    if (tabla.rows.length > 1 && lista.length > 0 && $("#txtnombreAlbum").val().length > 0 && $("#txtAnio").val().length > 0 ){
        
        
        for (i = 1; i < tabla.rows.length; i++) {
            temas = temas + tabla.rows[i].cells[0].innerHTML + "~" + tabla.rows[i].cells[1].innerHTML + "~" + tabla.rows[i].cells[2].innerHTML + "~" + tabla.rows[i].cells[3].innerHTML + "@";
        }
    for (i = 0; i < lista.length; i++) {
        generos = generos + lista.options[i].text + "&";
    }

    $.ajax({
        type: "POST",
        url: "/Tarea2/SContenido",
        data: {
            "nombreAlbum": $("#txtnombreAlbum").val().toString(),
            "nickArtista":  $("#nick").val().toString(),
            "anio": $("#txtAnio").val().toString(),
            "generos": generos,
            "temas": temas,
            "accion": "crearAlbum"
        },
        success: function (data) {
            window.location = "/Tarea2/SInicio?mensaje=El Album Fue Creado Exitosamente";
        },
        error: function () {
            alert("Error en el servelt, al momento de ingresar el album");
        }

    });
    }else{
        
         alert("Falta Ingresar Algun Campo");
    }

});

$("#btnAgregar").click(function () {
    
    var lista = document.getElementById("listaGeneros");
    var listafinal = document.getElementById("listaGeneroFinal");
   
    var genero = document.createElement("option");
    genero.textContent = lista.options[lista.selectedIndex].value;
    listafinal.add(genero);
    lista.remove(lista.selectedIndex);

});
$("#btnQuitar").click(function () {
    var lista = document.getElementById("listaGeneros");
    var listafinal = document.getElementById("listaGeneroFinal");
    var genero = document.createElement("option");
    genero.textContent = listafinal.options[listafinal.selectedIndex].value;
    listafinal.remove(listafinal.selectedIndex);
    lista.add(genero);

});
$("#btnTemaRemoto").click(function () {
    var url = document.getElementById("txtTemaRemoto");
    var temas = document.getElementById("listaTemas");
    var tema = document.createElement("option");
    tema.textContent = url.value;
    temas.add(tema);
    url.value = "";

});

$("#btnAgregarTema").click(function () {
    var temas = "";
    var checLocal = document.getElementById("ChecLocal");
    var checUrl = document.getElementById("ChecUrl");
    if (checLocal.checked) {
        document.getElementById("form").submit();
        var archivo = document.getElementById("file").value;
        archivo = archivo.split('\\');
        temas = archivo[archivo.length - 1];
        alert(temas);
    }
    if (checUrl.checked) {
        temas = document.getElementById("txtTemaRemoto").value;
    }
    var nombre = document.getElementById("txtNombre");
    var duracion = document.getElementById("txtDuracion");
    var posicion = document.getElementById("txtPosicion");
    var tabla = document.getElementById("tabla");
    var fila = document.createElement("tr");
    var columna1 = document.createElement("td");
    var columna2 = document.createElement("td");
    var columna3 = document.createElement("td");
    var columna4 = document.createElement("td");
    var textoCelda1 = document.createTextNode(temas);
    var textoCelda2 = document.createTextNode(nombre.value);
    var textoCelda3 = document.createTextNode(posicion.value);
    var textoCelda4 = document.createTextNode(duracion.value);
    columna1.appendChild(textoCelda1);
    columna2.appendChild(textoCelda2);
    columna3.appendChild(textoCelda3);
    columna4.appendChild(textoCelda4);
    fila.appendChild(columna1);
    fila.appendChild(columna2);
    fila.appendChild(columna3);
    fila.appendChild(columna4);
    fila.onclick = function () {
        $(this).remove();

    };
    tabla.appendChild(fila);
    tabla.style.background = "white";

});

var correctoNombreAlbum = false;
$("#txtnombreAlbum").keyup(function () {
    if ($("#txtnombreAlbum").val().toString() === "") {
        $("#nicknameAlerta").hide();
        $("#nicknameSuccess").hide();
        $("#faltaNickname").show();
        return correctoNombreAlbum;
    }
    $.ajax({
        type: "POST",
        url: "/Tarea2/SContenido",
        data: {
            "nombreAlbum": $("#txtnombreAlbum").val().toString(),
            "nickArtista": $("#nick").val().toString(),
            "accion": "nombreAlbum"
        },

        success: function (data) {
            if (data === "si") {
                $("#nombreAlerta").show();
                $("#nombreSuccess").hide();
                $("#faltaNombre").hide();
                return correctoNombreAlbum = false;
            } else {
                $("#nombreAlerta").hide();
                $("#nombreSuccess").show();
                $("#faltaNombre").hide();
                return correctoNombreAlbum = true;
            }
        },
        error: function () {
            alert("Error en el servlet, al momento de chequear el Nombre");
        }
    });

});

function mostrar(it, box, other, otherBox) {
    var vis = (box.checked) ? "block" : "none";
    document.getElementById(it).style.display = vis;
    document.getElementById(otherBox).checked = false;
    document.getElementById(other).style.display = "none";
}

