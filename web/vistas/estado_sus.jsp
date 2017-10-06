<%@page import="java.util.ArrayList"%>
<%@page import="Logica.DtSuscripcion"%>
<%@page import="Logica.DtCliente"%>
<%@page import="Logica.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>
        <jsp:include page="../scripts/busqueda.html"/>

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
            <br>
            <div class="row">

                <!-- Contenido -->
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">

                    <div class="panel panel-default">

                        <div class="container" id="info">

                            <div id="leyenda">
                                <text>Leyenda:</text>
                                <text><span class="glyphicon glyphicon-ok"></span>Renovar</text>
                                <text><span class="glyphicon glyphicon-remove"></span>Cancelar</text>
                            </div>
                        </div>

                        <hr>

                        <div class="table-responsive"> 
                            <table class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th>Estado</th>
                                        <th>Tipo de Cuota</th>
                                        <th>Monto</th>
                                        <th>Fecha</th>
                                        <th>Fecha Vencimiento</th>
                                        <th>Accion</th>
                                    </tr>
                                </thead>
                                <tbody>


                                    <% ArrayList<DtSuscripcion> sus = (ArrayList<DtSuscripcion>) request.getAttribute("suscripciones"); %>
                                    <%  for (DtSuscripcion dts : sus) {  %>


                                    <tr>
                                        <td><%= dts.getEstado()%></td>
                                        <td><%= dts.getCuota()%></td>
                                        <td><%= dts.getMonto()%></td>
                                        <td><%= dts.getFecha()%></td>
                                        <td><% if(dts.getFechaVenc() != null){ %>
                                            <%= dts.getFechaVenc()%>
                                        <% }else{ %>No Corresponde</td><% } %> 
                               
                                    <td> <form id="formulario2">
                                        <% if (dts.getEstado().equals("Vencida")) { %>
                                        <!-- pruebas -->
                                        <input type="hidden" id="Estado" value="<%= dts.getEstado()%>">
                                        <input type="hidden" id="Cuota" value="<%=dts.getCuota()%>">
                                        <input type="hidden" id="Fecha" value="<%=dts.getFecha()%>">
                                        <input type="hidden" id="FechaVenc" value="<%=dts.getFechaVenc()%>">
                                      <!-- fin pruebas -->
                                        <button type="button" class="btn btn-default btn-xs" id="btnRenovar" value=""/>
                                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                        </button>
                                        <button type="button" class="btn btn-default btn-xs" id="btnCancelar2" value=""/>
                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        </button>
                                        </form>
                                        
                                        <% } else { %>
                                        <input type="hidden" class="btn btn-primary btn-xs" id="btnOculto" value="Oculto"/><% } %></td><% }%>
                                    </tr>
                                
                                <% DtSuscripcion activa = (DtSuscripcion) request.getAttribute("suscripcion");%>
                                <% if(activa!= null) { %>
                                <tr>
                                    <td><%= activa.getEstado()%></td>
                                    <td><%= activa.getCuota()%></td>
                                    <td><%= activa.getMonto()%></td>
                                    <td><%= activa.getFecha()%></td>
                                    <td><% if (activa.getFechaVenc() != null) {%>
                                        <%= activa.getFechaVenc()%> <% } else { %>
                                        No Corresponde <% } %>
                                    <td>
                                        <form id="formulario">  
                                        <% if (activa.getEstado().equals("Pendiente")) { %>
                                            <button type="button" class="btn btn-default btn-xs" id="btnCancelar" value=""/>
                                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        </button></td></form>

                                    <% } else { %>
                                <input type="hidden" class="btn btn-primary btn-xs" id="btnOculto" value="Oculto"/>
                                <% } %>
                                
                                <% }%>
                            </table>
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

        <script src="scripts/suscripcion.js" type="text/javascript"></script>
    </body>
</html>

