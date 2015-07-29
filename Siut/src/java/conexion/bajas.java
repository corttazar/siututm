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
public class bajas {
    conectar con = new conectar();
    
    
    public boolean Borrarpersona(int idpersona) {
        try {
            if (con.conectar()) {
                CallableStatement cs = null;
                cs = con.conexion.prepareCall("BEGIN BORRARPERSONA(?); END;");
                cs.setInt(1, idpersona);
                cs.execute();
                con.conexion.close();
                System.out.println("borrado");
            }
            return true;
        } catch (Exception e) {
            System.out.println("error al borrar: " + e);
            return false;
        }
    }
    
    public boolean Borrarmateria(int idmateria) {
        try {
            if (con.conectar()) {
                CallableStatement cs = null;
                cs = con.conexion.prepareCall("BEGIN BORRARMATERIA(?); END;");
                cs.setInt(1, idmateria);
                cs.execute();
                con.conexion.close();
                System.out.println("borrado");
            }
            return true;
        } catch (Exception e) {
            System.out.println("error al borrar: " + e);
            return false;
        }
    }
}
