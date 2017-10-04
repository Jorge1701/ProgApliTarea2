<%-- 
    Document   : uploadfile
    Created on : 01/10/2017, 07:19:57 PM
    Author     : brian
--%>

<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUBIENDO ARCHIVO...</title>
    </head>
    <body>
        <%
        
            String archivourl = "C:\\Users\\brian\\Documents\\NetBeansProjects\\Tarea1\\Recursos\\Imagenes\\Albumes";
            
            DiskFileItemFactory factory = new DiskFileItemFactory();
            
            factory.setSizeThreshold(1024);
            
            factory.setRepository(new File(archivourl));
            
            ServletFileUpload upload = new ServletFileUpload(factory);
            
            
            try{
                
                List<FileItem> partes = upload.parseRequest(request);
                
                for(FileItem items: partes){
                    File file = new File(archivourl,items.getName());
                    items.write(file);
                }
                
                out.print("<h2>ARCHIVO CORRECTAMENTE SUBIDO.....</h2>"+"\n\n"+"<a href='../index.html'>VOVLER AL MENU</a>");
                
            }catch(Exception e){
                out.print("Exception: "+e.getMessage()+"");
            }
            
        %>
    </body>
</html>
