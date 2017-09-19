package servlets;

import Logica.Fabrica;
import Logica.IUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SSesion", urlPatterns = {"/SSesion"})
public class SSesion extends HttpServlet {

    private IUsuario iUsuario;

    public SSesion() {
        iUsuario = Fabrica.getIControladorUsuario();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getParameter("cerrarSesion") != null) {
            request.getSession().removeAttribute("usuario");
            request.getRequestDispatcher("SInicio").forward(request, response);
        } else if (request.getParameter("nickname") != null && request.getParameter("contrasenia") != null) {
            String chequeo = iUsuario.chequearLogin(request.getParameter("nickname"), request.getParameter("contrasenia"));
            if (chequeo.equals("")) {
                request.getSession().setAttribute("usuario", iUsuario.getDataUsuario(request.getParameter("nickname")));
                request.getRequestDispatcher("SInicio").forward(request, response);
            } else {
                request.setAttribute("error", chequeo);
                request.getRequestDispatcher("/vistas/iniciar_sesion.jsp").forward(request, response);
            }
        } else if (request.getParameter("redirigir") != null) {
            request.getRequestDispatcher("/vistas/iniciar_sesion.jsp").forward(request, response);
        }
    }

    public static boolean usuarioLogeado(HttpServletRequest request) {
        return request.getSession().getAttribute("nickname") != null;
    }

    public static String errorDeContrasenia(HttpServletRequest request) {
        if (request.getAttribute("error") != null) {
            return request.getAttribute("error").toString();
        } else {
            return "";
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
