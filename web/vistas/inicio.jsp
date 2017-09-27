<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>

        <title>Espotify</title>

        <jsp:include page="../scripts/inicio.html"/>
    </head>
    <body style="background-image: url('media/wallpaper2.jpg')">
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

                    <div class="container">
                        <h2>Dynamic Tabs</h2>
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#generos">Generos</a></li>
                            <li><a data-toggle="tab" href="#artistas">Artistas</a></li>
                            <li><a data-toggle="tab" href="#clientes">Clientes</a></li>
                        </ul>

                        <div class="tab-content">
                            <div id="generos" class="tab-pane fade in active">
                                <%
                                    ArrayList<String> generos = (ArrayList<String>) request.getAttribute("generos");
                                %>
                                <div class="row">
                                    <div style="margin-top: 20px"></div>
                                </div>

                                <%
                                    for (int i = 0; i < generos.size(); i++) {
                                        if (i == 0 || i % 4 == 0) {
                                            if (i != 0) {
                                                out.print("</div>");
                                            }
                                            out.print("<div class=\"row\">");
                                        }
                                        out.print("<div class=\"col-lg-3\">");
                                        out.print("<div class=\"panel panel-default\" onclick=\"irAGenero('" + generos.get(i) + "')\">");
                                        out.print("<h1>" + generos.get(i) + "</h1>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    }

                                    out.print("</div>");
                                %>
                            </div>

                            <div id="artistas" class="tab-pane fade">
                                <h3>Menu 1</h3>
                                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            </div>

                            <div id="clientes" class="tab-pane fade">
                                <h3>Menu 2</h3>
                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                            </div>

                        </div>
                    </div>

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