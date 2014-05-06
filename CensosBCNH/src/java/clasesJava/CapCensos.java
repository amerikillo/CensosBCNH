/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesJava;

import conn.ConectionDB;
import java.sql.SQLException;

/**
 *
 * @author Amerikillo
 */
public class CapCensos {

    ConectionDB con = new ConectionDB();

    public void Captura(String id_uni, String tipo, String gnombre_gnk, String juris, String fecha, String hora, String encuestador, String muni) throws SQLException {
        try {
            byte[] a;
            //a = tipo.getBytes("ISO-8859-1");
            tipo = new String(tipo.getBytes("ISO-8859-1"), "UTF-8");
            gnombre_gnk = new String(gnombre_gnk.getBytes("ISO-8859-1"), "UTF-8");
            juris = new String(juris.getBytes("ISO-8859-1"), "UTF-8");
            encuestador = new String(encuestador.getBytes("ISO-8859-1"), "UTF-8");
            muni = new String(muni.getBytes("ISO-8859-1"), "UTF-8");
        } catch (Exception e) {
        }
        con.conectar();
        try {
            con.insertar("insert into tb_registro_censos values ('" + id_uni + "', '" + encuestador + "', NOW(), 'INICIO');");
            con.insertar("insert into tb_a (id_uni, campo5, campo4, campo15, campo3, campo1, campo10, campo16, campo18) values('" + id_uni + "', '" + tipo + "', '" + gnombre_gnk + "', '" + juris + "', '" + fecha + " " + hora + "', '" + encuestador + "', '" + muni + "', '" + muni + "', '' )");
            con.insertar("insert into tb_b (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_c (id_uni, campo29) values ('" + id_uni + "', '' )");
            con.insertar("insert into tb_d (id_uni, campo33) values ('" + id_uni + "', '' )");
            con.insertar("insert into tb_e (id_uni, campo40, campo42, campo54, campo55, campo57, campo67, campo68, campo69, campo70) values ('" + id_uni + "', '', '', '', '', '', '', '', '', '')");
            con.insertar("insert into tb_f (id_uni, campo83, campo88, campo89, campo90, campo91, campo92, campo105, campo106, campo114, campo116, campo118) values ('" + id_uni + "','', '', '', '', '', '', '', '','','','')");
            con.insertar("insert into tb_g values ('" + id_uni + "', '')");
        } catch (SQLException e) {
            System.out.println("**************" + e.getMessage());
            try {
                con.actualizar("update tb_a set campo1 = '" + encuestador + "', campo5 = '" + tipo + "', campo4 = '" + gnombre_gnk + "' where id_uni = '" + id_uni + "' ");
            } catch (Exception ex) {
                System.out.println("**************" + ex.getMessage());
            }
        }
        con.cierraConexion();
    }
}
