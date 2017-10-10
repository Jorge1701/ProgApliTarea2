/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Logica.DtCliente;
import Logica.DtFecha;
import Logica.DtLista;
import Logica.DtListaParticular;
import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IContenido;
import Logica.IUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Diego
 */
@WebServlet(name = "SLista", urlPatterns = {"/SLista"})
public class SLista extends HttpServlet {

    private IUsuario iUsuario;
    private IContenido iContenido;

    public SLista() {
        iUsuario = Fabrica.getIControladorUsuario();
        iContenido = Fabrica.getIControladorContenido();
    }
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.setAttribute("mensaje_error", "Ups, usted no deberia estar aqui :s");
            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
       
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
        
        DtUsuario dtUs = (DtUsuario) request.getSession().getAttribute("usuario");
        if( dtUs == null) {            // 
            request.setAttribute("mensaje_error", "Debe iniciar sesion");
            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
            return;
        }
        
             
        
        //Chequeo suscripcion
        if (dtUs instanceof DtCliente) {
            
            DtCliente dtC = (DtCliente) dtUs;
            if(dtC.getSuscripcion() != null && dtC.getSuscripcion().getEstado() != null && dtC.getSuscripcion().getEstado().equals("Vigente")){
                request.getRequestDispatcher("vistas/crear_lista_reproduccion.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("mensaje_error", "Usuario sin suscripcion");
                request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                return;
            
            }
        
        }
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
        //processRequest(request, response);
        DtUsuario dtUs = (DtUsuario) request.getSession().getAttribute("usuario");
        
        String existe;
        String accion = request.getParameter("accion");
        String nombreL = request.getParameter("nombreLst");
        
        log("llega al servlet Accion: " + accion   );
        log("nombre lista: " + nombreL);
        
        
        if ("nombreLst".equals(accion)){            
            ArrayList<DtLista> dtl = iUsuario.listarListaReproduccionCli(dtUs.getNickname());
            log("entro 1er if");
            existe = "no";
            for (DtLista dta : dtl) {            
                if(dta.getNombre().equals(nombreL)){
                    existe = "si";
                    log("existe si");
                }             
            }
            
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(existe);
        
        } else if ("registroLst".equals(accion)){
            
            log("entro a crear lista");
            Calendar c = new GregorianCalendar();
            DtFecha actual = new DtFecha(c.get(Calendar.DATE), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR));
            
            DtListaParticular lista = new DtListaParticular(true, nombreL, new ArrayList<>(), null, actual,dtUs.getNickname());
            
            if (!iContenido.crearListaReproduccion(lista, dtUs.getNickname())) {
                //eror
                log("Error");
            } else {            
                log("OK");
            }
            
            
            
        }
        
        
        
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
