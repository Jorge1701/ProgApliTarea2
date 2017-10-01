
<%@page import="Logica.DtArtista"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Logica.DtUsuario"%>
<%@page import="Logica.DtLista"%>
<%@page import="Logica.DtAlbum"%>
<%@page import="Logica.DtCliente"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>
        <title>Consulta perfil Cliente</title>
    </head>
    <body style="background-image: url('media/wallpaper2.jpg')">
        <%
            ArrayList<DtUsuario> usuarios = (ArrayList<DtUsuario>) request.getAttribute("usuarios");
        %>
        <div class="container-fluid">
            <jsp:include page="header.jsp"/>
            <hr>
            <div class="row">
                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12"></div>
                <!-- Contenido -->
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                    <div class="col-xs-6" style="padding-top: 10px">
                        <form action="/Tarea2/SUsuario">
                            <div class="input-group input-group-lg">
                                <input type="text" style="border-color: black" class="form-control"  name="buscar" placeholder="Nickname, Nombre o Apellido">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit" style="border-color: black"><span class="glyphicon glyphicon-search"></span></button>
                                </div>
                            </div>
                        </form>
                    </div>



                    <div class="col-xs-12"><br></div>

                    <%if (usuarios.isEmpty()) {%>

                    <div class="col-xs-8" style="background-color: black; border-style:solid; border-width: 1px; padding: 5px; border-color: lavender" >
                        <%if (request.getParameter("buscar") != null) {%>
                        <div style="color: lavender; text-shadow: 2px 2px 4px #000000"><h3>No hay usuarios para el criterio "<%= request.getParameter("buscar")%>"</h3></div>
                        <%} else {%>
                        <div style="color: lavender; text-shadow: 2px 2px 4px #000000"><h4>No hay usuarios registrados</h4></div>
                        <%}%>
                    </div>
                    <div class="col-xs-12" style="margin-top: 5px"></div>
                    
                    <%} else {%>
                    
                    <%for (DtUsuario usuario : usuarios) {%>
                    <div class="col-xs-5" style="background-color: black; border-style:solid; border-width: 1px; padding: 5px; border-color: lavender" >
                        <img src="/Tarea2/SImagen?usuario=<%= usuario.getImagen()%>" class="img-circle pull-left" width="65" height="65" style="margin-right: 20px ; padding-top: 3px" id="puImagen">
                        <div style="text-shadow: 2px 2px 4px #000000" id="puNombre"><a href="/Tarea2/SConsultarPerfil?nickUs=<%= usuario.getNickname()%>"><h4><%=usuario.getNombre() + " " + usuario.getApellido()%></h4></a></div>
                        <h5 style="color: lavender"><%=usuario instanceof DtArtista ? "Artista" : "Cliente"%></h5>
                        <button type="button" class="btn btn-info">Dejar de Seguir</button>
                    </div>
                    <div class="col-xs-12" style="margin-top: 5px"></div>
                    <%}
                        }%>

                </div>
                <!-- Lateral -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="background-color: black; border-style:solid; border-width: 1px; padding: 15px; border-color: lavender">
                    <jsp:include page = "lateral.jsp"/>
                </div>
            </div>


        </div>
    </body>
</html>
