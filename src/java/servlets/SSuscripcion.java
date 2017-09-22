/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SSuscripcion", urlPatterns = {"/SSuscripcion"})
public class SSuscripcion extends HttpServlet {

    IUsuario iUsuario;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        iUsuario = Fabrica.getIControladorUsuario();

        if (request.getParameter("accion").equals("redir")) {
            this.getServletContext().getRequestDispatcher("/vistas/suscripcion.jsp").forward(request, response);
        } else if (request.getParameter("accion").equals("monto")) {
            String cuota = request.getParameter("Cuota");
            int monto = iUsuario.getMonto(cuota);
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(String.valueOf(monto));
        } else if (request.getParameter("accion").equals("registro")) {
            if(request.getSession().getAttribute("usuario") == null){
             return;
            }
            DtUsuario usuario = (DtUsuario) request.getSession().getAttribute("usuario");
            String nickname = usuario.getNickname();
            String cuota = request.getParameter("Cuota");
            
            if (iUsuario.ingresarSuscripcion(nickname, cuota)) {
                this.getServletContext().getRequestDispatcher("SInicio").forward(request, response);
            } else {
                response.setContentType("text/plain");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("ERROR");
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
