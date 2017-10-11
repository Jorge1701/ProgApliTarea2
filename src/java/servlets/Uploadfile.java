package servlets;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Uploadfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String archivourl = "C:\\Users\\brian\\Documents\\NetBeansProjects\\Tarea1\\Recursos\\Imagenes\\Albumes";

        DiskFileItemFactory factory = new DiskFileItemFactory();

        factory.setSizeThreshold(1024);

        factory.setRepository(new File(archivourl));

        ServletFileUpload upload = new ServletFileUpload(factory);

        try {

            List<FileItem> partes = upload.parseRequest(request);

            for (FileItem items : partes) {
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
