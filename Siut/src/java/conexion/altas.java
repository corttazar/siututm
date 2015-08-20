/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.CallableStatement;
import conexion.*;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Tony
 */
public class altas {

    conectar con = new conectar();

    //GUARDAR PERSONA CON ORACLE

    public boolean GuardarPersona(String cnombre, String apat, String amat, String titulo, String idtipo,
            String calle, String numero,
            String colonia, String cp, String idestado, String idmunicipio, String curp, String foto,
            String tel, String celular, String correo, String fnac) {
        try {
            if (con.conectar()) {
                CallableStatement cs = null;
                cs = con.conexion.prepareCall("BEGIN INSERTPERSONA(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); END;");
                cs.setString(1, cnombre);
                cs.setString(2, apat);
                cs.setString(3, amat);
                cs.setString(4, titulo);
                cs.setString(5, idtipo);
                cs.setString(6, calle);
                cs.setString(7, numero);
                cs.setString(8, colonia);
                cs.setString(9, cp);
                cs.setString(10, idestado);
                cs.setString(11, idmunicipio);
                cs.setString(12, curp);
                cs.setString(13, foto);
                cs.setString(14, tel);
                cs.setString(15, celular);
                cs.setString(16, correo);
                cs.setString(17, fnac);
                cs.execute();
                con.conexion.close();
            }
            return true;
        } catch (Exception e) {
            System.out.println("Error al guardar profesor: " + e);
            return false;
        }
    }

    public boolean GuardarMateria(String mat, String hrs, String hrslab) {
        try {
            if (con.conectar()) {
                CallableStatement cs = null;
                cs = con.conexion.prepareCall("BEGIN INSERTMATERIA(?,?,?); END;");
                cs.setString(1, mat);
                cs.setString(2, hrs);
                cs.setString(3, hrslab);
                cs.execute();
                con.conexion.close();
            }
            return true;
        } catch (Exception e) {
            System.out.println("Error al guardar Materia: " + e);
            return false;
        }
    }

    public boolean Guardarnotificacion(String idper, String notifi) {
        try {
            if (con.conectar()) {
                CallableStatement cs = null;
                cs = con.conexion.prepareCall("BEGIN INSERTNOTIFICACION(?,?); END;");
                cs.setString(1, idper);
                cs.setString(2, notifi);
                cs.execute();
                con.conexion.close();
            }
            return true;
        } catch (Exception e) {
            System.out.println("Error al guardar Materia: " + e);
            return false;
        }
    }

    public boolean GuardarGrupo(String grado, String grupo, String idCarrera, String turno) {
        try {
            if (con.conectar()) {
                CallableStatement cs = null;
                cs = con.conexion.prepareCall("BEGIN INSERTGRUPO(?,?,?,?); END;");
                cs.setString(2, grado);
                cs.setString(1, grupo);
                cs.setString(4, idCarrera);
                cs.setString(3, turno);
                cs.execute();
                con.conexion.close();
            }
            return true;
        } catch (Exception e) {
            System.out.println("Error al guardar grupo: " + e);
            return false;
        }
    }

    public boolean consuexistecurso(String idmat, String idgrup, String idperio) {
        ResultSet rs = null;
        String sql = "select * from cursos where "
                + " idmateria = "+idmat+" and idperiodo = "+idperio+"  and idgrupo = "+idgrup+"";
        try {
            if (con.conectar()) {
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
                if (!rs.next()) {
                    return false;
                } else {
                    return true;
                }
            }

        } catch (Exception e) {
            System.out.println("Error al consultar curso existente: " + e);
        }
        return false;
    }

    public boolean GuardarCurso(String idprof, String idmat, String idgrup, String idlab, String idperio) {
        try {
            if (con.conectar()) {
                CallableStatement cs = null;
                if (!consuexistecurso(idmat, idgrup, idperio)) {
                    cs = con.conexion.prepareCall("BEGIN INSERTCURSO(?,?,?,?,?); END;");
                    cs.setString(1, idprof);
                    cs.setString(2, idmat);
                    cs.setString(3, idgrup);
                    cs.setString(4, idlab);
                    cs.setString(5, idperio);
                    cs.execute();
                    con.conexion.close();
                    return true;
                } else {
                   
                }
            }
             return false;
        } catch (Exception e) {
            System.out.println("Error al guardar cursooo: " + e);
            return false;
        }
    }
}
