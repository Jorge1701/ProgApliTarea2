package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "IniciarSesionServlet", urlPatterns = {"/IniciarSesion"})
public class IniciarSesionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String nickname = request.getParameter("nickname");
        String contrasenia = request.getParameter("contrasenia");

        if (nickname.equals("jorge") && contrasenia.equals("1234")) {
            request.removeAttribute("error");
            HttpSession s = request.getSession();
            s.setAttribute("nickname", nickname);
            s.setAttribute("contrasenia", contrasenia);
            request.getRequestDispatcher("SInicio").forward(request, response);
        } else {
            HttpSession s = request.getSession();
            s.removeAttribute("nickname");
            s.removeAttribute("contrasenia");
            request.setAttribute("error", "Nickname o Contraseña no validos");
            this.getServletContext().getRequestDispatcher("/vistas/iniciar_sesion.jsp").forward(request, response);
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
