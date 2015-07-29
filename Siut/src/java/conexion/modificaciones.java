/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.CallableStatement;

/**
 *
 * @author Tony
 */
public class modificaciones {
    conectar con = new conectar();
    
    public boolean ModificaPersona(String cnombre, String apat, String amat, String titulo, int idtipo,
            String calle, int numero,
            String colonia, int cp, int idestado, int idmunicipio, String curp,
            int tel, int celular, String correo, String fnac, int idpers) {
        try {
            if (con.conectar()) {
                CallableStatement cs = null;
                cs = con.conexion.prepareCall("BEGIN ACTUALIZAPERSONA(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); END;");
                cs.setString(1, cnombre);
                cs.setString(2, apat);
                cs.setString(3, amat);
                cs.setString(4, titulo);
                cs.setInt(5, idtipo);
                cs.setString(6, calle);
                cs.setInt(7, numero);
                cs.setString(8, colonia);
                cs.setInt(9, cp);
                cs.setInt(10, idestado);
                cs.setInt(11, idmunicipio);
                cs.setString(12, curp);
                cs.setInt(13, tel);
                cs.setInt(14, celular);
                cs.setString(15, correo);
                cs.setString(16, fnac);
                cs.setInt(17, idpers);
                cs.execute();
                con.conexion.close();
                System.out.println("Se realizo la modificacion");
            }
            return true;
        } catch (Exception e) {
            System.out.println("error al modificar: " + e);
            return false;
        }
    }
    
    public boolean ModificaMateria(String materia, int hrs, int hrslab, int id) {
        try {
            if (con.conectar()) {
                CallableStatement cs = null;
                System.out.println("materia a modificar: "+materia);
                cs = con.conexion.prepareCall("BEGIN ACTUALIZAMATERIA(?,?,?,?); END;");
                cs.setString(1, materia);
                cs.setInt(2, hrs);
                cs.setInt(3, hrslab);
                cs.setInt(4, id);
                cs.execute();
                con.conexion.close();
                System.out.println("Se realizo la modificacion de materia");
            }
            return true;
        } catch (Exception e) {
            System.out.println("error al modificar: " + e);
            return false;
        }
    }
}
