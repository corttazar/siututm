<%-- 
    Document   : procedimientoscur
    Created on : 13/07/2015, 11:45:33 AM
    Author     : Tony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean id="bd" class="conexion.altas" scope="page"></jsp:useBean>
<jsp:useBean id="bdc" class="conexion.conectar" scope="page"></jsp:useBean>
<jsp:useBean id="bdb" class="conexion.bajas" scope="page"></jsp:useBean>
<jsp:useBean id="bdcon" class="conexion.consultas" scope="page"></jsp:useBean>
<jsp:useBean id="bdm" class="conexion.modificaciones" scope="page"></jsp:useBean>


<%

    String procedmiento = request.getParameter("procedimiento");

    /////////////////////////////////////////////////////
    if (procedmiento.equalsIgnoreCase("GuardarInformacion")) {
        String prof = request.getParameter("prof");
        String mate = request.getParameter("mate");
        String grupo = request.getParameter("grupo");
        String labora = request.getParameter("laborat");
        String periodo = request.getParameter("periodo");

        try {
            if (bd.GuardarCurso(prof, mate, grupo, labora, periodo)) {
                out.print("Datos Almacenados Satisfactoriamente");
            } else {
                out.print("Error al Almacenar");
            }
        } catch (Exception ex) {
            out.print(ex);
        }

    }


    ///////////////////////////////////////
    if (procedmiento.equalsIgnoreCase("MostrarLista")) {
        ResultSet rs = null;
        String tabla = "<div class='row'>"
                + "<div class='col-xs-12 col-sm-12 col-md-12 col-lg-6'>"
                + "    <div class='table-overflow'>"
                + "        <table class='table'>"
                + "            <thead>"
                + "                <tr>"
                + "                    <th>No.</th>"
                + "                    <th>Profesor</th>"
                + "                    <th>Materia</th>"
                + "                    <th>Grupo</th>"
                + "                    <th>Laboratorio</th>"
                + "                    <th>&nbsp;</th>"
                + "                </tr>";

        try {
            rs = bdcon.consulcursos();
            int k = 0;
            while (rs.next()) {
                k++;
                tabla = tabla + "            </thead>"
                        + "            <tbody class='table'>"
                        + "                <tr>"
                        + "                    <td><span class='userName'>" + k + "</span></td>"
                        + "                    <td>" + rs.getObject(1) + " " + rs.getObject(2) + " " + rs.getObject(3) + " "+rs.getObject(4)+"</td>"
                        + "                    <td>"+ rs.getObject(5) +"</td>"
                        + "                    <td>"+ rs.getObject(6) +" "+rs.getObject(7)+"</td>"
                         + "                    <td>"+ rs.getObject(9) +" "+rs.getObject(8)+" "+rs.getObject(10)+"</td>"
                        + "                    <td>"
                        + "                        <div class='btn-group'>"
                        + "                            <a class='btn btn-xs btn-round btn-o btn-green dropdown-toggle' data-toggle='dropdown'><span class='fa fa-pencil'></span> Acciones</a>"
                        + "                            <ul class='dropdown-menu pull-right' role='menu'>"
                        + "                                <li><a href='#' >Modificar</a></li>"
                        + "                                <li><a href='#' value='Eliminar' onclick='#'>Eliminar</a></li>"
                        + "                            </ul>"
                        + "                        </div>"
                        + "                    </td>"
                        + "                </tr>"
                        + "            </tbody>";
            }
            tabla = tabla + "        </table>"
                    + "    </div>"
                    + "</div>"
                    + "</div>";
            out.print(tabla);
        } catch (Exception ex) {
            out.print(ex);
        }
    }

    ///////////////////////////////////////////////


    //////////////////////////////////////
    if (procedmiento.equalsIgnoreCase("MostrarListaAvanzada")) {
        String valor = request.getParameter("valor");
        ResultSet rs = null;
        if (valor.equalsIgnoreCase("") || valor.equalsIgnoreCase(null)) {
            rs = bdcon.consulcursos();
        }
        String tabla = "<div class='row'>"
                + "<div class='col-xs-12 col-sm-12 col-md-12 col-lg-6'>"
                + "    <div class='table-overflow'>"
                + "        <table class='table'>"
                + "            <thead>"
                + "                <tr>"
                + "                    <th>No.</th>"
                   + "                    <th>Profesor</th>"
                + "                    <th>Materia</th>"
                + "                    <th>Grupo</th>"
                + "                    <th>Laboratorio</th>"
                + "                    <th>&nbsp;</th>"
                + "                </tr>";
        try {
            rs = bdcon.consulcursos();
            int k = 0;
            while (rs.next()) {
                k++;
                tabla = tabla + "            </thead>"
                        + "            <tbody class='table'>"
                        + "                <tr>"
                        + "                    <td><span class='userName'>" + k + "</span></td>"
                        + "                    <td>" + rs.getObject(1) + " " + rs.getObject(2) + " " + rs.getObject(3) + " "+rs.getObject(4)+"</td>"
                        + "                    <td>"+ rs.getObject(5) +"</td>"
                        + "                    <td>"+ rs.getObject(6) +" "+rs.getObject(7)+"</td>"
                         + "                    <td>"+ rs.getObject(9) +" "+rs.getObject(8)+" "+rs.getObject(10)+"</td>"
                        + "                    <td>"
                        + "                        <div class='btn-group'>"
                        + "                            <a class='btn btn-xs btn-round btn-o btn-green dropdown-toggle' data-toggle='dropdown'><span class='fa fa-pencil'></span> Acciones</a>"
                        + "                            <ul class='dropdown-menu pull-right' role='menu'>"
                        + "                                <li><a href='#'>Modificar</a></li>"
                        + "                                <li><a value='Eliminar' onclick='#'>Eliminar</a></li>"
                        + "                            </ul>"
                        + "                        </div>"
                        + "                    </td>"
                        + "                </tr>"
                        + "            </tbody>";
            }
            tabla = tabla + "        </table>"
                    + "    </div>"
                    + "</div>"
                    + "</div>";
            out.print(tabla);
        } catch (Exception ex) {
            out.print("Error al proy" + ex);
        }

    }

%>