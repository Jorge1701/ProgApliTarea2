/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Logica.DtAlbum;
import Logica.DtGenero;
import Logica.Fabrica;
import Logica.IContenido;
import Logica.IUsuario;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author brian
 */
@WebServlet(name = "SContenido", urlPatterns = {"/SContenido"})
public class SContenido extends HttpServlet {

    private IContenido iContenido;
    private IUsuario iUsuario;

    public SContenido() {
        iContenido = Fabrica.getIControladorContenido();
        iUsuario = Fabrica.getIControladorUsuario();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if("ConsultaAlbumGenero".equals(accion)){
        String nombreGenero =  request.getParameter("Genero");
        ArrayList<DtAlbum> albumes =  iContenido.listarAlbumesGenero(nombreGenero);
        request.setAttribute("Albumes",albumes);
        request.getRequestDispatcher("/vistas/consultaAlbum.jsp").forward(request, response);

        }
        if("ConsultaAlbumArtista".equals(accion)){
        String Nickartista =  request.getParameter("Artista");
        ArrayList<DtAlbum> albumes = iUsuario.listarAlbumesArtista(Nickartista);
        request.setAttribute("Albumes", albumes);
        request.getRequestDispatcher("/vista/consultaAlbum.jsp").forward(request, response);        
        }
        if ("AltaAlbum".equals(accion)) {
            ArrayList<DtGenero> generos = ((DtGenero) iContenido.listarGenero()).getSubGeneros();
            request.setAttribute("Generos", generos);
            request.getRequestDispatcher("/vistas/AltaAlbum.jsp").forward(request, response);

        }
        if ("agregarGenero".equals(accion)) {
            String nombreGenero = request.getParameter("GeneroSelect");
            log(nombreGenero);
            DtGenero genero = (DtGenero) iContenido.selecGenero(nombreGenero);
            request.setAttribute("Genero", genero);
            request.getRequestDispatcher("/vistas/AltaAlbum.jsp").forward(request, response);
        }
        if ("subirImagen".equals(accion)) {
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

                out.print("<h2>ARCHIVO CORRECTAMENTE SUBIDO.....</h2>" + "\n\n" + "<a href='index.jsp'>VOVLER AL MENU</a>");

            } catch (Exception e) {
                out.print("Exception: " + e.getMessage() + "");
            }

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
