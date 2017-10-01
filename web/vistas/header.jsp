<%@page import="Logica.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="servlets.SSesion"%>
<%@page import="Logica.DtUsuario"%>
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
                    <img src="/Tarea2/SImagen?logo=icono.png" class="pull-left" width="80" height="80">
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
                DtUsuario usuario = (DtUsuario) request.getSession().getAttribute("usuario");
                boolean logeado = usuario != null;

                if (logeado) {
                    String nombre = usuario.getNombre() + " " + usuario.getApellido();
            %>

            <!-- Perfil de Usuario -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="padding-top: 20px"  id="formPU">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><a href="/Tarea2/SUsuario?nickname=<%= usuario.getNickname()%>" class="btn btn-default" id="btnSesion" style="margin-left: 0px; border-color: black">Usuarios</a></div>
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                        <img src="/Tarea2/SImagen?usuario=<%= usuario.getImagen()%>" class="img-circle pull-left" width="65" height="65" style="margin-right: 20px" id="puImagen">
                        <div style="margin: 0px; color:lavender; text-shadow: 2px 2px 4px #000000" id="puNombre"><a href="/Tarea2/SConsultarPerfil?nickUs=<%= usuario.getNickname()%>"><%= nombre%></a></div>
                        <a href="/Tarea2/SInicio?cargarDatosPrueba=si" class="btn btn-link btn-xs">Cargar Datos de Prueba</a>
                        <a href="/Tarea2/SSesion?cerrarSesion=si" class="btn btn-link btn-xs">Cerrar Sesion</a>
                    </div> 
                </div>
            </div>

            <% }
                if (!logeado) {
            %>

            <!-- Opciones -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="padding-top: 10px">
                <div class="container">
                    <a href="/Tarea2/SUsuario" class="btn btn-default" id="btnSesion" style="margin-left: 20px; border-color: black">Usuarios</a>
                    <a href="/Tarea2/SSesion?redirigir=iniciar_sesion.jsp" class="btn btn-default" id="btnSesion" style="margin-left: 50px; border-color: black">Iniciar Sesion</a>
                    <a href="/Tarea2/SRegistro?accion=redirigir" class="btn btn-default" id="btnRegistrarse" style="margin: 20px; border-color: black ">Registrarse</a>
                </div>
            </div>

            <% }%>

        </div>
    </body>
</html>
