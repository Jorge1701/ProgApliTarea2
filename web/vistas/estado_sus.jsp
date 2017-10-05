<%@page import="java.util.ArrayList"%>
<%@page import="Logica.DtSuscripcion"%>
<%@page import="Logica.DtCliente"%>
<%@page import="Logica.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>
        <link rel="stylesheet" type="text/css" href="estilos/busqueda.css">
        <% //DtUsuario usr = (DtUsuario) request.getSession().getAttribute("usuario");%>
        <% //if (!((DtCliente) usr).getTipo().equals("Cliente")) {
            //request.setAttribute("mensaje_error", "Esta página está reservada para nuestros clientes");
            //request.getRequestDispatcher("pagina_error.jsp").forward(request, response);
            //}%>

        <title>Administrar Suscripciones</title>
    </head>
    <body style="background-image: url('media/wallpaper2.jpg')">

        <div class="container-fluid">
            <!-- Header -->
            <jsp:include page="header.jsp"/>
            <hr>

            <div class="row">

                <!-- Contenido -->
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">

                    <div class="panel panel-default">

                        <table class="table-hover">

                            <tr>
                                <th>Estado</th>
                                <th>Cuota</th>
                                <th>Monto</th>
                                <th>Fecha</th>
                                <th>Vencimiento</th>
                                <th>Accion</th>
                            </tr>



                            <% ArrayList<DtSuscripcion> sus = (ArrayList<DtSuscripcion>) request.getAttribute("suscripciones"); %>
                            <%  for (DtSuscripcion dts : sus) {  %>


                            <tr>
                                <td><%= dts.getEstado()%></td>
                                <td><%= dts.getCuota()%></td>
                                <td><%= dts.getMonto()%></td>
                                <td><%= dts.getFecha()%></td>
                                <td><%= dts.getFechaVenc()%></td>
                                <td><input type="hidden" class="btn btn-primary btn-xs" id="btnOculto" value="Oculto"/></td>
                            </tr>

                            <% }%>

                            <% DtSuscripcion activa = (DtSuscripcion) request.getAttribute("suscripcion");%>
                            <% if(activa

                                    
                                        != null) { %>
                            <tr>
                                <td><%= activa.getEstado()%></td>
                                <td><%= activa.getCuota()%></td>
                                <td><%= activa.getMonto()%></td>
                                <td><%= activa.getFecha()%></td>
                                <td><%= activa.getFechaVenc()%></td> 
                                <td>
                                    <form id="formulario">    
                                        <% if (activa.getEstado().equals("Pendiente")) { %>
                                    <input type="button" class="btn btn-primary btn-xs" id="btnCancelar" value="Cancelar"/></td>
                                    <% } else { %>
                            <input type="hidden" class="btn btn-primary btn-xs" id="btnOculto" value="Oculto"/>
                            <% } %>
                            </form>
                            <% }%>

                        </table>
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

        <script src="scripts/suscripcion.js" type="text/javascript"></script>
    </body>
</html>

