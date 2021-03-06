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

    public ResultSet consulpersonass(String A, String B, String C) {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM " + A + " p \n"
                    + "                    inner join tipos t \n"
                    + "                    on p.idtipo = t.idtipo \n"
                    + "                    where p." + B + " \n"
                    + "                    like '%" + C + "%' \n"
                    + "                    or p.apmaterno  like '%" + C + "%' \n"
                    + "                    or p.appaterno  like '%" + C + "%'";
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

    public ResultSet consulpersonas(String C) {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM personas p \n"
                    + "inner join tipos t \n"
                    + "on p.idtipo = t.idtipo \n"
                    + "inner join estados e\n"
                    + "on e.idestado = p.idestado\n"
                    + "inner join municipios m\n"
                    + "on p.idmunicipio = m.idmunicipio and m.idestado = e.idestado\n"
                    + "where p.idpersona = " + C + " ";
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
            String sql = "select m.materia, g.grado, g.grupo, g.turno, c.idcurso\n"
                    + "from  cursos c\n"
                    + "inner join materias m\n"
                    + "on c.idmateria = m.idmateria\n"
                    + "inner join grupos g\n"
                    + "on g.idgrupo = c.idgrupo\n"
                    + "where c.idperiodo = 21  and c.idpersona is null ";
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
                    + "on g.idcarreradivision = c.idcarrera";
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

    public ResultSet consulgrupodispobible(String idcarrera) {
        ResultSet rs = null;
        try {
            String sql = "select * from grupos g\n"
                    + "inner join carrerasdivision cd\n"
                    + "on g.idcarreradivision = cd.idcarreradivision\n"
                    + "inner join carreras c\n"
                    + "on c.idcarrera = cd.idcarrera and c.idcarrera = " + idcarrera + "\n"
                    + "inner join divisiones d\n"
                    + "on d.iddivision = cd.iddivision";
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

    public ResultSet horariogrupo(String idgrupo) {
        ResultSet rs = null;
        try {
            String sql = "select m.materia, p.titulo, p.nombres, p.appaterno, p.apmaterno,\n"
                    + "                    c.idcurso \n"
                    + "                    from horarios h\n"
                    + "                    inner join cursos c\n"
                    + "                    on h.idcurso = c.idcurso\n"
                    + "                    inner join materias m\n"
                    + "                    on c.idmateria = m.idmateria\n"
                    + "                    inner join grupos g\n"
                    + "                    on g.idgrupo = c.idgrupo\n"
                    + "                    inner join personas p\n"
                    + "                    on p.idpersona = c.idpersona\n"
                    + "                    where c.idgrupo = " + idgrupo + "";
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

    public ResultSet horariogrupoocup(String idgrupo) {
        ResultSet rs = null;
        try {
            String sql = "select p.nombres, p.appaterno, p.apmaterno, p.titulo, m.materia, d.dia, hr.horainicio, hr.horafin, m.idmateria, \n"
                    + "(hr.horafin - hr.horainicio) as horastomadas, g.turno, c.idcurso, h.idhorario \n"
                    + "from horarios h\n"
                    + "inner join cursos c\n"
                    + "on h.idcurso = c.idcurso\n"
                    + "inner join DIASSEMANA d\n"
                    + "on d.iddia = h.iddia\n"
                    + "inner join horas hr\n"
                    + "on hr.idhora = h.idhora\n"
                    + "inner join materias m\n"
                    + "on c.idmateria = m.idmateria\n"
                    + "inner join grupos g\n"
                    + "on g.idgrupo = c.idgrupo\n"
                    + "inner join personas p\n"
                    + "on p.idpersona = c.idpersona\n"
                    + "where c.idgrupo = " + idgrupo + "";
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

    public ResultSet horariogrupodisponible(String idgrupo) {
        ResultSet rs = null;
        try {
            String sql = "select m.materia, d.dia, hr.horainicio, hr.horafin, m.idmateria, "
                    + "(hr.horafin - hr.horainicio) as horastomadas, g.turno, c.idcurso, h.idhorario \n"
                    + "from horarios h\n"
                    + "inner join cursos c\n"
                    + "on h.idcurso = c.idcurso\n"
                    + "inner join DIASSEMANA d\n"
                    + "on d.iddia = h.iddia\n"
                    + "inner join horas hr\n"
                    + "on hr.idhora = h.idhora\n"
                    + "inner join materias m\n"
                    + "on c.idmateria = m.idmateria\n"
                    + "inner join grupos g\n"
                    + "on g.idgrupo = c.idgrupo\n"
                    + "where c.idgrupo = " + idgrupo + " and c.idpersona is null";
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

    public ResultSet consuldias(String turno) {
        ResultSet rs = null;
        try {
            String sql = null;
            switch (turno) {
                case "Matutino":
                    sql = "SELECT * FROM diassemana where iddia < 7 order by iddia";
                    break;
                case "Vespertino":
                    sql = "SELECT * FROM diassemana where iddia < 7 order by iddia";
                    break;
                case "Mixto":
                    sql = "select * from diassemana where iddia >= 5 and iddia < 7";
                    break;
            }
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

    public ResultSet consul1hora(String turno) {
        ResultSet rs = null;
        try {
            String sql = null;
            switch (turno) {
                case "Matutino":
                    sql = "select * from horas where (idhora >= 1 and idhora <=8) order by horainicio";
                    break;
                case "Vespertino":
                    sql = "select * from horas where (idhora >= 6 and idhora <=13) order by horainicio";
                    break;
                case "Mixto":
                    sql = "select * from horas where (idhora >= 1 and idhora <=13) order by horainicio";
                    break;
            }
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

    public ResultSet consulturno() {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM (select * from INDICEPROFESOR \n"
                    + "where tomocarga = 0\n"
                    + "order by calif desc)\n"
                    + "WHERE rownum <= 1";
            if (con.conectar()) {
                System.out.println("Query: " + sql);
                Statement stt = con.conexion.createStatement();
                rs = stt.executeQuery(sql);
            }
        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }
        return rs;
    }

    public boolean consulturno1(int id) {
        ResultSet rs = null;
        try {
            String sql = "select * from INDICEPROFESOR \n"
                    + "where tomocarga = 1  and idpersona = " + id + "";
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
            System.out.println("Error al consultar: " + e);
        }
        return false;
    }
}
