

<%@page import="Logica.DtCliente"%>
<%@page import="Logica.DtArtista"%>
<%@page import="Logica.DtUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Logica.DtGenero"%>
<html>
    <head>
        <jsp:include page="include.html"/>
   

        <%
            if (request.getSession().getAttribute("usuario") == null) {
                request.setAttribute("mensaje_error", "Esta página está reservada para nuestros Artistas ");
                request.getRequestDispatcher("pagina_error.jsp").forward(request, response);
                    }%>
        <%
            DtUsuario user = (DtUsuario) request.getSession().getAttribute("usuario");
            if (user instanceof DtCliente) {
                request.setAttribute("mensaje_error", "Esta página está reservada para nuestros Artistas ");
                request.getRequestDispatcher("pagina_error.jsp").forward(request, response);

            }%>

        <title>Espotify</title>

        <style>
            table, td, th {
                border: 1px solid black;
                
            }

            table {
                border-collapse: collapse;
                width: 85%;
            }
            

            th {
                height: 50px;
            }


        </style>
    </head>
    <body>
        <div class="container-fluid">
            <!-- Header -->
            <jsp:include page="header.jsp"/>

    

            <input type="hidden" id="nick" value="<%= user.getNickname()%>">
            <hr>

            <div class="row">
                <!-- Contenido -->
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <!-- Relleno a la izquiera -->
                    <div class="col-lg-3 col-md-3 col-sm-2 col-xs-1"></div>

                    <div class="col-lg-6 col-md-6 col-sm-8 col-xs-10" style="background-color: transparent">

                        <div class="input-group input-group-lg" >
                            <h4 class="text-center col-xs-10" style="color:white ">Crea Tu Album</h4>
                            <!-- Nombre  -->
                            <row class="col-xs-10 "><input style="border-color: black" required="Campo obligatorio" type="text" class="form-control" placeholder="Nombre" id="txtnombreAlbum"></row>
                            <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                <div  id="faltaNombre" hidden>
                                    <span class="glyphicon glyphicon-alert" style="color: red"></span>
                                    <span style="color: red; padding-left: 5px">Debes de ingresar un nombre.</span>
                                </div>
                            </row>

                            <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                <div  id="nombreAlerta" hidden>
                                    <span class="glyphicon glyphicon-alert" style="color: red"></span>
                                    <span style="color: red; padding-left: 5px" >Nombre ya existe.</span>
                                </div>
                            </row>
                            <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                <div  id="nombreSuccess" hidden>
                                    <span class="glyphicon glyphicon-ok" style="color: green"></span>
                                    <span style="color: green; padding-left: 5px" >Nombre disponible.</span>
                                </div>
                            </row>
                            <!-- Fecha -->


                            <row class="col-xs-4">
                                <input style="border-color: black " required="Campo obligatorio"  type="text" class="form-control" placeholder="Año De Creacion" id="txtAnio">
                            </row>
                            <!-- Generos  -->                                                      
                            <row class="col-xs-12">
                                <row class="col-xs-12" ><h4 class="text-center col-xs-10" style="color:white ">Generos A Los Que Pertenece</h4></row>
                                <row>
                                    <div>
                                        <% ArrayList<DtGenero> generos = (ArrayList<DtGenero>) request.getAttribute("Generos");
                                        %>
                                        <select  id="listaGeneros"  class="form-control" size="2" style="width: 100px; height: 100px">
                                            <%                                                for (DtGenero genero : generos) {
                                            %>
                                            <option> <%= genero.getNombre()%> </option>   
                                            <%}%>
                                        </select>
                                    </div>
                                </row>
                                <row class="col-xs-4">
                                    <div>
                                        <row><div> <input type="button" class="btn btn-default pull-right" id="btnAgregar" style="margin-top: 8px" value="Agregar"/></div></row>

                                        <row><div><input type="button" class="btn btn-default pull-right" id="btnQuitar" style="margin-top: 8px; width:75px " value="Quitar"/></div></row>
                                    </div>
                                </row>
                                <row class="col-xs-4">
                                    <div>
                                        <select  id="listaGeneroFinal"  class="form-control" size="2" style="width: 100px; height: 100px">                                          
                                        </select>
                                    </div>
                                </row>
                            </row>   

                            <!-- Temas  -->   
                            <row class="col-xs-12" ><h4 class="text-center col-xs-10" style="color:white ">Temas</h4></row>
                            <row class="col-xs-12">
                                <div class="col-xs-6"style="padding-left: 0px"><input type="checkbox" id="ChecUrl" value="Url" onclick="mostrar('Url', this, 'Local', 'ChecLocal')"><text style="color: lavender"> Por Url</text></div>
                            </row>

                            <row class="col-xs-12" style="display: none" id="Url" >
                                <table>
                                    <tr>
                                    <row class="col-xs-6"><input  required="Campo obligatorio" type="text" class="form-control" placeholder="Url" id="txtTemaRemoto" ></row>
                                    </tr>
                                </table>                         
                            </row>
                        </div>

                        <row class="col-xs-12">

                            <div class="col-xs-6" style="padding-left: 0px"><input type="checkbox" id="ChecLocal"  onclick="mostrar('Local', this, 'Url', 'ChecUrl')"><text style="color: lavender"> Temas Locales</text></div>
                        </row>

                        <row class="col-xs-12 " style="display: none" id="Local">
                            <form target="iframe" action="Uploadfile" method="post" enctype="multipart/form-data" id="form">
                                <table>
                                    <tr>
                                        <th><input type="file" name="file" id="file"/></th>                                    
                                    <iframe name="iframe" style="display: none"></iframe>
                                    </tr>
                                </table>
                            </form>
                        </row>

                        <row class="col-xs-12 " style="margin-top: 10px; padding-left: 0px">             
                            <div class="form-group"> 
                                <div class="col-xs-2"><span style="color: lavender; font-weight: bold">Posicion: </span></div>
                                <div class="col-xs-2"><input style="border-color: black" required="Campo obligatorio"  type="text" class="form-control" id="txtPosicion"></div>
                                <div class="col-xs-2"> <span style="color: lavender; font-weight: bold">Duracion: </span></div>
                                <div class="col-xs-4"> <input style="border-color: black" type="time" step='1' min="00:00:00" max="20:00:00" class="form-control" placeholder="Duracion" id="txtDuracion"></div>                           
                            </div> 
                        </row>

                        <row class="col-xs-12 " style="margin-top: 10px ;padding-left: 0px">
                            <div class="form-group" > 
                                <div class="col-xs-2"><span style="color: lavender; font-weight: bold">Nombre: </span></div>
                                <div class="col-xs-6"><input style="border-color: black" required="Campo obligatorio"  type="text" class="form-control" id="txtNombre"></div>
                            </div>
                        </row>
                        <br>
                        <row class="col-xs-12 "style="margin-top: 10px"><button class="btn"id="btnAgregarTema" value="Agregar">Agregar Tema</button></row>              
                        <row class="col-xs-12 " >
                            <span style="color: lavender; font-weight: bold">Lista De Temas :</span>

                            <div >     
                                <table id="tabla" class="table-hover">

                                    <tr style="background:white">
                                        <th><center><text style="color: black " align="text-center">Url/Directorio</text></center></th>
                                    <th><center><text style="color: black " align="text-center">Nombre</text></center></th>
                                    <th><center><text style="color: black">Posicion</text></center></th>
                                    <th><center><text style="color: black">Duracion</text></center></th>   
                                    </tr>
                                </table>
                            </div> 
                        </row>
                        <row class="col-xs-4 "><input type="button" class="btn btn-default pull-right" style="margin-top: 15px" id="btnQuitarTema" value="Quitar"/></row>

                        <!-- Crear Album  -->   
                        <row class="col-xs-4 ">
                            <input type="button" class="btn btn-default pull-right" id="btnCrearAlbum"  style="margin-top: 15px" value="Crear Album"/>
                        </row>
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
        <script src="scripts/altaAlbum.js" type="text/javascript"></script>
    </body>

</html>