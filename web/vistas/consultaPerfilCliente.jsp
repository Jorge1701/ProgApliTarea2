<%@page import="Logica.DtLista"%>
<%@page import="Logica.DtAlbum"%>
<%@page import="Logica.DtCliente"%>
<%@page import="Logica.DtListaParticular"%>
<%@page import="java.util.Collection"%>
<%@page import="Logica.DtPerfilCliente"%>
<%@page import="Logica.DtTema"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>
        <title>Consulta perfil Cliente</title>
    </head>
    <body style="background-image: url('media/wallpaper2.jpg')">
        <%
            DtPerfilCliente dtPCliente = (DtPerfilCliente) request.getAttribute("DtPerfilCliente");
        %>
        <div class="container-fluid">
            <jsp:include page="header.jsp"/>
            <hr>
            <div class="row">

                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12"></div>
                <!-- Contenido -->
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">

                    <ul class="nav nav-tabs" >
                        <li class="active"><a data-toggle="tab" href="#home" style="color: black">Informacion Basica</a></li>
                        <li><a data-toggle="tab" href="#menu1" style="color: black">Listas Creadas</a></li>
                        <li><a data-toggle="tab" href="#menu2" style="color: black">Seguidores</a></li>
                        <li><a data-toggle="tab" href="#menu3" style="color: black">Album Favoritos</a></li>
                        <li><a data-toggle="tab" href="#menu4" style="color: black">Listas Favoritos</a></li>
                        <li><a data-toggle="tab" href="#menu5" style="color: black">Temas Favoritos</a></li>
                    </ul>

                    <div class="tab-content" style="color: white">
                        <div id="home" class="tab-pane fade in active">
                            <div class="panel-body">
                                <div class="row">
                                    <div class=" col-md-9 col-lg-9 "> 
                                        <div class="col-sm-6">
                                            <div  align="center"> <img alt="User Pic" src="/Tarea2/SImagen?usuario=<%= dtPCliente.getInfo().getImagen()%>" id="profile-image1" class="img-circle img-responsive"> 

                                                <input id="profile-image-upload" class="hidden" type="file">
                                                <!--<div style="color:#999;" >click here to change profile image</div>
                                                Upload Image Js And Css-->
                                            </div>

                                            <br>

                                            <!-- /input-group -->
                                        </div>
                                        <div class="col-sm-6">
                                            <h4 style="color:black;"><%= dtPCliente.getInfo().getNombre()%>  <%= dtPCliente.getInfo().getApellido()%> </h4></span>
                                            <span><p>Cliente</p></span>            
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr style="margin:5px 0 5px 0;">
                                        <table class="table table-user-information">
                                            <tbody>
                                                <tr>
                                                    <td>NickName:</td>
                                                    <td><%= dtPCliente.getInfo().getNickname()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Nombre</td>
                                                    <td><%= dtPCliente.getInfo().getNombre()%>  <%= dtPCliente.getInfo().getApellido()%> </td>
                                                </tr>
                                                <tr>
                                                    <td>Fecha Nacimiento:</td>
                                                    <td><%= dtPCliente.getInfo().getFechaNac().toString()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Email</td>
                                                    <td><%= dtPCliente.getInfo().getEmail()%></td>
                                                </tr>                                                 

                                            </tbody>
                                        </table>


                                    </div>
                                </div>
                            </div>                           

                        </div>    
                        <div id="menu1" class="tab-pane fade">
                            <h3>Listas Creadas</h3>                         
                            <div class="panel-body">
                                <div class="row">
                                    <div class=" col-md-9 col-lg-9 "> 
                                        <table class="table table-striped">
                                            <thead>                                                      
                                                <tr>
                                                    <th>Nombre:</th>
                                                    <th>Cantidad Temas</th>                                                        
                                                </tr>
                                            </thead>
                                            <tbody>     
                                                <% Collection<DtListaParticular> listasP = dtPCliente.getListasCreadas();
                                                    for (DtListaParticular dtLP : listasP) {%>
                                                <tr>
                                                    <td><%= dtLP.getNombre()%></td>
                                                    <td><span class="badge"> <%= dtLP.getTemas().size()%> </span></td>
                                                </tr>

                                                <% }%>  
                                            </tbody>
                                        </table>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="menu2" class="tab-pane fade">
                            <h3>Seguidores</h3>
                            <div class="panel-body">
                                <div class="row">
                                    <div class=" col-md-9 col-lg-9 "> 
                                        <table class="table table-striped">
                                            <thead>                                                      
                                                <tr>
                                                    <th>NickName:</th>
                                                    <th>Nombre</th>                                                        
                                                </tr>
                                            </thead>
                                            <tbody>     
                                                <% Collection<DtCliente> seguidores = dtPCliente.getSeguidores();
                                                    for (DtCliente dtC : seguidores) {%>
                                                <tr>
                                                    <td><a href="/Tarea2/SConsultarPerfil?nickUs=<%= dtC.getNickname()%>"><%= dtC.getNickname()%></a></td>
                                                    <td><%= dtC.getNombre()%>  <%= dtC.getApellido()%> </td>
                                                </tr>

                                                <% }%>  
                                            </tbody>
                                        </table>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="menu3" class="tab-pane fade">
                            <h3>Abumes Favoritos</h3>
                            <div class="panel-body">
                                <div class="row">
                                    <div class=" col-md-9 col-lg-9 "> 
                                        <table class="table table-striped">
                                            <thead>                                                      
                                                <tr>
                                                    <th>Artista:</th>
                                                    <th>Nombre</th>
                                                    <th>Año</th>
                                                </tr>
                                            </thead>
                                            <tbody>     
                                                <% Collection<DtAlbum> albumes = dtPCliente.getAlbumes();
                                                    for (DtAlbum dtA : albumes) {%>
                                                <tr>
                                                    <td><a href="/Tarea2/SConsultarPerfil?nickUs=<%= dtA.getNickArtista()%>"><%= dtA.getNickArtista()%></a></td>
                                                    <td><%= dtA.getNombre()%> </td>
                                                    <td><%= dtA.getAnio()%> </td>
                                                </tr>

                                                <% }%>  
                                            </tbody>
                                        </table>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="menu4" class="tab-pane fade">
                            <h3>Listas Favoritos</h3>
                            <div class="panel-body">
                                <div class="row">
                                    <div class=" col-md-9 col-lg-9 "> 
                                        <table class="table table-striped">
                                            <thead>                                                      
                                                <tr>
                                                    <th>Nombre:</th>
                                                    <th>Camtidad de Temas</th>
                                                </tr>
                                            </thead>
                                            <tbody>     
                                                <% Collection<DtLista> dtLF = dtPCliente.getListasFavoritas();
                                                    for (DtLista dtL : dtLF) {%>
                                                <tr>
                                                    <td><%= dtL.getNombre()%></td>
                                                    <td><span class="badge"> <%= dtL.getTemas().size()%> </span></td>
                                                </tr>

                                                <% }%>  
                                            </tbody>
                                        </table>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="menu5" class="tab-pane fade">
                            <h3>Temas Favoritos</h3>
                            <div class="panel-body">
                                <div class="row">
                                    <div class=" col-md-9 col-lg-9 "> 
                                        <table class="table table-striped">
                                            <thead>                                                      
                                                <tr>
                                                    <th>Nombre:</th>
                                                    <th>Duracion</th>
                                                </tr>
                                            </thead>
                                            <tbody>     
                                                <% Collection<DtTema> dtTemasF = dtPCliente.getTemas();
                                                    for (DtTema dtT : dtTemasF) {%>
                                                <tr>
                                                    <td><%= dtT.getNombre()%></td>
                                                    <td><span class="badge"> <%= dtT.getDuracion().toString()%> </span></td>
                                                </tr>

                                                <% }%>  
                                            </tbody>
                                        </table>


                                    </div>
                                </div>
                            </div>
                        </div>                    
                    </div>


                </div>

                <!-- Lateral -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="border-style:solid; border-width: 2px; padding: 5px">
                    <jsp:include page = "lateral.jsp"/>
                </div>
            </div>


        </div>
    </body>
</html>
