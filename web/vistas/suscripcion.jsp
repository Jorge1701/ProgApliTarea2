<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include.html"/>

        <title>Contratar Suscripción de Espotify</title>
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
                    <div class="col-lg-3 col-md-3 col-sm-2 col-xs-1"></div>


                    <div class="col-lg-6 col-md-6 col-sm-8 col-xs-10" style="background-color: transparent">
                        <form id="formulario">
                            <div class="input-group input-group-lg" >
                                <h4 class="text-center" style="color:lavender ">Contratar Suscripción</h4>

                                <span style="color: lavender; padding-left: 15px; font-weight: bold">Tipo de Cuota:</span>
                                <div class="form-group"> 
                                    <div class="col-xs-4 selectContainer">
                                        <select style="border-color: black" required="Campo obligatorio" class="form-control"  id="Cuota" name="Cuota">
                                            <option value="Cuota">...</option>
                                            <option value="Semanal">Semanal</option>
                                            <option value="Mensual">Mensual</option>
                                            <option value="Anual">Anual</option>
                                        </select>
                                    </div>
                                </div>

                                <row class="col-xs-12"> <div style="margin: 20px"></div> </row>

                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h3><span class="label label-default" id="montototal">Aquí aparecerá el monto a pagar</span></h3></row>

                                <row class="col-xs-12"> <div style="margin: 20px"></div> </row>


                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><input type="button" class="btn btn-default pull-left" id="btnConfirmar" style="margin-top: 8px" value="Confirmar"/></row>

                                <row class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> <div style="margin: 15px"></div></row>

                            </div>
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
    </div>
    <script src="scripts/suscripcion.js" type="text/javascript"></script>
</body>
</html>