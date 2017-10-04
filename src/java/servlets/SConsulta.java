/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Logica.DtArtista;
import Logica.DtCliente;
import Logica.DtPerfilArtista;
import Logica.DtPerfilCliente;
import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Diego
 */
@WebServlet(name = "SConsultarPerfil", urlPatterns = {"/SConsultarPerfil"})
public class SConsulta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private IUsuario iUsuario;

    public SConsulta() {
        iUsuario = Fabrica.getIControladorUsuario();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nickUs = request.getParameter("nickUs");
        log(nickUs);
        DtUsuario DtUs = iUsuario.getDataUsuario(nickUs);
        if (DtUs != null) {
            log(DtUs.getNickname());
        } else {
            log("es null");
        }

        log("llega");

        if (DtUs instanceof DtCliente) {

            DtPerfilCliente DtPerfilC = (DtPerfilCliente) iUsuario.obtenerPerfilCliente(nickUs);
            request.setAttribute("DtPerfilCliente", DtPerfilC);

            request.getRequestDispatcher("/vistas/consultaPerfilCliente.jsp").
                    forward(request, response);
        } else if (DtUs instanceof DtArtista) {
            log("obtengo el artisga");
            DtPerfilArtista dtPerfilArtista = (DtPerfilArtista) iUsuario.obtenerPerfilArtista(nickUs);
            request.setAttribute("dtPerfilArtista", dtPerfilArtista);
            request.getRequestDispatcher("/vistas/consultaPerfilArtista.jsp").
                    forward(request, response);
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
