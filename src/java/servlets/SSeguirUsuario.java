package servlets;

import Logica.DtCliente;
import Logica.DtSuscripcion;
import Logica.Fabrica;
import Logica.IUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SSeguirUsuario", urlPatterns = {"/SSeguirUsuario"})
public class SSeguirUsuario extends HttpServlet {

    IUsuario iUsuario;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        iUsuario = Fabrica.getIControladorUsuario();

        String accion = request.getParameter("accion");
        String seguidor = request.getParameter("seguidor");
        String seguido = request.getParameter("seguido");
        String respuesta = "";

        if ("seguir".equals(accion)) {
            DtSuscripcion suscripcion = ((DtCliente) iUsuario.getDataUsuario(seguidor)).getSuscripcion();
            if (suscripcion != null && "vigente".equals(suscripcion.getEstado())) {
                iUsuario.seguirUsuario(seguidor, seguido);
                respuesta = "siguiendo";                                         // Texto para mostrar en el boton una vez presionado
            } else {
                respuesta = "error, no tiene suscripcion o esta vencida";
            }
        } else if ("dejarSeguir".equals(accion)) {
            iUsuario.dejarSeguirUsuario(seguidor, seguido);
            respuesta = "seguir";
        }

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(respuesta);

        request.getRequestDispatcher("vistas/perfilUsuario.jsp").forward(request, response);

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
