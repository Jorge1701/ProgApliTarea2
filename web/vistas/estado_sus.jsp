<%@page import="java.util.ArrayList"%>
<%@page import="Logica.DtSuscripcion"%>
<%@page import="Logica.DtCliente"%>
<%@page import="Logica.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>
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

                    <!-- Relleno a la izquiera -->
                    <!-- <div class="col-lg-3 col-md-3 col-sm-2 col-xs-1"></div> -->


                    <div class="col-lg-6 col-md-6 col-sm-8 col-xs-10" style="background-color: transparent">

                        <% 
                            DtSuscripcion activa = (DtSuscripcion) request.getAttribute("suscripcion");
                        %>

                        <div class="table-responsive">
                            <h2>Suscripciones</h2>          
                            <table class="table table-hover">
                                <thead>
                                    <tr class="active">
                                        <th>Estado</th>
                                        <th>Tipo de Cuota</th>
                                        <th>Monto</th>
                                        <th>Fecha</th>
                                        <th>Fecha Vencimiento</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% ArrayList<DtSuscripcion> sus = (ArrayList<DtSuscripcion>) request.getAttribute("suscripciones");
                                       
                                    for (DtSuscripcion dts : sus) {
                                        %>
                                    <tr class="active">
                                        <td><%= dts.getEstado()%></td>
                                        <td><%= dts.getCuota()%></td>
                                        <td><%= dts.getMonto()%></td>
                                        <td><%= dts.getFecha()%></td>
                                        <td><%= dts.getFechaVenc()%></td>
                                        <td></td>
                                    </tr>
                                    <% }%>
                                    <tr class="active">
                                      <td><%= activa.getEstado()%></td>
                                        <td><%= activa.getCuota()%></td>
                                        <td><%= activa.getMonto()%></td>
                                        <td><%= activa.getFecha()%></td>
                                        <td><%= activa.getFechaVenc()%></td> 
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <!-- Relleno a la derecha -->
                    <div class="col-lg-3 col-md-3 col-sm-2 col-xs-1"></div>

                </div>

                <!-- Lateral -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="background-color: black; border-style:solid; border-width: 1px; padding: 15px; border-color: lavender">
                    <jsp:include page = "lateral.jsp"/>
                </div>
            </div>

            <!-- Footer -->
            <jsp:include page = "footer.jsp"/>
        </div>
    </div>
    <script src="scripts/suscripcion.js" type="text/javascript"></script>
</body>
</html>

