package servlets;

import Logica.DtAlbumContenido;
import Logica.DtGenero;
import Logica.DtCliente;
import Logica.DtLista;
import Logica.DtListaParticular;
import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IContenido;
import Logica.IUsuario;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "SContenido", urlPatterns = {"/SContenido"})
public class SContenido extends HttpServlet {

    private IUsuario iUsuario;
    private IContenido iContenido;

    public SContenido() {
        iUsuario = Fabrica.getIControladorUsuario();
        iContenido = Fabrica.getIControladorContenido();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ruta = getServletContext().getRealPath("/");
        String[] parte = ruta.split("Tarea2");
        String tarea1 = parte[0] + "Tarea1" + File.separator;

        if (request.getParameter("accion") == null) {
            request.setAttribute("mensaje_error", "Falta una accion");
            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
        } else {
            String accion = request.getParameter("accion");

            switch (accion) {
                case "subirImagen":
                    String archivourl = tarea1 + "Recursos\\Imagenes\\Albumes";

                    DiskFileItemFactory factory = new DiskFileItemFactory();

                    factory.setSizeThreshold(1024);

                    factory.setRepository(new File(archivourl));

                    ServletFileUpload upload = new ServletFileUpload(factory);

                    try {

                        List<FileItem> partes = upload.parseRequest(request);

                        for (FileItem items : partes) {
                            File file = new File(archivourl, items.getName());
                            items.write(file);
                        }

                        System.out.println("<h2>ARCHIVO CORRECTAMENTE SUBIDO.....</h2>" + "\n\n" + "<a href='index.jsp'>VOVLER AL MENU</a>");

                    } catch (Exception e) {
                        System.out.println("Exception: " + e.getMessage() + "");
                    }
                    break;
                case "AltaAlbum":
                    ArrayList<DtGenero> generos = ((DtGenero) iContenido.listarGenero()).getSubGeneros();
                    request.setAttribute("Generos", generos);
                    request.getRequestDispatcher("/vistas/AltaAlbum.jsp").forward(request, response);
                    break;

                case "consultarGenero":
                    if (request.getParameter("genero") == null) {
                        request.setAttribute("mensaje_error", "Faltan parámetros");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                    } else {
                        String genero = request.getParameter("genero");
                        if (iContenido.existeGenero(genero)) {
                            if (request.getSession().getAttribute("usuario") != null) {
                                DtUsuario dtu = (DtUsuario) request.getSession().getAttribute("usuario");
                                if (dtu instanceof DtCliente) {
                                    request.setAttribute("listasFav", iUsuario.obtenerListasFav(dtu.getNickname()));
                                    request.setAttribute("albumesFav", iUsuario.obtenerAlbumesFav(dtu.getNickname()));
                                }
                            }

                            request.setAttribute("genero", genero);
                            request.setAttribute("listas", iContenido.listarLisReproduccionGen(genero));
                            request.setAttribute("albumes", iContenido.listarAlbumesGenero(genero));
                            request.getRequestDispatcher("vistas/consultar_genero.jsp").forward(request, response);
                        } else {
                            request.setAttribute("mensaje_error", "El genero no existe");
                            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        }
                    }
                    break;

                case "consultarAlbum":
                    String nickArtista = request.getParameter("nickArtista");
                    String nomAlbum = URLDecoder.decode(request.getParameter("nombreAlbum"), "UTF-8");
                    DtAlbumContenido dtAlbum = iUsuario.obtenerAlbumContenido(nickArtista, nomAlbum);
                    request.setAttribute("Album", dtAlbum);
                    request.getRequestDispatcher("/vistas/consultaAlbum.jsp").forward(request, response);
                    break;

                case "crearAlbum":
                    String nombreAlbum = request.getParameter("nombreAlbum");
                    int anio = Integer.parseInt(request.getParameter("anio"));
                    String[] generos1 = request.getParameterValues("genero");
                    String imagen = request.getParameter("imagen");
                    iContenido.ingresarAlbum(nombreAlbum, anio, null, imagen, null);
                    break;
                case "consultarListaDefecto":
                    if (request.getParameter("nomGenero") == null || request.getParameter("nomLista") == null) {
                        request.setAttribute("mensaje_error", "Faltan parámetros");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                    } else {
                        String genero = request.getParameter("nomGenero");
                        if (iContenido.existeGenero(genero)) {
                            String nomLista = request.getParameter("nomLista");
                            DtLista lEncontrada = null;
                            ArrayList<DtLista> listas = iContenido.listarLisReproduccionGen(genero);
                            for (DtLista l : listas) {
                                if (l.getNombre().equals(nomLista)) {
                                    lEncontrada = l;
                                    break;
                                }
                            }
                            if (lEncontrada == null) {
                                request.setAttribute("mensaje_error", "La lista no existe");
                                request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                            } else {
                                request.setAttribute("lista", lEncontrada);
                                request.getRequestDispatcher("vistas/consultar_lista.jsp").forward(request, response);
                            }

                        } else {
                            request.setAttribute("mensaje_error", "El genero no existe");
                            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        }
                    }
                    break;
                case "consultarListaParticular":
                    if (request.getParameter("nickCliente") == null || request.getParameter("nomLista") == null) {
                        request.setAttribute("mensaje_error", "Faltan parámetros");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                    } else {
                        String nickCliente = request.getParameter("nickCliente");
                        if (iUsuario.getDataUsuario(nickCliente) != null) {
                            String nomLista = request.getParameter("nomLista");
                            DtLista lEncontrada = null;
                            ArrayList<DtLista> listas = iUsuario.listarLisReproduccion(nickCliente);
                            for (DtLista l : listas) {
                                if (l.getNombre().equals(nomLista)) {
                                    lEncontrada = l;
                                    break;
                                }
                            }
                            if (lEncontrada == null) {
                                request.setAttribute("mensaje_error", "La lista no existe");
                                request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                            } else if (lEncontrada instanceof DtListaParticular && ((DtListaParticular) lEncontrada).isPrivada()) {
                                if (request.getSession().getAttribute("usuario") == null) {
                                    request.setAttribute("mensaje_error", "La lista es privada");
                                    request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                                }
                                DtUsuario usuario = (DtUsuario) request.getSession().getAttribute("usuario");
                                if (!((DtListaParticular) lEncontrada).getNickDuenio().equals(usuario.getNickname())) {
                                    request.setAttribute("mensaje_error", "La lista es privada");
                                    request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                                } else {
                                    request.setAttribute("lista", lEncontrada);
                                    request.getRequestDispatcher("vistas/consultar_lista.jsp").forward(request, response);
                                }

                            } else {
                                request.setAttribute("lista", lEncontrada);
                                request.getRequestDispatcher("vistas/consultar_lista.jsp").forward(request, response);
                            }

                        } else {
                            request.setAttribute("mensaje_error", "El cliente no existe");
                            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        }
                    }

                    break;

                case "publicarLista":
                    DtUsuario usuario = (DtUsuario) request.getSession().getAttribute("usuario");
                    if (usuario != null) {
                        if (iUsuario.getDataUsuario(usuario.getNickname()) != null) {
                            String nomLista = request.getParameter("nomLista");
                            if (nomLista == null) {
                                request.setAttribute("mensaje_error", "Faltan parámetros");
                                request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                            } else {
                                try {
                                    iContenido.publicarLista(usuario.getNickname(), nomLista);
                                    request.setAttribute("pestania", "Listas");
                                    request.setAttribute("nickUs", usuario.getNickname());
                                    request.getRequestDispatcher("/SConsultarPerfil").forward(request, response);
                                } catch (UnsupportedOperationException e) {
                                    request.setAttribute("mensaje_error", "No existe la lista '" + nomLista + "' en el sistema");
                                    request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                                }

                            }
                        } else {
                            request.setAttribute("mensaje_error", "El cliente no existe");
                            request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                        }

                    } else {
                        request.setAttribute("mensaje_error", "Debe de iniciar sesion para utilizar esta opcion");
                        request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                    }

                    break;
                default:
                    request.setAttribute("mensaje_error", "Accion desconocida");
                    request.getRequestDispatcher("vistas/pagina_error.jsp").forward(request, response);
                    break;

            }
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
    }// </editor-fold>
}
