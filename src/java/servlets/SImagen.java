package servlets;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Set;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SImagen", urlPatterns = {"/SImagen"})
public class SImagen extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ruta = getServletContext().getRealPath("/");
        String[] parte = ruta.split("ProgApliTarea2");
        String tarea1 = parte[0] + "ProgApliTarea1\\";

        if (request.getParameter("usuario") != null) {
            BufferedImage bi = null;
            try {
                bi = ImageIO.read(new File(tarea1 + "Recursos/Imagenes/Usuarios/" + request.getParameter("usuario")));
            } catch (IOException e) {
                bi = ImageIO.read(new File(tarea1 + "Recursos/Imagenes/Usuarios/userDefaullt.png"));
            }
            OutputStream out = response.getOutputStream();
            ImageIO.write(bi, "png", out);
            out.close();
        } else if (request.getParameter("album") != null) {
            BufferedImage bi = null;
            try {
                bi = ImageIO.read(new File(tarea1 + "Recursos/Imagenes/Albumes/" + request.getParameter("album")));
            } catch (IOException e) {
                bi = ImageIO.read(new File(tarea1 + "Recursos/Imagenes/Albumes/albumDefault.png"));
            }
            OutputStream out = response.getOutputStream();
            ImageIO.write(bi, "png", out);
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
