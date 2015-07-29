/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Tony
 */
public class consultas {

    conectar con = new conectar();

    public ResultSet consulpersonas(String A, String B, String C) {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM " + A + " p \n"
                    + "inner join tipos t \n"
                    + "on p.idtipo = t.idtipo \n"
                    + "where p." + B + " \n"
                    + "like '%" + C + "%'\n"
                    + "or p.apmaterno  like '%" + C + "%' \n"
                    + "or p.appaterno  like '%" + C + "%'";
            if (con.conectar()) {
                System.out.println("Query: " + sql);
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
            System.out.println("Se realizo la consulta");

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }
        return rs;
    }

    public ResultSet consulmaterias(String A, String B, String C) {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM " + A + " m \n"
                    + "where m." + B + " \n"
                    + "like '%" + C + "%'\n"
                    + "or m.materia  like '%" + C + "%'";
            if (con.conectar()) {
                System.out.println("Query: " + sql);
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
            System.out.println("Se realizo la consulta");

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }
        return rs;
    }

    public ResultSet consulgrupos(String A, String B, String C) {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM grupos";
            if (con.conectar()) {
                System.out.println("Query: " + sql);
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
            System.out.println("Se realizo la consulta");

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }
        return rs;
    }

    public ResultSet consullab() {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM laboratorios";
            if (con.conectar()) {
                System.out.println("Query: " + sql);
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
            System.out.println("Se realizo la consulta");

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }
        return rs;
    }

    public ResultSet consulperiodo() {
        ResultSet rs = null;
        try {
            String sql = "select idperiodo, to_char(de, 'month','nls_date_language=spanish') as inicio, \n"
                    + "to_char(hasta, 'month','nls_date_language=spanish') as fin , to_char(hasta, 'yyyy') as anio from periodos";
            if (con.conectar()) {
                System.out.println("Query: " + sql);
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
            System.out.println("Se realizo la consulta");

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }
        return rs;
    }

    public ResultSet consulcarreras(String A, String B, String C) {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM carreras";
            if (con.conectar()) {
                System.out.println("Query: " + sql);
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
            System.out.println("Se realizo la consulta");

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }
        return rs;
    }

    public ResultSet consulcursos() {
        ResultSet rs = null;
        try {
            String sql = "select p.titulo, p.nombres, p.appaterno, p.apmaterno,\n"
                    + "m.materia, g.grado, g.grupo, l.edificio, l.laboratorio, l.especialidad,\n"
                    + "to_char(p.de, 'month','nls_date_language=spanish') as inicio, \n"
                    + "to_char(p.hasta, 'month','nls_date_language=spanish') as fin , to_char(p.hasta, 'yyyy') as anio\n"
                    + "from cursos c\n"
                    + "inner join personas p \n"
                    + "on c.idpersona = p.idpersona\n"
                    + "inner join materias m \n"
                    + "on m.idmateria = c.idmateria\n"
                    + "inner join grupos g\n"
                    + "on g.idgrupo = c.idgrupo\n"
                    + "inner join laboratorios l\n"
                    + "on l.idlab = c.idlab\n"
                    + "inner join periodos p\n"
                    + "on p.idperiodo = c.idperiodo ";
            if (con.conectar()) {
                System.out.println("Query: " + sql);
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
            System.out.println("Se realizo la consulta");

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }
        return rs;
    }

    public ResultSet consulperiodos(String A, String B, String C) {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM periodos";
            if (con.conectar()) {
                System.out.println("Query: " + sql);
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
            System.out.println("Se realizo la consulta");

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }
        return rs;
    }

    public ResultSet consulgrupo() {
        ResultSet rs = null;
        try {
            String sql = "select * from grupos g\n"
                    + "inner join carreras c\n"
                    + "on g.idcarrera = c.idcarrera";
            if (con.conectar()) {
                System.out.println("Query: " + sql);
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
            System.out.println("Se realizo la consulta");

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }
        return rs;
    }

}
