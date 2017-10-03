package servlets;

import Logica.DtCliente;
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

@WebServlet(name = "SInicio", urlPatterns = {"/SInicio"})
public class SInicio extends HttpServlet {
    
    private IUsuario iUsuario;
    private IContenido iContenido;
    
    public SInicio() {
        iUsuario = Fabrica.getIControladorUsuario();
        iContenido = Fabrica.getIControladorContenido();
    }
    
    @Override
    public void init() throws ServletException {
        Fabrica.inicializarControladores();
        try {
            Fabrica.levantarDatos();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("cargarDatosPrueba") != null) {
            try {
                Fabrica.cargaDatosPrueba();
                request.getSession().removeAttribute("usuario");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        
        request.setAttribute("generos", iContenido.obtenerGeneros());
        request.setAttribute("artistas", iUsuario.listarArtistas());
        request.setAttribute("clientes", iUsuario.listarClientes());
        if (request.getSession().getAttribute("usuario") != null) {
            DtUsuario u = (DtUsuario) request.getSession().getAttribute("usuario");
            
            if (u instanceof DtCliente) {
                request.setAttribute("seguidos", iUsuario.listarSeguidosDe(u.getNickname()));
            }
        }
        
        if (request.getParameter("mensaje") != null) {
            request.setAttribute("mensaje", request.getParameter("mensaje"));
        }
        
        if (request.getParameter("pestania") != null) {
            request.setAttribute("pestania", request.getParameter("pestania"));
        }
        
        request.getRequestDispatcher("vistas/inicio.jsp").forward(request, response);
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
