<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>

        <title>Espotify</title>

        <style>
         body{
            background-image: url('media/wallpaper2.jpg');
            background-repeat:no-repeat;
            background-position:center center;
            background-attachment:fixed;
            -o-background-size: 100% 100%, auto;
            -moz-background-size: 100% 100%, auto;
            -webkit-background-size: 100% 100%, auto;
            background-size: 100% 100%, auto;
        }
       </style>
    </head>
    <body>
    <div class="container-fluid">
        <!-- Header -->
        <jsp:include page="header.jsp"/>

        <hr>
        <br>
        <div class="row">
            <!-- Contenido -->
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">

                <%if (request.getParameter("mensaje") != null) {%>
                <h1 class="text-center" style="color: black; background-color: #00cc66"><%= request.getParameter("mensaje").toString()%></h1>        
                <%}%>
            </div>

            <!-- Lateral -->
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="background-color: black; border-style:solid; border-width: 1px; padding: 15px; border-color: lavender">
                <jsp:include page = "lateral.jsp"/>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page = "footer.jsp"/>

    </div>

</body>

</html>