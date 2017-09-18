<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="servlets.IniciarSesionServlet"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>
    </head>
    <body class="navbar-fixed-top">        
        <div class="row" style="padding-top: 20px">
            <!-- Logo y nombre -->
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <div class="container">
                    <img src="media/icono.png" class="pull-left" width="80" height="80">
                    <h1 class="pull-left" style="padding-left: 5px ; color: lavender">Espotify</h1>
                </div>
            </div>

            <!-- Buscador -->
            <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12" style="padding-top: 23px">
                <form>
                    <div class="input-group input-group-lg">
                        <input type="text" style="border-color: black" class="form-control" placeholder="Tema, Lista o Album">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit" style="border-color: black"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                    </div>
                </form>
            </div>

            <%
                boolean logeado = false;
                try {
                    logeado = IniciarSesionServlet.usuarioLogeado(request);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                if (logeado) {
            %>

            <!-- Perfil de Usuario -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="padding-top: 10px ; padding-left: 200px" id="formPU">
                <div>
                    <img src="media/Heisenberg.jpg" class="img-circle pull-left" width="65" height="65" style="margin-right: 20px" id="puImagen">
                    <div style="margin: 0px; color:lavender; text-shadow: 2px 2px 4px #000000" id="puNombre"><a href="/Tarea2/SConsultarPerfil?nickUs=el_padrino">Nombre Apellido</a></div>
                    <button class="btn btn-info btn-xs" style="margin-bottom : 3px"><span class="glyphicon glyphicon-star">Favoritos</span></button><br>
                    <a href="/Tarea2/CerrarSesionServlet" class="btn btn-link btn-xs">Cerrar Sesion</a>
                </div> 
            </div>

            <% }
                if (!logeado) {
            %>

            <!-- Opciones -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="padding-top: 10px">
                <div class="container">
                    <a href="/Tarea2/PaginaISServlet" class="btn btn-default" id="btnSesion" style="margin-left: 70px; border-color: black">Iniciar Sesion</a>
                    <a href="/Tarea2/SRegistro?accion=redirigir" class="btn btn-default" id="btnRegistrarse" style="margin: 20px; border-color: black ">Registrarse</a>
                </div>
            </div>

            <% }%>

        </div>
    </body>
</html>
