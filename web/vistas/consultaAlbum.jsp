<%-- 
    Document   : consultaAlbum.jsp
    Created on : 02/10/2017, 03:21:48 AM
    Author     : brian
--%>




<%@page import="Logica.DtTemaRemoto"%>
<%@page import="Logica.DtTemaLocal"%>
<%@page import="Logica.DtSuscripcion"%>
<%@page import="Logica.DtCliente"%>
<%@page import="Logica.DtUsuario"%>
<%@page import="Logica.DtTema"%>
<%@page import="Logica.DtAlbumContenido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="Logica.DtAlbum"%>
<%@page import="Logica.DtPerfilArtista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>
        <jsp:include page="../scripts/Descargar.html"/>
        <style>
            .centrar
            {
                position: absolute;
                /*nos posicionamos en el centro del navegador*/
                top:60%;
                left:80%;
                /*determinamos una anchura*/
                width:400px;
                /*indicamos que el margen izquierdo, es la mitad de la anchura*/
                margin-left:-200px;
                /*determinamos una altura*/
                height:300px;
                /*indicamos que el margen superior, es la mitad de la altura*/
                margin-top:-150px;

                padding:5px;
            }

            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;

            }
            table{
                width: 800px; 
                height: 80px;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 4px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }

            .button1 {
                background-color: #4CAF50; 
                color: black; 
                border: 2px solid #4CAF50;
            }

            .button1:hover {
                background-color: white ;
                color: white;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Album</title>
    </head>
    <body>
        <%
            DtAlbumContenido albumes = (DtAlbumContenido) request.getAttribute("Album");
            DtAlbum inf = (DtAlbum) albumes.getInfo();
            String Generos = albumes.getGeneros2();
            ArrayList<DtTema> temas = albumes.getTemas();
            String nickArtista = inf.getNickArtista();
            String imagen = inf.getImagen();
            String nombreAlbum = inf.getNombre();
            int anioCreacion = inf.getAnio();
            DtUsuario usuario = (DtUsuario) request.getSession().getAttribute("usuario");

        %>

        <div class="container-fluid">
            <jsp:include page="header.jsp"/>
            <hr>
            <div class="row">

                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12"></div>
                <!-- Contenido -->
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#home" style="color: black">Informacion Basica</a></li>
                        <li><a data-toggle="tab" href="#menu1" style="color: black">Temas</a></li>
                    </ul>
                    <div class="tab-content" style="color: white">
                        <div id="home" class="tab-pane fade in active">
                            <div class="panel-body">
                                <div class="row " >
                                    <div class=" col-md-9 col-lg-9 " > 
                                        <div class="col-sm-6">
                                            <div   align="center"> <img alt="Album Pic" src="/Tarea2/SImagen?album=<%= imagen%>" id="album-imagen" class="img-circle img-responsive"> 
                                                <input id="profile-image-upload" class="hidden" type="file">
                                            </div>
                                        </div>
                                    </div>          
                                </div> 
                              
                                
                                    <tr>
                                        <td><h4 style="color:white">Nombre Album : <%= nombreAlbum%></h4></td>
                                        <td><h4 style="color:white">Año De Creacion : <%= anioCreacion%> </h4></td>


                                        <td><h4 style="color:white">Generos: <%=Generos %></h4></td>
                                        
                                    </tr>
                            </div>
                        </div>
                        <div id="menu1" class="tab-pane fade">     
                            <div>
                                <table >
                                    <caption style="color:white"><center>Temas</center></caption>
                                    <tr class="w3-red">
                                        <th>Nombre</th>
                                        <th>Posicion</th>
                                        <th>Duracion</th>
                                        <th>Ubicacion</th>
                                        <th>Descargar</th>
                                            <%
                                                for (int i = 0; i < temas.size(); i++) {
                                                    if (temas.get(i) instanceof DtTemaLocal) {
                                                        DtTemaLocal local = (DtTemaLocal) temas.get(i);
                                            %> 
                                    <tr onclick="reproducirLocal('<%= local.getDirectorio().replace("'", "\\'")%>', '<%= local.getNombre().replace("'", "\\'")%>', '<%= local.getArtista().replace("'", "\\'")%>', '<%= local.getImagenAlbum().replace("'", "\\'")%>')">
                                        <%} else {
                                        %>
                                    <tr onclick="reproducirRemoto('<%= ((DtTemaRemoto) temas.get(i)).getUrl()%>')">
                                        <% }%>
                                        <td><text style="color:white"> <%= temas.get(i).getNombre()%></text></td>
                                        <td><text style="color:white "><center> <%= temas.get(i).getUbicacion()%></center> </text></td>
                                    <td><text style="color:white"><center> <%= temas.get(i).getDuracion().getHoras()%>:<%= temas.get(i).getDuracion().getMinutos()%>:<%= temas.get(i).getDuracion().getSegundos()%></center></text></td>
                                    <td><text style="color:white"> <%= temas.get(i) instanceof DtTemaLocal ? ((DtTemaLocal) temas.get(i)).getDirectorio() : ((DtTemaRemoto) temas.get(i)).getUrl()%> </text></td>
                                        <%
                                            if (request.getSession().getAttribute("usuario") != null) {
                                                DtUsuario dtu = (DtUsuario) request.getSession().getAttribute("usuario");
                                                DtSuscripcion suscripcion = (DtSuscripcion) ((DtCliente) dtu).getSuscripcion();
                                                if (suscripcion.getEstado().equals("Vigente")) {
                                        %>
                                    <td><center><input onclick="Descarga('<%=((DtTemaLocal) temas.get(i)).getDirectorio()%>')" class="button buttton1" id="btnDescargar" value="Descargar"></center></td>
                                        <%} else { %>
                                    <td><center><text>Sin Suscripcion</text></center></td> 
                                        <% }  %>
                                    </tr>
                                    <% } else { %>
                                    <td><center><text>Debe Iniciar Sesion</text></center></td> 
                                        <% }
                                            }%>
                                </table>
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
