package servlets;

import Logica.Fabrica;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SInicio", urlPatterns = {"/SInicio"})
public class SInicio extends HttpServlet {

    @Override
    public void init() throws ServletException {
        try {
            Fabrica.levantarDatos();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("cargarDatosPrueba") != null) {
            System.out.println("servlets.SInicio.processRequest() CARGAR DATOS PRUEBA");
            try {
                Fabrica.cargaDatosPrueba();
                request.getSession().removeAttribute("usuario");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        //getServletContext().getRequestDispatcher("/vistas/inicio.jsp").forward(request, response);         //Redirige a inicio(igual que la linea de abajo)
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
