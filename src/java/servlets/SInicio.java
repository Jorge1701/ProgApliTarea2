package servlets;

import Logica.DtCliente;
import Logica.DtSuscripcion;
import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IContenido;
import Logica.IUsuario;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SInicio", urlPatterns = {"/SInicio"})
public class SInicio extends HttpServlet {

    private IUsuario iUsuario;
    private IContenido iContenido;

    public SInicio() {
        iUsuario = Fabrica.getIControladorUsuario();
        iContenido = Fabrica.getIControladorContenido();
    }

    @Override
    public void init() throws ServletException {
        Fabrica.inicializarControladores();
        try {
            Fabrica.levantarDatos();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("cargarDatosPrueba") != null) {
            try {
                Fabrica.cargaDatosPrueba();
                request.getSession().removeAttribute("usuario");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        request.setAttribute("generos", iContenido.obtenerGeneros());
        ArrayList<DtUsuario> clientes = iUsuario.listarClientes();
        ArrayList<DtUsuario> artistas = iUsuario.listarArtistas();

        String busqueda = request.getParameter("busqueda");
        String pestania = request.getParameter("pestania");

        if (busqueda != null && pestania != null) {
            ArrayList<DtUsuario> resultado = new ArrayList<>();
            if (pestania.equals("Clientes")) {
                for (DtUsuario cliente : clientes) {
                    if (cliente.getNickname().toLowerCase().contains(busqueda.toLowerCase()) || cliente.getNombre().toLowerCase().contains(busqueda.toLowerCase()) || cliente.getApellido().toLowerCase().contains(busqueda.toLowerCase())) {
                        resultado.add(cliente);
                    }
                }
                request.setAttribute("clientes", resultado);
                request.setAttribute("artistas", artistas);
                request.setAttribute("busquedaCliente", busqueda);

            } else if (pestania.equals("Artistas")) {
                for (DtUsuario artista : artistas) {
                    if (artista.getNickname().toLowerCase().contains(busqueda.toLowerCase()) || artista.getNombre().toLowerCase().contains(busqueda.toLowerCase()) || artista.getApellido().toLowerCase().contains(busqueda.toLowerCase())) {
                        resultado.add(artista);

                    }
                }
                request.setAttribute("artistas", resultado);
                request.setAttribute("clientes", clientes);
                request.setAttribute("busquedaArtista", busqueda);

            }

        } else {
            request.setAttribute("clientes", clientes);
            request.setAttribute("artistas", artistas);
        }

        if (request.getSession().getAttribute("usuario") != null) {
           
            DtUsuario u = (DtUsuario) request.getSession().getAttribute("usuario");
            
            /*esto agregue */
            
            DtSuscripcion s = ((DtCliente)u).getSuscripcion();
            
            if(s != null){
            
                if(s.getEstado().equals("Vigente")){
                    
                   iUsuario.chequearSuscripcion(u.getNickname());
                   DtUsuario usr = iUsuario.getDataUsuario(u.getNickname());
                   request.setAttribute("usuario", usr);
                   request.setAttribute("suscripcion", ((DtCliente) usr).getSuscripcion());
                
                }
                
            }
            // hasta aca
            if (u instanceof DtCliente) {
                request.setAttribute("seguidos", iUsuario.listarSeguidosDe(u.getNickname()));
            }
        }
        if (request.getParameter("pestania") != null) {
            request.setAttribute("pestania", request.getParameter("pestania"));
        }

        if (request.getParameter("mensaje") != null) {
            request.setAttribute("mensaje", request.getParameter("mensaje"));
        }

        request.getRequestDispatcher("vistas/inicio.jsp").forward(request, response);
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
