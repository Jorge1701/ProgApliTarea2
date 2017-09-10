<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="vistas/include.html"/>

        <title>Inicio</title>
    </head>
    <body>
        <div class="container-fluid">
            <!-- Header -->
            <jsp:include page="vistas/header.jsp"/>

            <hr>

            <div class="row">
                <!-- Contenido -->
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9" style="background-color: yellow">
                    <h1>Contenido</h1>
                </div>

                <!-- Lateral -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="background-color: green">
                    <h1>Lateral</h1>
                </div>
            </div>

            <!-- Footer -->
            <div class="row" style="background-color: orange">
                <h1>Footer</h1>
            </div>
        </div>
    </body>
</html>