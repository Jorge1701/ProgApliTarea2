package servlets;

import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IUsuario;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SUsuario", urlPatterns = {"/SUsuario"})
public class SUsuario extends HttpServlet {

    IUsuario iUsuario;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        iUsuario = Fabrica.getIControladorUsuario();
        ArrayList<DtUsuario> usu = iUsuario.listarUsuarios();
        ArrayList<DtUsuario> usuarios = new ArrayList<>();
        String filtro = request.getParameter("buscar");

        for (DtUsuario u : usu) {
            boolean esUsuLogueado = false;
            if (request.getSession().getAttribute("usuario") != null) {
                if (((DtUsuario) request.getSession().getAttribute("usuario")).getNickname().equals(u.getNickname())) {
                    esUsuLogueado = true;
                }else{
                    esUsuLogueado = false;
                }

            }
            if (filtro != null) {
                if (esUsuLogueado == false && u.getNickname().contains(filtro) || u.getNombre().contains(filtro) || u.getApellido().contains(filtro)) {
                    usuarios.add(u);
                }
            } else {
                log("entro en sin filtro " + esUsuLogueado +" "+ u.getNickname());
                if (esUsuLogueado == false) {
                    usuarios.add(u);
                }
            }
        }
        request.setAttribute("usuarios", usuarios);
        request.getRequestDispatcher("/vistas/usuarios.jsp").forward(request, response);

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
