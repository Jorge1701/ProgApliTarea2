<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>
    </head>
    <body>        
        <div class="row" style="padding-top: 20px">
            <!-- Logo y nombre -->
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <div class="container">
                    <img src="media/icono.png" class="pull-left" width="80" height="80">
                    <h1 class="pull-left" style="padding-left: 5px">Espotify</h1>
                </div>
            </div>

            <!-- Buscador -->
            <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12" style="padding-top: 23px">
                <form>
                    <div class="input-group input-group-lg">
                        <input type="text" class="form-control" placeholder="Tema, Lista o Album">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Iniciar Sesion -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="padding-top: 10px">
                <div class="input-group input-group-md">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input type="text" class="form-control" placeholder="Nickname" id="txtNickname">


                    <div class="input-group-btn">
                        <button class="btn btn-default" id="btnIniciarSesion">Iniciar Sesion</button>
                    </div>
                </div>
                <div class="input-group input-group-md">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" class="form-control" placeholder="Contraseña" id="txtContrasenia">

                    <div class="input-group-btn">

                        <button class="btn btn-default" id="btnRegistrarse">Registrarse</button>

                    </div>
                </div>
                <div class="container" style="padding-top: 5px" hidden="hidden" id="alerta">
                    <span class="glyphicon glyphicon-alert" style="color: red"></span>
                    <span style="color: red; padding-left: 5px" id="mensajeAlerta">Faltan campos</span>
                </div>
            </div>

        </div>

        <script src="scripts/iniciar_sesion.js"></script>
    </body>
</html>
