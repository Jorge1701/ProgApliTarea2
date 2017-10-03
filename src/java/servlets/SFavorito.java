package servlets;

import Logica.DtAlbum;
import Logica.DtAlbumContenido;
import Logica.DtLista;
import Logica.DtTema;
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

@WebServlet(name = "SFavorito", urlPatterns = {"/SFavorito"})
public class SFavorito extends HttpServlet {

    private IUsuario iUsuario;
    private IContenido iContenido;

    public SFavorito() {
        iUsuario = Fabrica.getIControladorUsuario();
        iContenido = Fabrica.getIControladorContenido();
    }

    /*
    Como utilizar:
        Reemplazar los 'X' con las variables correspondientes
    
    Agregar Lista Defecto:
        /Tarea2/SFavorito?accion=listaDefecto&nomGenero=X&nomLista=X
    
    Agregar Lista Particular:
        /Tarea2/SFavorito?accion=listaParticular&nickDienio=X&nomLista=X
    
    Agregar Album:
        /Tarea2/SFavorito?accion=album&nickArtista=X&nomAlbum=X
    
    Agregar Tema:
        /Tarea2/SFavorito?accion=tema&nickArtista=X&nomAlbum=X&nomTema=X
    
    Si todo sale bien, redirigue al inicio con el mensaje de "Se ha agregado tema/lista/album a favoritos"
    
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("usuario") == null) {
            request.setAttribute("mensaje_error", "Debe de estar logueado");
            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
        } else if (false) {
            // TODO: chequear por suscripcion
            request.setAttribute("mensaje_error", "Debe tener una suscripcion vigente");
            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
        } else if (request.getParameter("objeto") != null && request.getParameter("accion") != null) {
            DtUsuario usuario = (DtUsuario) request.getSession().getAttribute("usuario");

            if (iUsuario.obtenerUsuario(usuario.getNickname()) == null) {
                request.setAttribute("mensaje_error", "Usuario no existe");
                request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                return;
            }

            String nickCliente = usuario.getNickname();
            String objeto = request.getParameter("objeto");
            String accion = request.getParameter("accion");

            String nomLista = "";
            String nickArtista = "";
            String nomAlbum = "";
            String mensaje = "";

            switch (objeto) {
                case "listaDefecto":
                    if (request.getParameter("nomGenero") == null || request.getParameter("nomLista") == null) {
                        request.setAttribute("mensaje_error", "Faltan parametros");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        return;
                    }

                    String nomGenero = request.getParameter("nomGenero");
                    nomLista = request.getParameter("nomLista");

                    boolean existeLista = false;
                    ArrayList<DtLista> listas = iContenido.listarLisReproduccionGen(nomGenero);
                    for (DtLista lista : listas) {
                        if (lista.getNombre().equals(nomLista)) {
                            existeLista = true;
                            break;
                        }
                    }

                    if (!existeLista) {
                        request.setAttribute("mensaje_error", "La lista no existe");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        return;
                    }

                    mensaje = "";
                    switch (accion) {
                        case "agregar":
                            iUsuario.agregarLDFav(nickCliente, nomGenero, nomLista);
                            mensaje = ("Lista '" + nomLista + "' agregada a favoritos!").replaceAll(" ", "%20");
                            break;
                        case "quitar":
                            iUsuario.quitarLDFav(nickCliente, nomGenero, nomLista);
                            mensaje = ("Lista '" + nomLista + "' quidata de favoritos!").replaceAll(" ", "%20");
                            break;
                        default:
                            request.setAttribute("mensaje_error", "Accion desconocida");
                            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                            return;
                    }

                    if (request.getParameter("redirigir") != null) {
                        request.getRequestDispatcher(request.getParameter("redirigir")).forward(request, response);
                    } else {
                        request.getRequestDispatcher("/SInicio?mensaje=" + mensaje).forward(request, response);
                    }
                    break;
                case "listaParticular":
                    if (request.getParameter("nickDuenio") == null || request.getParameter("nomLista") == null) {
                        request.setAttribute("mensaje_error", "Faltan parametros");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        return;
                    }

                    String nickDuenio = request.getParameter("nickDuenio");
                    nomLista = request.getParameter("nomLista");

                    boolean existeListaP = false;
                    ArrayList<DtLista> listasP = iUsuario.listarLisReproduccion(nickCliente);
                    for (DtLista lista : listasP) {
                        if (lista.getNombre().equals(nomLista)) {
                            existeListaP = true;
                            break;
                        }
                    }

                    if (!existeListaP) {
                        request.setAttribute("mensaje_error", "La lista no existe");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        return;
                    }

                    mensaje = "";
                    switch (accion) {
                        case "agregar":
                            iUsuario.agregarLPFav(nickCliente, nickDuenio, nomLista);
                            mensaje = ("Lista '" + nomLista + "' agregada a favoritos!").replaceAll(" ", "%20");
                            break;
                        case "quitar":
                            iUsuario.quitarLPFav(nickCliente, nickCliente, nomLista);
                            mensaje = ("Lista '" + nomLista + "' quidata de favoritos!").replaceAll(" ", "%20");
                            break;
                        default:
                            request.setAttribute("mensaje_error", "Accion desconocida");
                            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                            return;
                    }

                    if (request.getParameter("redirigir") != null) {
                        request.getRequestDispatcher(request.getParameter("redirigir")).forward(request, response);
                    } else {
                        request.getRequestDispatcher("/SInicio?mensaje=" + mensaje).forward(request, response);
                    }
                    break;
                case "album":
                    if (request.getParameter("nickArtista") == null || request.getParameter("nomAlbum") == null) {
                        request.setAttribute("mensaje_error", "Faltan parametros");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        return;
                    }

                    nickArtista = request.getParameter("nickArtista");
                    nomAlbum = request.getParameter("nomAlbum");

                    boolean existeAlbum = false;
                    ArrayList<DtAlbum> albumes = iUsuario.listarAlbumesArtista(nickArtista);
                    for (DtAlbum album : albumes) {
                        if (album.getNombre().equals(nomAlbum)) {
                            existeAlbum = true;
                            break;
                        }
                    }

                    if (!existeAlbum) {
                        request.setAttribute("mensaje_error", "El album no existe");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        return;
                    }

                    mensaje = "";
                    switch (accion) {
                        case "agregar":
                            iUsuario.agregarAlbumFav(nickCliente, nickArtista, nomAlbum);
                            mensaje = ("Album '" + nomAlbum + "' agregado a favoritos!").replaceAll(" ", "%20");
                            break;
                        case "quitar":
                            iUsuario.quitarAlbumFav(nickCliente, nickArtista, nomAlbum);
                            mensaje = ("Album '" + nomAlbum + "' quitado de favoritos!").replaceAll(" ", "%20");
                            break;
                        default:
                            request.setAttribute("mensaje_error", "Accion desconocida");
                            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                            return;
                    }

                    if (request.getParameter("redirigir") != null) {
                        request.getRequestDispatcher(request.getParameter("redirigir")).forward(request, response);
                    } else {
                        request.getRequestDispatcher("/SInicio?mensaje=" + mensaje).forward(request, response);
                    }
                    break;
                case "tema":
                    if (request.getParameter("nickArtista") == null || request.getParameter("nomAlbum") == null || request.getParameter("nomTema") == null) {
                        request.setAttribute("mensaje_error", "Faltan parametros");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        return;
                    }

                    nickArtista = request.getParameter("nickArtista");
                    nomAlbum = request.getParameter("nomAlbum");
                    String nomTema = request.getParameter("nomTema");

                    boolean existeTema = false;
                    ArrayList<DtAlbum> albumesA = iUsuario.listarAlbumesArtista(nickArtista);
                    loop:
                    for (DtAlbum album : albumesA) {
                        if (album.getNombre().equals(nomAlbum)) {
                            DtAlbumContenido albumCont = iUsuario.obtenerAlbumContenido(nickArtista, nomAlbum);
                            for (DtTema tema : albumCont.getTemas()) {
                                if (tema.getNombre().equals(nomTema)) {
                                    existeListaP = true;
                                    break loop;
                                }
                            }
                        }
                    }

                    if (!existeTema) {
                        request.setAttribute("mensaje_error", "El tema no existe");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        return;
                    }

                    mensaje = "";
                    switch (accion) {
                        case "agregar":
                            iUsuario.agregarTemaFav(nickCliente, nickArtista, nomAlbum, nomTema);
                            mensaje = ("Tema '" + nomTema + "' agregado a favoritos!").replaceAll(" ", "%20");
                            break;
                        case "quitar":
                            iUsuario.quitarTemaFav(nickCliente, nickArtista, nomAlbum, nomTema);
                            mensaje = ("Tema '" + nomTema + "' quitado de favoritos!").replaceAll(" ", "%20");
                            break;
                        default:
                            request.setAttribute("mensaje_error", "Accion desconocida");
                            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                            return;
                    }

                    if (request.getParameter("redirigir") != null) {
                        request.getRequestDispatcher(request.getParameter("redirigir")).forward(request, response);
                    } else {
                        request.getRequestDispatcher("/SInicio?mensaje=" + mensaje).forward(request, response);
                    }
                    break;
                default:
                    request.setAttribute("mensaje_error", "Objeto desconocido");
                    request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("mensaje_error", "No se ingreso una accion");
            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
