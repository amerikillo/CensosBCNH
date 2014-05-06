/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import conn.ConectionDB;
import conn.ConectionDB_Nube;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Amerikillo
 */
public class SubeInfo extends HttpServlet {

    ConectionDB_Nube con2 = new ConectionDB_Nube();
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

        HttpSession sesion = request.getSession(true);
        try {
            if (request.getParameter("subir").equals("1")) {
                con.conectar();
                con2.conectar();
                ResultSet rset = con.consulta("select * from tb_a as a, tb_b as b, tb_c as c, tb_d as d, tb_e as e, tb_f as f, tb_g as g, tb_unidades as clave where clave.id_uni = g.id_uni and clave.id_uni=a.id_uni and clave.id_uni=b.id_uni and clave.id_uni=c.id_uni and clave.id_uni=d.id_uni and clave.id_uni=e.id_uni and clave.id_uni=f.id_uni;");
                while (rset.next()) {
                    int ban = 0;

                    try {
                        con2.actualizar("insert into tb_registro_censos values ('" + rset.getString(1) + "', 'SUBE INFO', NOW(), 'SUBE INFORMACION');");
                    } catch (Exception e) {

                    }

                    ResultSet rset2 = con2.consulta("select id_uni from tb_a where id_uni = '" + rset.getString(1) + "'");
                    while (rset2.next()) {
                        ban = 1;
                    }
                    if (ban == 0) {//No Existe el registro, se inserta el actualiza
                    /*
                         * Query para la Tabla A
                         */
                        String tb_a = "insert into tb_a values ('" + rset.getString(1) + "', ";
                        for (int i = 1; i < 23; i++) {
                            tb_a = tb_a + " '" + rset.getString("campo" + i) + "', ";
                        }
                        tb_a = tb_a + " '" + rset.getString("campo23") + "');";
                        try {
                            con2.insertar(tb_a);
                        } catch (SQLException e) {
                        }
                        /*
                         *Qurery para la Tabla B
                         */
                        String tb_b = "insert into tb_b values ('" + rset.getString(1) + "', ";
                        for (int i = 24; i < 27; i++) {
                            tb_b = tb_b + " '" + rset.getString("campo" + i) + "', ";
                        }
                        tb_b = tb_b + " '" + rset.getString("campo27") + "');";
                        try {
                            con2.insertar(tb_b);
                        } catch (SQLException e) {
                        }
                        /*
                         *Qurery para la Tabla C
                         */
                        String tb_c = "insert into tb_c values ('" + rset.getString(1) + "', ";
                        for (int i = 28; i < 31; i++) {
                            tb_c = tb_c + " '" + rset.getString("campo" + i) + "', ";
                        }
                        tb_c = tb_c + " '" + rset.getString("campo31") + "');";
                        try {
                            con2.insertar(tb_c);
                        } catch (SQLException e) {
                        }
                        /*
                         *Qurery para la Tabla D
                         */
                        String tb_d = "insert into tb_d values ('" + rset.getString(1) + "', ";
                        for (int i = 32; i < 33; i++) {
                            tb_d = tb_d + " '" + rset.getString("campo" + i) + "', ";
                        }
                        tb_d = tb_d + " '" + rset.getString("campo33") + "');";
                        try {
                            con2.insertar(tb_d);
                        } catch (SQLException e) {
                        }
                        /*
                         *Qurery para la Tabla E
                         */
                        String tb_e = "insert into tb_e values ('" + rset.getString(1) + "', ";
                        for (int i = 34; i < 81; i++) {
                            tb_e = tb_e + " '" + rset.getString("campo" + i) + "', ";
                        }
                        tb_e = tb_e + " '" + rset.getString("campo81") + "');";
                        try {
                            con2.insertar(tb_e);
                        } catch (SQLException e) {
                        }
                        /*
                         *
                         */

                        System.out.println("hola");
                        String tb_f = "insert into tb_f values ('" + rset.getString(1) + "', ";
                        for (int i = 82; i < 129; i++) {
                        System.out.println("hola2");
                            tb_f = tb_f + " '" + rset.getString("campo" + i) + "', ";
                        }
                        tb_f = tb_f + " '" + rset.getString("campo129") + "');";
                        try {
                            System.out.println(tb_f);
                            con2.insertar(tb_f);
                        } catch (SQLException e) {
                        }
                        /*
                         *Qurery para la Tabla F
                         */
                        String tb_g = "insert into tb_g values ('" + rset.getString(1) + "', '" + rset.getString("campo130") + "');";
                        try {
                            con2.insertar(tb_g);
                        } catch (SQLException e) {
                        }

                    } else {//Si existe el registro, se actualiza
                        /*
                         *Query para tabla a
                         */
                        String tb_a = "update tb_a set ";
                        for (int i = 1; i < 23; i++) {
                            tb_a = tb_a + " campo" + i + "='" + rset.getString("campo" + i) + "', ";
                        }
                        tb_a = tb_a + "campo23='" + rset.getString("campo23") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_a);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_b = "update tb_b set ";
                        for (int i = 24; i < 27; i++) {
                            tb_b = tb_b + " campo" + i + "='" + rset.getString("campo" + i) + "', ";
                        }
                        tb_b = tb_b + "campo27='" + rset.getString("campo27") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_b);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_c = "update tb_c set ";
                        for (int i = 28; i < 31; i++) {
                            tb_c = tb_c + " campo" + i + "='" + rset.getString("campo" + i) + "', ";
                        }
                        tb_c = tb_c + "campo31='" + rset.getString("campo31") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_c);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_d = "update tb_d set ";
                        for (int i = 32; i < 33; i++) {
                            tb_d = tb_d + " campo" + i + "='" + rset.getString("campo" + i) + "', ";
                        }
                        tb_d = tb_d + "campo33='" + rset.getString("campo33") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_d);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_e = "update tb_e set ";
                        for (int i = 34; i < 81; i++) {
                            tb_e = tb_e + " campo" + i + "='" + rset.getString("campo" + i) + "', ";
                        }
                        tb_e = tb_e + "campo81='" + rset.getString("campo81") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_e);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_f = "update tb_f set ";
                        for (int i = 82; i < 129; i++) {
                            tb_f = tb_f + " campo" + i + "='" + rset.getString("campo" + i) + "', ";
                        }
                        tb_f = tb_f + "campo129='" + rset.getString("campo129") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_f);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_g = "update tb_g set campo130='" + rset.getString("campo130") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_g);
                        } catch (SQLException e) {
                        }
                    }
                }

                con2.cierraConexion();
                con.cierraConexion();
                out.println("<script>alert('Se subió la información correctamente')</script>");
                out.println("<script>window.location='indexCap.jsp'</script>");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            out.println("<script>alert('Error al Subir la informacion, consulte las unidades que le faltan')</script>");
            out.println("<script>window.location='indexCap.jsp'</script>");
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
