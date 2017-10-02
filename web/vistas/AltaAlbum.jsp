
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Logica.DtGenero"%>
<html>
    <head>
        <jsp:include page="include.html"/>

        <title>Espotify</title>


    </head>
    <body>
        <div class="container-fluid">
            <!-- Header -->
            <jsp:include page="header.jsp"/>

            <hr>

            <div class="row">
                <!-- Contenido -->
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <!-- Relleno a la izquiera -->
                    <div class="col-lg-3 col-md-3 col-sm-2 col-xs-1"></div>


                    <div class="col-lg-6 col-md-6 col-sm-8 col-xs-10" style="background-color: transparent">
                        <form id="formulario" >
                            <div class="input-group input-group-lg" >
                                <h4 class="text-center" style="color:lavender ">Crea Tu Album</h4>

                                <row class="col-xs-12 "><input style="border-color: black" required="Campo obligatorio" type="text" class="form-control" placeholder="Nombre" id="txtnombreAlbum"></row>

                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                    <div  id="faltaNombre" hidden>
                                        <span class="glyphicon glyphicon-alert" style="color: red"></span>
                                        <span style="color: red; padding-left: 5px">Debes de ingresar un nombre.</span>
                                    </div>
                                </row>

                                <span style="color: lavender; padding-left: 15px; font-weight: bold">Fecha de nacimiento:</span>
                                <div class="form-group"> 
                                    <div class="col-xs-4">          
                                        <input style="border-color: black" required="Campo obligatorio" type="text" class="form-control" placeholder="Dia" id="txtDia">
                                    </div>
                                    <div class="col-xs-4 selectContainer">
                                        <select style="border-color: black" required="Campo obligatorio" class="form-control"  id="txtMes">
                                            <option value="mes">Mes</option>
                                            <option value="enero">Enero</option>
                                            <option value="febrero">Febrero</option>
                                            <option value="marzo">Marzo</option>
                                            <option value="abril">Abril</option>
                                            <option value="mayo">Mayo</option>
                                            <option value="junio">Junio</option>
                                            <option value="julio">Julio</option>
                                            <option value="agosto">Agosto</option>
                                            <option value="setiembre">Setiembre</option>
                                            <option value="octubre">Octubre</option>
                                            <option value="noviembre">Noviembre</option>
                                            <option value="diciembre">Diciembre</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-4">
                                        <input style="border-color: black" required="Campo obligatorio"  type="text" class="form-control" placeholder="Año" id="txtAnio">
                                    </div>
                                </div>

                                <span style="color: lavender; padding-left: 15px; font-weight: bold">Elegir Generos:</span>
                                <br>

                                <row class="col-xs-3">
                                    <div class=" styled-select ">

                                        <%
                                            ArrayList<DtGenero> generos = (ArrayList<DtGenero>) request.getAttribute("Generos");
                                        %>

                                        <select  id="listaGeneros"  class="form-control" size="2" style="width: 100px; height: 100px">

                                            <%                                             
                                                for (DtGenero genero : generos) {
                                            %>
                                            <option> <%= genero.getNombre()%> </option>   
                                            <%}%>
                                        </select>
                                    </div>
                                </row>
                                <row class="col-xs-3">
                                    <div>
                                        <input type="button" class="btn btn-default pull-right" id="btnAgregar" style="margin-top: 8px" value="Agregar"/>                                   
                                    </div>
                                </row>
                                <row class="col-xs-3">
                                    <div>
                                        <select  id="listaGeneroFinal"  class="form-control" size="2" style="width: 100px; height: 100px">                                          
                                        </select>
                                    </div>
                                </row>
                                <row><div><input type="button" class="btn btn-default pull-right" id="btnQuitar" style="margin-top: 8px" value="Quitar"/></div></row>
                            </div>                           
                        </form>
                        <br>            
                        <form action="SContenido" method="post" enctype="multipart/form-data">
                            <table>
                                <tr>
                                    <td><input type="file" name="file"/></td>
                                    <td><input type="submit" value="SUBIR ARCHIVO"/></td>
                                </tr>
                            </table>
                        </form>
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
        <script src="scripts/altaAlbum.js" type="text/javascript"></script>
    </body>

</html>