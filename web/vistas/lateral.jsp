<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>
    </head>
    <body> 
        
        <div class="row">
            <div class="text-center" style="margin-bottom: 15px">
                <img id="imagenRep" src="media/icono.png" width="150" height="150">
            </div>
        </div>

        <div class="row">
            <div class="text-center" style="margin-bottom: 15px">
                <span id="txtNombreTema">
                    nombre
                </span>
            </div>
        </div>
        <div class="row">
            <div class="text-center" style="margin-bottom: 15px">
                <span id="txtNombreArtista" style="font-weight: bold">
                    artista
                </span>
            </div>
        </div>

        <div class="row">
            <div class="text-center" >
                <audio id="aurepr" preload="auto" controls onended="get_next(1)"><source src="vistas/asd.mp3" type="audio/mpeg"></audio>
            </div>
        </div>

        <div class="row">
            <div class="input-group-btn"> 
                <div class="text-center">
                    <button id="btnIzq" class="btn btn-default" type="submit" style=" margin-right: 15px"> <span class="glyphicon glyphicon-backward"></span></button> 
                    <button id="btnDer" class="btn btn-default" type="submit" style="margin-left: 15px"> <span class="glyphicon glyphicon-forward"></span></button>
                </div>
            </div>
        </div>

        <script src="scripts/lateral.js"></script>
    </body>
</html>
