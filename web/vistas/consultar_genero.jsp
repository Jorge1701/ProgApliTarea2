<%@page import="Logica.DtCliente"%>
<%@page import="Logica.DtUsuario"%>
<%@page import="Logica.DtAlbum"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="Logica.DtListaDefecto"%>
<%@page import="Logica.DtLista"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>
        <jsp:include page="../scripts/consultar_genero.html"/>

        <link rel="stylesheet" type="text/css" href="estilos/consultar_genero.css">

        <title>Espotify</title>

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
                    <div class="panelTexto">
                        <p class="text-center mensaje"><%= request.getAttribute("genero")%>:</p> 
                    </div>

                    <!-- Listas -->

                    <%
                        ArrayList<DtLista> listas = (ArrayList<DtLista>) request.getAttribute("listas");

                        if (listas.size() == 0) {
                    %>
                    <div class="panelTexto2">
                        <p class="mensaje2">Listas: (No hay)</p> 
                    </div>
                    <% } else { %>
                    <div class="panelTexto2">
                        <p class="mensaje2">Listas:</p> 
                    </div>
                    <%
                        ArrayList<DtLista> listasFav = (ArrayList<DtLista>) request.getAttribute("listasFav");

                        for (int i = 0; i < listas.size(); i++) {
                            DtLista lista = listas.get(i);

                            if (i == 0 || i % 2 == 0) {
                                if (i != 0) {
                                    out.print("</div>");
                                }
                                out.print("<div class=\"row\">");
                            }

                            out.print("<div class=\"col-lg-6\">");
                            out.print("<div class=\"panel panel-default\" onclick=\"irALista('" + request.getAttribute("genero") + "', '" + lista.getNombre() + "')\">");
                    %>

                    <div class="container">
                        <img src="/Tarea2/SImagen?lista=<%= lista.getImagen()%>" class="pull-left imgLista" width="80" height="80">
                        <div class="pull-left infoLista">
                            <text class="nombreLista"><%= lista.getNombre()%></text><br>
                            <text><%= lista.getFecha().toString()%></text>

                            <%
                                if (request.getSession().getAttribute("usuario") != null) {
                                    DtUsuario dtu = (DtUsuario) request.getSession().getAttribute("usuario");
                                    if (dtu instanceof DtCliente) {
                                        out.print("<br>");

                                        boolean enFavorito = false;
                                        if (listasFav != null) {
                                            for (int j = 0; j < listasFav.size(); j++) {
                                                DtLista listaFav = (DtLista) listasFav.get(j);
                                                if (listaFav instanceof DtListaDefecto) {
                                                    if (listaFav.getNombre().equals(lista.getNombre())) {
                                                        enFavorito = true;
                                                    }
                                                }
                                            }
                                        }

                                        if (!enFavorito) {
                                            out.print("<button onclick=\"favorito('" + request.getAttribute("genero") + "', '" + lista.getNombre() + "')\" class=\"btn btn-success btnFav\">Agregar a favoritos</button>");
                                        } else {
                                            out.print("<button onclick=\"quitarfav('" + request.getAttribute("genero") + "', '" + lista.getNombre() + "')\" class=\"btn btn-danger btnFav\">Quitar de favoritos</button>");
                                        }
                                    }
                                }
                            %>
                        </div>
                    </div>

                    <%
                                out.print("</div>");
                                out.print("</div>");
                            }
                            out.print("</div>");
                        }
                    %>

                    <!-- Albumes -->

                    <%
                        ArrayList<DtAlbum> albumes = (ArrayList<DtAlbum>) request.getAttribute("albumes");

                        if (albumes.size() == 0) {
                    %>
                    <div class="panelTexto2">
                        <p class="mensaje2">Albumes: (No hay)</p> 
                    </div>
                    <% } else { %>
                    <div class="panelTexto2">
                        <p class="mensaje2">Albumes:</p> 
                    </div>
                    <%
                        ArrayList<DtAlbum> albumesFav = (ArrayList<DtAlbum>) request.getAttribute("albumesFav");

                        for (int i = 0; i < albumes.size(); i++) {
                            DtAlbum album = albumes.get(i);

                            if (i == 0 || i % 2 == 0) {
                                if (i != 0) {
                                    out.print("</div>");
                                }
                                out.print("<div class=\"row\">");
                            }

                            out.print("<div class=\"col-lg-6\">");
                            out.print("<div class=\"panel panel-default\" onclick=\"irAAlbum('" + album.getNickArtista() + "', '" + album.getNombre() + "')\">");
                    %>

                    <div class="container">
                        <img src="/Tarea2/SImagen?album=<%= album.getImagen()%>" class="pull-left imgLista" width="80" height="80">
                        <div class="pull-left infoLista">
                            <text class="nombreLista"><%= album.getNombre()%></text><br>
                            <text><%= album.getAnio()%></text>

                            <%
                                if (request.getSession().getAttribute("usuario") != null) {
                                    DtUsuario dtu = (DtUsuario) request.getSession().getAttribute("usuario");
                                    if (dtu instanceof DtCliente) {
                                        out.print("<br>");

                                        boolean enFavorito = false;
                                        if (albumesFav != null) {
                                            for (int j = 0; j < albumesFav.size(); j++) {
                                                DtAlbum albumFav = (DtAlbum) albumesFav.get(j);
                                                if (albumFav.getNombre().equals(album.getNombre())) {
                                                    enFavorito = true;
                                                }
                                            }
                                        }

                                        if (!enFavorito) {
                                            out.print("<button onclick=\"albumfav('" + album.getNickArtista() + "', '" + album.getNombre() + "')\" class=\"btn btn-success btnFav\">Agregar a favoritos</button>");
                                        } else {
                                            out.print("<button onclick=\"quitaralbumfav('" + album.getNickArtista() + "', '" + album.getNombre() + "')\" class=\"btn btn-danger btnFav\">Quitar de favoritos</button>");
                                        }
                                    }
                                }
                            %>
                        </div>
                    </div>

                    <%
                                out.print("</div>");
                                out.print("</div>");
                            }
                            out.print("</div>");
                        }
                    %>
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
