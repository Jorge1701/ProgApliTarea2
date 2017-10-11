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

        String accion = "registro";//request.getParameter("accion");

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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
