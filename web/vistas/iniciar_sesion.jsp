<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="servlets.SSesion"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>

        <title>Iniciar Sesion</title>
    </head>
    <body style="background-image: url('media/wallpaper2.jpg')">
        <div class="container-fluid">
            <!-- Header -->
            <jsp:include page="header.jsp"/>

            <hr>

            <div class="row">
                <!-- Contenido -->
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <div class="row">
                        <div class="col-lg-5 col-md-6 col-sm-8 col-xs-12">
                            <form action="/Tarea2/SSesion" method="POST">
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input type="text" class="form-control" name="nickname" placeholder="Nickname" required="required" autofocus="autofocus">
                                </div>
                                <br>
                                <div class="input-group input-group-md">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type="password" class="form-control" name="contrasenia" placeholder="Contraseña" required="required">
                                </div>
                                <%
                                    String error = "";
                                    if (request.getAttribute("error") != null) {
                                        error = request.getAttribute("error").toString();
                                    }

                                    if (!error.equals("")) {
                                %>
                                <div id="mensajeError">
                                    <br>
                                    <span class="glyphicon glyphicon-alert" style="color: red"> <%= error%> </span>
                                    <br>
                                </div>
                                <% }%>

                                <br>
                                <input type="submit" class="btn btn-default" id="btnIniciarSesion" value="Iniciar Sesion">
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Lateral -->
                <div id="lateral" class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="background-color: black; border-style:solid; border-width: 1px; padding: 15px; border-color: lavender">
                    <jsp:include page = "lateral.jsp"/>
                </div>
            </div> 

            <!-- Footer -->
            <jsp:include page = "footer.jsp"/>
        </div>
        <script src="scripts/iniciar_sesion.js" type="text/javascript"></script>
    </body>
</html>
