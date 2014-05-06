/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import conn.*;// package que contiene la Clase ConectionDBS
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wence
 */
@WebServlet(name = "GuardaSeccion", urlPatterns = {"/GuardaSeccion"})
public class GuardaSeccion extends HttpServlet {

    ConectionDB con = new ConectionDB();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuardaSeccion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardaSeccion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
        //processRequest(request, response);

        HttpSession sesion = request.getSession(true);
        PrintWriter out = response.getWriter();

        try {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuardaSeccion</title>");
            out.println("</head>");
            out.println("<body>");
            con.conectar();

            byte[] a;
            //String value = new String(a, "UTF-8");
            //a = request.getParameter("encuestador").getBytes("ISO-8859-1");
            if (request.getParameter("guarda_seccion").equals("A")) {

                String qry = "update tb_a set  ";
                for (int i = 1; i < 23; i++) {
                    String campo = "";
                    if (i == 18) {
                        String lang[] = request.getParameterValues("campo" + i);
                        for (int j = 0; j < lang.length; j++) {
                            a = lang[j].getBytes("ISO-8859-1");
                            String value = new String(a, "UTF-8");

                            if (!value.equals("")) {
                                campo += value + ",";
                                System.out.println(campo);
                            }
                        }
                    }
                    a = request.getParameter("campo" + i).getBytes("ISO-8859-1");
                    String value = new String(a, "UTF-8");

                    if (i == 18) {
                        value = campo;
                    }
                    qry = qry + "campo" + i + "='" + value + "', ";
                }
                a = request.getParameter("campo23").getBytes("ISO-8859-1");
                String value = new String(a, "UTF-8");
                qry = qry + " campo23='" + value + "' where id_uni = '" + sesion.getAttribute("id_uni") + "' ;";
                con.actualizar(qry);
                // response.sendRedirect("capturaCensosH.jsp");
            }

            if (request.getParameter("guarda_seccion").equals("B")) {

                String qry = "update tb_b set  ";
                for (int i = 24; i < 27; i++) {
                    a = request.getParameter("campo" + i).getBytes("ISO-8859-1");
                    String value = new String(a, "UTF-8");
                    qry = qry + "campo" + i + "='" + value + "', ";
                }
                a = request.getParameter("campo27").getBytes("ISO-8859-1");
                String value = new String(a, "UTF-8");
                qry = qry + " campo27='" + value + "' where id_uni = '" + sesion.getAttribute("id_uni") + "' ;";
                //out.println(qry);
                con.actualizar(qry);
                // response.sendRedirect("capturaCensosH.jsp");
            }

            if (request.getParameter("guarda_seccion").equals("C")) {

                String qry = "update tb_c set  ";
                for (int i = 28; i <= 31; i++) {
                    String campo = "";
                    if (i == 29 || i == 30 || i == 31) {
                        String lang[] = request.getParameterValues("campo" + i);
                        for (int j = 0; j < lang.length; j++) {
                            a = lang[j].getBytes("ISO-8859-1");
                            String value = new String(a, "UTF-8");
                            if (!value.equals("")) {
                                campo += value + ",";
                                System.out.println(campo);
                            }
                        }
                    }

                    a = request.getParameter("campo" + i).getBytes("ISO-8859-1");
                    String value = new String(a, "UTF-8");
                    if (i == 29 || i == 30 || i == 31) {
                        value = campo;
                    }
                    if (i != 31) {
                        qry = qry + "campo" + i + "='" + value + "', ";
                    } else {
                        qry = qry + "campo" + i + "='" + value + "' ";
                    }
                }
                a = request.getParameter("campo31").getBytes("ISO-8859-1");
                String value = new String(a, "UTF-8");
                qry = qry + "  where id_uni = '" + sesion.getAttribute("id_uni") + "' ;";
                con.actualizar(qry);
                //response.sendRedirect("capturaCensosH.jsp");
            }

            if (request.getParameter("guarda_seccion").equals("D")) {

                String campo = "";
                String qry = "update tb_d set  ";
                for (int i = 32; i < 33; i++) {
                    a = request.getParameter("campo" + i).getBytes("ISO-8859-1");
                    String value = new String(a, "UTF-8");

                    qry = qry + "campo" + i + "='" + value + "', ";
                }

                String lang[] = request.getParameterValues("campo33");
                for (int j = 0; j < lang.length; j++) {
                    a = lang[j].getBytes("ISO-8859-1");
                    String value = new String(a, "UTF-8");

                    if (!value.equals("")) {
                        campo += value + ",";
                        System.out.println(campo);
                    }
                }
                a = request.getParameter("campo33").getBytes("ISO-8859-1");
                //a = request.getParameter("campo" + i).getBytes("ISO-8859-1");
                String value = new String(a, "UTF-8");
                value = campo;
                qry = qry + " campo33='" + value + "' where id_uni = '" + sesion.getAttribute("id_uni") + "' ;";
                con.actualizar(qry);
                // response.sendRedirect("capturaCensosH.jsp");
            }

            if (request.getParameter("guarda_seccion").equals("E")) {

                String qry = "update tb_e set  ";
                for (int i = 34; i < 81; i++) {

                    String campo = "";
                    if (i == 40 || i == 42 || i == 43 || i == 47 || i == 49 || i == 52 || i == 54 || i == 55 || i == 57 || i == 67 || i == 68 || i == 70) {
                        String lang[] = request.getParameterValues("campo" + i);
                        for (int j = 0; j < lang.length; j++) {
                            a = lang[j].getBytes("ISO-8859-1");
                            String value = new String(a, "UTF-8");

                            if (!value.equals("")) {
                                campo += value + ",";
                                System.out.println(campo);
                            }
                        }
                    }

                    a = request.getParameter("campo" + i).getBytes("ISO-8859-1");
                    String value = new String(a, "UTF-8");

                    if (i == 40 || i == 42 || i == 43 || i == 47 || i == 49 || i == 52 || i == 54 || i == 55 || i == 57 || i == 67 || i == 68 || i == 70) {
                        value = campo;
                    }
                    qry = qry + "campo" + i + "='" + value + "', ";
                }
                a = request.getParameter("campo81").getBytes("ISO-8859-1");
                String value = new String(a, "UTF-8");
                qry = qry + " campo81='" + value + "' where id_uni = '" + sesion.getAttribute("id_uni") + "' ;";
                con.actualizar(qry);
                //response.sendRedirect("capturaCensosH.jsp");
            }

            if (request.getParameter("guarda_seccion").equals("F")) {

                String qry = "update tb_f set  ";
                for (int i = 82; i < 129; i++) {

                    String campo = "";
                    if (i == 83 || i == 89 || i == 91 || i == 92 || i == 95 || i == 100 || i == 103 || i == 105 || i == 106 || i == 114 || i == 116 || i == 118) {
                        String lang[] = request.getParameterValues("campo" + i);
                        for (int j = 0; j < lang.length; j++) {
                            a = lang[j].getBytes("ISO-8859-1");
                            String value = new String(a, "UTF-8");

                            if (!value.equals("")) {
                                campo += value + ",";
                                System.out.println(campo);
                            }
                        }
                    }

                    a = request.getParameter("campo" + i).getBytes("ISO-8859-1");
                    String value = new String(a, "UTF-8");

                    if (i == 83 || i == 89 || i == 91 || i == 92 || i == 95 || i == 100 || i == 103 || i == 105 || i == 106 || i == 114 || i == 116 || i == 118) {
                        value = campo;
                    }
                    qry = qry + "campo" + i + "='" + value + "', ";
                }
                a = request.getParameter("campo129").getBytes("ISO-8859-1");
                String value = new String(a, "UTF-8");
                qry = qry + " campo129='" + value + "' where id_uni = '" + sesion.getAttribute("id_uni") + "' ;";
                con.actualizar(qry);
                //response.sendRedirect("capturaCensosH.jsp");
            }

            if (request.getParameter("guarda_seccion").equals("G")) {

                a = request.getParameter("campo130").getBytes("ISO-8859-1");
                String value = new String(a, "UTF-8");
                String qry = "update tb_g set  campo130='" + value + "' where id_uni = '" + sesion.getAttribute("id_uni") + "' ;";
                con.actualizar(qry);
                //response.sendRedirect("capturaCensosH.jsp");
            }

            con.cierraConexion();
            out.println("<script>alert('Sección " + request.getParameter("guarda_seccion") + " guardada CORRECTAMENTE.')</script>");
            out.println("<script>alert('NO OLVIDE TOMAR SUS FOTOS CORRESPONDIENTES')</script>");
            out.println("<script>window.location='capturaCensosH.jsp'</script>");
        } catch (SQLException e) {
            try {
                con.cierraConexion();
                out.println("<script>alert('Existen Campos que no se llenaron correctamente.')</script>");
                out.println("<script>alert('NO OLVIDE TOMAR SUS FOTOS CORRESPONDIENTES')</script>");
                out.println("<script>window.location='capturaCensosH.jsp'</script>");
            } catch (SQLException ex) {
                Logger.getLogger(GuardaSeccion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        out.println("<h1>Servlet GuardaSeccion at " + request.getContextPath() + "</h1>");
        out.println("</body>");
        out.println("</html>");
        //response.sendRedirect("capturaCensosH.jsp");

    }// end of doPost

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
