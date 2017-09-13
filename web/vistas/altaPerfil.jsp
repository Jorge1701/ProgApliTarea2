<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>

        <title>Crea tu perfil de Espotify</title>
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

                    <div class="col-lg-6 col-md-6 col-sm-8 col-xs-10" style="background-color: buttonface">
                        <form>
                            <div class="input-group input-group-lg" >
                                <h4 class="text-center">Crea tu perfil</h4>
                                <row class="col-xs-12 "><input type="text" class="form-control" placeholder="Nickname" id="txtNickname"></row>
                                <row class="col-xs-12"><input type="text" class="form-control" placeholder="Email" id="txtEmail"></row>

                                <row class="col-xs-12"> <div style="margin: 20px"></div> </row>

                                <row class="col-xs-6"><input type="text" class="form-control" placeholder="Nombre" id="txtNombre"></row>
                                <row class="col-xs-6"> <input type="text" class="form-control" placeholder="Apellido" id="txtApellido"></row>

                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                    <div  id="alertaNombre" hidden>
                                        <span class="glyphicon glyphicon-alert" style="color: red"></span>
                                        <span style="color: red; padding-left: 5px" >No puedes dejar ninguno de estos campos en blanco.</span>
                                    </div>
                                </row>

                                <span style="color: black; padding-left: 15px">Fecha de nacimiento</span>
                                <div class="form-group"> 
                                    <div class="col-xs-4">          
                                        <input type="text" class="form-control" placeholder="Dia" id="txtDia">
                                    </div>
                                    <div class="col-xs-4 selectContainer">
                                        <select class="form-control" name="Mes">
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
                                        <input type="text" class="form-control" placeholder="Año" id="txtAño">
                                    </div>
                                </div>

                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="password" class="form-control" placeholder="Crea una contraseña" id="txtContrasenia"></row>

                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                    <div  id="faltaContrasenia" hidden>
                                        <span class="glyphicon glyphicon-alert" style="color: red"></span>
                                        <span style="color: red; padding-left: 5px">Debes de ingresar una contraseña.</span>
                                    </div>
                                </row>

                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="password" class="form-control" placeholder="Confirma tu contraseña" id="txtConfContrasenia"></row>

                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 
                                    <div  id="alertaContrasenia" hidden>
                                        <span class="glyphicon glyphicon-alert" style="color: red"></span>
                                        <span style="color: red; padding-left: 5px" >Las Contraseñas no coinciden.</span>
                                    </div>
                                </row>


                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> <div style="margin: 10px"></div> 
                                    <div class="btn-group" data-toggle="buttons">

                                        <label class="btn btn-primary active" id="btnCliente" >
                                            <input type="radio" name="options" autocomplete="off"> Cliente
                                        </label>

                                        <label class="btn btn-primary" data-toggle="collapse" data-target="#datosArtistas" id="btnArtista">
                                            <input type="radio" name="options" autocomplete="off"> Artista
                                        </label>
                                    </div>
                                </row>

                                <div id="datosArtista" hidden >  
                                    <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="text" class="form-control" placeholder="Biografia" style="margin-top:10px" id="txtBiografia"></row>
                                    <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="text" class="form-control" placeholder="Link" id="txtLink"></row>
                                </div>

                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><a href="altaPerfil.jsp" class="btn btn-default pull-right" id="btnRegistro" style="margin-top: 8px">Registrarse</a></row>

                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> <div style="margin: 15px"></div> </row>


                            </div>
                        </form>
                    </div>
                    <!-- Relleno a la derecha -->
                    <div class="col-lg-3 col-md-3 col-sm-2 col-xs-1"></div>

                    <script src="../scripts/altaPerfil.js"></script>

                </div>

                <!-- Lateral -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="border-style:solid; border-width: 2px; padding: 5px">
                    <jsp:include page = "lateral.jsp"/>
                </div>
            </div>

            <!-- Footer -->
            <jsp:include page = "footer.jsp"/>

        </div>
    </div>
</body>
</html>