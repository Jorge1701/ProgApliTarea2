package servlets;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DownloadFile", urlPatterns = {"/DownloadFile"})
public class DownloadFile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("usuario") == null || request.getParameter("Ruta") == null) {
                request.setAttribute("mensaje_error", "Lo siento, no se puede acceder aqui de esa forma");
                request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                return;
            }

            String filename = request.getParameter("Ruta");
            String filepath = "C:\\Users\\brian\\Desktop";
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

            FileInputStream fileInputStream = new FileInputStream(filepath + filename);

            int i;
            while ((i = fileInputStream.read()) != -1) {
                out.write(i);
            }

            fileInputStream.close();
            out.close();
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
