package servlets;

import Logica.DtAlbum;
import Logica.DtGenero;
import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IContenido;
import Logica.IUsuario;
import java.io.File;
import java.io.IOException;
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

@WebServlet(name = "SContenido", urlPatterns = {"/SContenido"})
public class SContenido extends HttpServlet {

    private IUsuario iUsuario;
    private IContenido iContenido;

    public SContenido() {
        iUsuario = Fabrica.getIControladorUsuario();
        iContenido = Fabrica.getIControladorContenido();
    }

    /*
    Como utilizar:
        Reemplazar los X con los valores reales
    
    Consultar Genero:
        /Tarea2/SContenido?accion=consultarGenero&genero=X
    
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("accion") == null) {
            request.setAttribute("mensaje_error", "Falta una accion");
            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
        } else {
            String accion = request.getParameter("accion");

            if ("ConsultaAlbumArtista".equals(accion)) {

            }
            if ("AltaAlbum".equals(accion)) {

            }
            if ("agregarGenero".equals(accion)) {

            }
            if ("subirImagen".equals(accion)) {

            }

            switch (accion) {
                case "consultarGenero":
                    if (request.getParameter("genero") == null) {
                        request.setAttribute("mensaje_error", "Falta el nombre del genero");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                    } else {
                        String genero = request.getParameter("genero");
                        if (iContenido.existeGenero(genero)) {
                            if (request.getSession().getAttribute("usuario") != null) {
                                request.setAttribute("listasFav", iUsuario.obtenerListasFav(((DtUsuario) request.getSession().getAttribute("usuario")).getNickname()));
                            }

                            request.setAttribute("genero", genero);
                            request.setAttribute("listas", iContenido.listarLisReproduccionGen(genero));
                            request.getRequestDispatcher("vistas/consultar_genero.jsp").forward(request, response);
                        } else {
                            request.setAttribute("mensaje_error", "El genero no existe");
                            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        }
                    }
                    break;
                case "ConsultaAlbum":
                    String nombreGenero = request.getParameter("Genero");
                    ArrayList<DtAlbum> albumes = iContenido.listarAlbumesGenero(nombreGenero);
                    request.setAttribute("Albumes", albumes);
                    request.getRequestDispatcher("/vistas/consultaAlbum.jsp").forward(request, response);
                    break;

                case "AltaAlbum":
                    ArrayList<DtGenero> generos = ((DtGenero) iContenido.listarGenero()).getSubGeneros();
                    request.setAttribute("Generos", generos);
                    request.getRequestDispatcher("/vistas/AltaAlbum.jsp").forward(request, response);
                    break;
                case "agregarGenero":
                    String nombreGeneroSelect = request.getParameter("GeneroSelect");
                    log(nombreGeneroSelect);
                    DtGenero genero = (DtGenero) iContenido.selecGenero(nombreGeneroSelect);
                    request.setAttribute("Genero", genero);
                    request.getRequestDispatcher("/vistas/AltaAlbum.jsp").forward(request, response);
                    break;
               
               
                default:
                    request.setAttribute("mensaje_error", "Accion desconocida");
                    request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                    break;

            }
        }
    }

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
