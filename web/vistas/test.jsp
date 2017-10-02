<%-- 
    Document   : test
    Created on : 13/09/2017, 03:28:33 AM
    Author     : brian
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>

        <jsp:include page="include.html"/>

    </head>
    <nav class="navbar navbar-default" role="navigation">
        <!-- El logotipo y el icono que despliega el menú se agrupan
             para mostrarlos mejor en los dispositivos móviles -->

        <!-- Boton de menu para celular 
        <div class="navbar-header" style="width: 60%">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-ex1-collapse">
                <span class="sr-only">Desplegar navegación</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

        </div> -->

        <!-- Agrupar los enlaces de navegación, los formularios y cualquier
             otro elemento que se pueda ocultar al minimizar la barra 
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">

                <ul class="dropdown-menu">
                    <li><a href="#">Acción #1</a></li>
                    <li><a href="#">Acción #2</a></li>
                    <li><a href="#">Acción #3</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Acción #4</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Acción #5</a></li>
                </ul>   
                </li>
            </ul>-->

            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Buscar">
                </div>
                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
            </form>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Registrarse</a></li>
                <li class="dropdown">
                    <a href="#"> Iniciar Sesion </a>
                </li>
            </ul>
        </div>
    </nav>
</html>
