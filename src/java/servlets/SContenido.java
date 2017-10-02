package servlets;

import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IContenido;
import Logica.IUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
                default:
                    request.setAttribute("mensaje_error", "Accion desconocida");
                    request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                    break;
            }
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
