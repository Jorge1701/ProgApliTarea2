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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("mensaje_error", "Ups, usted no deberia estar aqui :s");
        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("accion") == null) {
            request.setAttribute("mensaje_error", "No hay una accion");
            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
            return;
        }

        String accion = request.getParameter("accion");

        switch (accion) {
            case "redirigir":
                request.getRequestDispatcher("vistas/registrarse.jsp").forward(request, response);

                break;
            default:
                request.setAttribute("mensaje_error", "El resto de acciones van por POST");
                request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        iUsuario = Fabrica.getIControladorUsuario();

        String existe;
        String accion = request.getParameter("accion");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");

        if ("redirigir".equals(accion)) {                                         //Reridigir a la pagina de registro
            this.getServletContext().getRequestDispatcher("/vistas/registrarse.jsp").forward(request, response);

        } else if ("nickname".equals(accion)) {                                  //Verficacion de nickname
            DtUsuario usuario = iUsuario.getDataUsuario(nickname);
            if (usuario != null) {
                existe = "si";
            } else {
                existe = "no";
            }
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(existe);

        } else if ("email".equals(accion)) {                              //Verficacion de email

            if (!iUsuario.correoExiste(email)) {
                existe = "si";
            } else {
                existe = "no";
            }
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(existe);

        } else if ("registro".equals(accion)) {                            //Ingreso del perfil
            String contrasenia = request.getParameter("contrasenia");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String dia = request.getParameter("dia");
            String mes = request.getParameter("mes");
            String anio = request.getParameter("anio");
            String biografia = request.getParameter("biografia");
            String link = request.getParameter("link");
            String artista = request.getParameter("artista");

            int nMes;
            switch (mes) {
                case "enero":
                    nMes = 1;
                    break;
                case "febrero":
                    nMes = 2;
                    break;
                case "marzo":
                    nMes = 3;
                    break;
                case "abril":
                    nMes = 4;
                    break;
                case "mayo":
                    nMes = 5;
                    break;
                case "junio":
                    nMes = 6;
                    break;
                case "julio":
                    nMes = 7;
                    break;
                case "agosto":
                    nMes = 8;
                    break;
                case "setiembre":
                    nMes = 9;
                    break;
                case "octubre":
                    nMes = 10;
                    break;
                case "noviembre":
                    nMes = 11;
                    break;
                case "diciembre":
                    nMes = 12;
                    break;
                default:
                    nMes = 0;
                    break;
            }

            DtFecha fechaNac = new DtFecha(Integer.valueOf(dia), nMes, Integer.valueOf(anio));

            DtUsuario dtu;
            if ("si".equals(artista)) {
                dtu = new DtArtista(nickname, nombre, apellido, email, fechaNac, "", biografia, link, contrasenia);
            } else {
                dtu = new DtCliente(nickname, nombre, apellido, email, fechaNac, "", contrasenia, null);
            }
            iUsuario.ingresarUsuario(dtu);
            request.getSession().setAttribute("usuario", dtu);

            //request.getRequestDispatcher("SInicio").forward(request, response);      //Redirigir utilizando el nombre del servlet
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
