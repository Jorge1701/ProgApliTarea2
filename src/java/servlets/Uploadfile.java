package servlets;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "Uploadfile", urlPatterns = {"/Uploadfile"})
public class Uploadfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ruta = getServletContext().getRealPath("/");
        String[] parte = ruta.split("Tarea2");
        String tarea1 = parte[0] + "Tarea1" + File.separator;

        response.setContentType("text/html;charset=UTF-8");

        String accion = "tema";//request.getParameter("accion");

        String archivourl = "";
        if (accion != null) {
            switch (accion) {
                case "registro":
                    archivourl = tarea1 + "Recursos/Imagenes/Usuarios";
                    break;
                case "album":
                    archivourl = tarea1 + "Recursos/Imagenes/Albumes";
                    break;
                case "lista":
                    archivourl = tarea1 + "Recursos/Imagenes/Listas";
                    break;
                case "tema":
                    archivourl = tarea1 + "Recursos/Musica";
                    break;
            }
        }

        DiskFileItemFactory factory = new DiskFileItemFactory();

        factory.setSizeThreshold(1024);

        factory.setRepository(new File(archivourl));

        ServletFileUpload upload = new ServletFileUpload(factory);

        try {

            List<FileItem> partes = upload.parseRequest(request);

            for (FileItem items : partes) {

                log(items.getName());

                File file = new File(archivourl, items.getName());
                items.write(file);

            }

        } catch (Exception e) {

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
