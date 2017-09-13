<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>

        <title>Inicio</title>
    </head>
    <body>
        <div class="container-fluid">
            <!-- Header -->
            <jsp:include page="header.jsp"/>

            <hr>

            <div class="row">
                <!-- Contenido -->
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <div class="col-lg-3 col-md-3 col-sm-2 col-xs-1"></div>
                    <div class="col-lg-6 col-md-6 col-sm-8 col-xs-10" style="background-color: buttonface">
                        <form>
                            <div class="input-group input-group-lg" >
                                <h4 class="text-center">Únete a Espotify</h4>
                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12 "><input type="text" class="form-control" placeholder="Nickname" id="txtNickname"></row>
                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="text" class="form-control" placeholder="Email" id="txtEmail"></row>
                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> <div style="margin: 30px"></div> </row>
                                <row class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><input type="text" class="form-control" placeholder="Nombre" id="txtNombre"></row>
                                <row class="col-lg-6 col-md-6 col-sm-6 col-xs-6"> <input type="text" class="form-control" placeholder="Apellido" id="txtApellido"></row>
                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                    <div  id="alertaNombre" hidden>
                                        <span class="glyphicon glyphicon-alert" style="color: red"></span>
                                        <span style="color: red; padding-left: 5px" id="mensajeAlerta">No puedes dejar ninguno de estos campos en blanco</span>
                                    </div>
                                </row>
                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="password" class="form-control" placeholder="Contraseña" id="txtContrasenia"></row>
                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="password" class="form-control" placeholder="Verificación de contraseña" id="txtVerifContrasenia"></row>
                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                    <div  id="alertaContrasenia" hidden>
                                        <span class="glyphicon glyphicon-alert" style="color: red"></span>
                                        <span style="color: red; padding-left: 5px" id="mensajeAlerta">Las Contraseñas no coinciden</span>
                                    </div>
                                </row>


                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> <div style="margin: 10px"></div> 
                                    <div class="btn-group" data-toggle="buttons">

                                        <label class="btn btn-primary active" id="btnCliente" >
                                            <input type="radio" name="options" autocomplete="off"> Cliente
                                        </label>

                                        <label class="btn btn-primary" data-toggle="collapse" data-target="#datosArtistas" id="btnArtista">
                                            <input type="radio" name="options" autocomplete="off"> Artista
                                        </label>
                                    </div>

                                </row>
                                <div id="datosArtista" hidden >
                                    <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> <div style="margin: 10px"></div> </row>
                                    <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="text" class="form-control" placeholder="Biografia" id="txtBiografia"></row>
                                    <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="text" class="form-control" placeholder="Link" id="txtLink"></row>
                                </div>
                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> <div style="margin: 20px"></div> </row>

                            </div>
                        </form>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-2 col-xs-1"></div>

                    <script src="../scripts/altaPerfil.js"></script>
                </div>

                <!-- Lateral -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="border-style:solid; border-width: 2px; padding: 5px">
                    <jsp:include page = "lateral.jsp"/>
                </div>
            </div>

            <!-- Footer -->
            <jsp:include page = "footer.jsp"/>

        </div>
    </div>
</body>
</html>