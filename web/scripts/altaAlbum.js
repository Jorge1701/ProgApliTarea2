/*
$("btnCrear").click(
        function () {
            $.ajax({
                type: "POST",
                url: "/Tarea2/SContenido",
                data:{
                    "nombreAlbum": $("#txtnombreAlbum").val().toString(),
                    "anio": $("txtanio").val().toString(),
                    "mes": $("txtmes").val().toString(),
                    "dia": $("txtdia").val().toString(),
                    "accion": "registroAlbum"},
                             
            })
     }
)*/

$("#btnAgregar").click(function(){
        var lista  = document.getElementById("listaGeneros");
        var listafinal  = document.getElementById("listaGeneroFinal");
        var genero = document.createElement("option");
        genero.textContent = lista.options[lista.selectedIndex].value;
        listafinal.add(genero);

    
    
    
});
$("#btnQuitar").click(function(){
    var listafinal = document.getElementById("listaGeneroFinal");
    var genero = document.createElement("option");
    genero.textContent  = listafinal.options[listafinal.selectedIndex].value;
    listafinal.remove(genero);

    
});