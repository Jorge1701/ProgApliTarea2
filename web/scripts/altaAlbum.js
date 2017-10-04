$("btnAceptar").click(
        function () {
            var cantidad = $("listaGeneroFinal").size();
             var iterator  = document.getElementById("listaGeneroFinal").values();          
            var array = []; 
            while( iterator.next() ){
                array.push(iterator.next().toString());
                
            }

            $.ajax({
                type: "POST",
                url: "/Tarea2/SContenido",
                data:{
                    "nombreAlbum": $("#txtnombreAlbum").val().toString(),
                    "anio": $("#txtanio").val().toString(),
                    "imagen": document.getElementById("nombreImagen").files[0].name,
                    "genero": array ,
                    "accion":"crearAlbum"
                }, 
                 success: function (data) {
           window.location = "/Tarea2/SInicio?mensaje=El Album Fue Creado Exitosamente";
            },
             error: function () {
                alert("Error en el servelt, al momento de ingresar el album");
            }
                             
              });
     });
     


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
