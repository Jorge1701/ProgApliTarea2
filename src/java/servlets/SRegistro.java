package servlets;

import Logica.DtArtista;
import Logica.DtCliente;
import Logica.DtFecha;
import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SRegistro", urlPatterns = {"/SRegistro"})
public class SRegistro extends HttpServlet {

    IUsuario iUsuario;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Fabrica.inicializarControladores();
        iUsuario = Fabrica.getIControladorUsuario();

        try {
            Fabrica.levantarDatos();
        } catch (Exception ex) {
            System.out.println("servlets.AltaPerfilServlet.processRequest()" + "error en la base de datos" + ex.getMessage());
        }

        String existe = "";
        String verificacion = request.getParameter("verificacion");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");

        if ("nickname".equals(verificacion)) {                                  //Verficacion de nickname
            DtUsuario usuario = iUsuario.getDataUsuario(nickname);
            if (usuario != null) {
                existe = "si";
            } else {
                existe = "no";
            }
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(existe);

        } else if ("email".equals(verificacion)) {                              //Verficacion de email

            if (!iUsuario.correoExiste(email)) {
                existe = "si";
            } else {
                existe = "no";
            }
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(existe);
        } else {                                                                   //Ingreso del perfil
            String contrasenia = request.getParameter("contrasenia");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String dia = request.getParameter("dia");
            String mes = request.getParameter("mes");
            String anio = request.getParameter("anio");
            String biografia = request.getParameter("biografia");
            String link = request.getParameter("link");
            String artista = request.getParameter("artista");

            int nMes = 0;
            if ("enero".equals(mes)) {
                nMes = 1;
            } else if ("febrero".equals(mes)) {
                nMes = 2;
            } else if ("marzo".equals(mes)) {
                nMes = 3;
            } else if ("abril".equals(mes)) {
                nMes = 4;
            } else if ("mayo".equals(mes)) {
                nMes = 5;
            } else if ("junio".equals(mes)) {
                nMes = 6;
            } else if ("julio".equals(mes)) {
                nMes = 7;
            } else if ("agosto".equals(mes)) {
                nMes = 8;
            } else if ("setiembre".equals(mes)) {
                nMes = 9;
            } else if ("octubre".equals(mes)) {
                nMes = 10;
            } else if ("noviembre".equals(mes)) {
                nMes = 11;
            } else if ("diciembre".equals(mes)) {
                nMes = 12;
            }

            DtFecha fechaNac = new DtFecha(Integer.valueOf(dia), nMes, Integer.valueOf(anio));

            DtUsuario dtu;
            if ("si".equals(artista)) {
                dtu = new DtArtista(nickname, nombre, apellido, email, fechaNac, "", biografia, link, contrasenia);
            } else {
                dtu = new DtCliente(nickname, nombre, apellido, email, fechaNac, "", contrasenia);
            }
            iUsuario.ingresarUsuario(dtu);

            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
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
