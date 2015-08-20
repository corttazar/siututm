/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.*;

/**
 *
 * @author Tony
 */
public class conectar {

    public Connection conexion;

    //conexion con oracle
    public boolean conectar() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String BD = "jdbc:oracle:thin:@localhost:1521:XE";
            conexion = DriverManager.getConnection(BD, "cargahorariadb", "root");
            if (conexion != null) {
                System.out.println("Conexion exitosa a esquema XE");
                return true;
            } else {
                System.out.println("Conexión fallida");
            }
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return false;
    }

//    public boolean conecta() {
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            String BaseDatos = "jdbc:mysql://localhost:3306/cargahorariadb";
//            conexion = (Connection) DriverManager.getConnection(BaseDatos, "root", "root");
//            if (conexion != null) {
//                System.out.println("Conexion Exitosa");
//                return true;
//            } else {
//                System.out.println("Conexion Fallida");
//                return false;
//            }
//
//        } catch (Exception e) {
//            System.out.println("Error en la conexion: " + e);
//        }
//        return false;
//    }
//     CONSULTA A TABLAS CON ORACLE
//    public ResultSet consulpersonas(String A, String B, String C) {
//        ResultSet rs = null;
//        try {
//            String sql = "SELECT * FROM "+A+" p \n"
//                    + "inner join tipos t \n"
//                    + "on p.idtipo = t.idtipo \n"
//                    + "where p."+B+" \n"
//                    + "like '%"+C+"%'\n"
//                    + "or p.apmaterno  like '%"+C+"%' \n"
//                    + "or p.appaterno  like '%"+C+"%'";
//            if (conectar()) {
//                System.out.println("Query: " + sql);
//                Statement stt = conexion.createStatement();
//                rs = stt.executeQuery(sql);
//            }
//            System.out.println("Se realizo la consulta");
//        
//        } catch (Exception e) {
//            System.out.println("Error al consultar: " + e);
//        }
//        return rs;
//    }
//    public ResultSet Tablas(String A, String B, String C) {
//        ResultSet rs = null;
//        try {
//            //String sql = "Select * from "+A+" where "+B+" like '"+C+"'";
//            String sql = "SELECT * FROM " + A + " p inner join tipos t on p.idtipo = t.idtipo where p." + B + " like '%"
//                    + C + "%' or p.nombres  like '%" + C + "%' or p.apmaterno  like '%"
//                    + C + "%' or p.appaterno  like '%" + C + "%'";
//            if (conecta()) {
//                Statement stt = conexion.createStatement();
//                System.out.println("Query: " + sql);
//                rs = stt.executeQuery(sql);
//
//            }
//
//        } catch (Exception e) {
//            System.out.println("Error: " + e);
//        }
//        return rs;
//    }
//    public boolean ModificaPersona(String cnombre, String apat, String amat, String titulo, String idtipo,
//            String calle, String numero,
//            String colonia, String cp, String idestado, String idmunicipio, String curp,
//            String tel, String celular, String correo, String fnac, String idpers) {
//        System.out.println("Nombre: "+cnombre+" appaterno: "+apat);
//        try {
//            if (conectar()) {
//                CallableStatement cs = null;
//                cs = conexion.prepareCall("BEGIN ACTUALIZAPERSONA(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); END;");
//                cs.setString(1, cnombre);
//                cs.setString(2, apat);
//                cs.setString(3, amat);
//                cs.setString(4, titulo);
//                cs.setString(5, idtipo);
//                cs.setString(6, calle);
//                cs.setString(7, numero);
//                cs.setString(8, colonia);
//                cs.setString(9, cp);
//                cs.setString(10, idestado);
//                cs.setString(11, idmunicipio);
//                cs.setString(12, curp);
//                cs.setString(13, tel);
//                cs.setString(14, celular);
//                cs.setString(15, correo);
//                cs.setString(16, fnac);
//                cs.setString(17, idpers);
//                cs.execute();
//                conexion.close();
//                System.out.println("Se realizo la modificacion");
//            }
//            return true;
//        } catch (Exception e) {
//            System.out.println("error al modificar: " + e);
//            return false;
//        }
//    }
//    public boolean Borrarpersona(int idpersona) {
//        try {
//            if (conectar()) {
//                CallableStatement cs = null;
//                cs = conexion.prepareCall("BEGIN BORRARPERSONA(?); END;");
//                cs.setInt(1, idpersona);
//                cs.execute();
//                conexion.close();
//                System.out.println("borrado");
//            }
//            return true;
//        } catch (Exception e) {
//            System.out.println("error al borrar: " + e);
//            return false;
//        }
//    }
//    public boolean Inserta(String nombre, String appaterno, String apmaterno, String titulo,
//            String tipoprof, String calle, String numero, String colonia, String cp, String edo, String mpio,
//            String curp, String foto, String telefono, String celular, String correo, String fechanac) {
//
//        try {
//            //String sql = "Select * from "+A+" where "+B+" like '"+C+"'";
//            String sql = "insert into personas(nombres, appaterno, apmaterno,  \n"
//                    + " titulo, idtipo, calle, numero, colonia, codpostal, idestado, \n"
//                    + " idmunicipio, curp, foto, telefono, celular, correo, fechanac) \n"
//                    + " values('" + nombre + "','" + appaterno + "','" + apmaterno + "','" + titulo + "' \n"
//                    + " ,'" + tipoprof + "','" + calle + "','" + numero + "','" + colonia + "' \n"
//                    + " ,'" + cp + "','" + edo + "','" + mpio + "','" + curp + "','" + foto + "' \n"
//                    + " ,'" + telefono + "','" + celular + "','" + correo + "','" + fechanac + "')";
//            if (conecta()) {
//                Statement stt = (Statement) conexion.createStatement();
//                System.out.println("Query: " + sql);
//                boolean u = stt.execute(sql);
//                System.out.println("El boleano: "+u);
//                if(!u){
//                    return true;
//                }else{
//                    return false;
//                }
//            }
//        } catch (Exception e) {
//            System.out.println("Error: " + e);
//        }
//        return false;
//    }
//    public boolean Elimina(String A) {
//        ResultSet rs = null;
//        try {
//            //String sql = "Select * from "+A+" where "+B+" like '"+C+"'";
//            String sql = "DELETE FROM personas WHERE idpersona=" + A + ";";
//            if (conecta()) {
//                Statement stt = conexion.createStatement();
//                System.out.println("Query: " + sql);
//                int n = stt.executeUpdate(sql);
//                if (n == 1) {
//                    return true;
//                } else {
//                    return false;
//                }
//            }
//
//        } catch (Exception e) {
//            System.out.println("Error: " + e);
//        }
//        return false;
//    }
    public ResultSet usr(String A, String B) {
        ResultSet rs = null;
        try {
            String sql = "select l.usuario, l.contraseña, t.tipo, p.idpersona, \n"
                    + "p.nombres, p.appaterno, p.titulo, t.idtipo, p.foto, c.idcarrera \n"
                    + "from login l \n"
                    + "inner join personas p \n"
                    + "on l.idpersona = p.idpersona  \n"
                    + "inner join tipos t \n"
                    + "on p.idtipo=t.idtipo \n"
                    + "inner join profesorcarreras pc\n"
                    + "on pc.idprofesor = p.idpersona\n"
                    + "inner join carreras c\n"
                    + "on pc.idcarrera = c.idcarrera\n"
                    + "where l.usuario= '"+A+"' and l.contraseña= '"+B+"'";
            System.out.println("query de usu: " + sql);
            if (conectar()) {
                Statement stt = conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
            return rs;

        } catch (Exception e) {
            System.out.println("Usuario y/o Contraseña no válidos");
        }
        return rs;
    }
}
