<%-- 
    Document   : consultaAlbum.jsp
    Created on : 02/10/2017, 03:21:48 AM
    Author     : brian
--%>

<%@page import="Logica.DtAlbum"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
        ArrayList<DtAlbum> albumes = (ArrayList<DtAlbum>) request.getAttribute("Albumes");
        
       %>
    </body>
</html>
