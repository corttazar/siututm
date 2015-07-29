<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean id="bd" class="conexion.altas" scope="page"></jsp:useBean>
<jsp:useBean id="bdc" class="conexion.conectar" scope="page"></jsp:useBean>
<jsp:useBean id="bdb" class="conexion.bajas" scope="page"></jsp:useBean>
<jsp:useBean id="bdcon" class="conexion.consultas" scope="page"></jsp:useBean>
<jsp:useBean id="bdm" class="conexion.modificaciones" scope="page"></jsp:useBean>


<%

    String procedmiento = request.getParameter("procedimiento");

    //////////////////////////////////////////////////////////7
    if (procedmiento.equalsIgnoreCase("eliminarRegistro")) {
        String valor = request.getParameter("valor");

        try {

            if (bdb.Borrarmateria(Integer.parseInt(valor))) {
                out.print("Registro Eliminado Satisfactoriamente");
            } else {
                out.print("Error al eliminar");
            }
        } catch (Exception ex) {
            out.print(ex);
        }

    }

    /////////////////////////////////////////////////////
    if (procedmiento.equalsIgnoreCase("GuardarInformacion")) {
        String mat = request.getParameter("materia");
        String numhrs = request.getParameter("numhrs");
        String hrslab = request.getParameter("hrslab");

        try {
            if (bd.GuardarMateria(mat, numhrs, hrslab)) {
                out.print("Datos Almacenados Satisfactoriamente");
            } else {
                out.print("Error al Almacenar");
            }
        } catch (Exception ex) {
            out.print(ex);
        }

    }
    ////////////////////////////////////////////////////MODIFICAR
    if (procedmiento.equalsIgnoreCase("ModificarInformacion")) {
        String nombre = request.getParameter("materia");
        int hrs = Integer.parseInt(request.getParameter("hrs"));
        int hrslab = Integer.parseInt(request.getParameter("hrslab"));
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            if (bdm.ModificaMateria(nombre, hrs, hrslab, id)) {
                out.print("Datos Modificados");
            } else {
                out.print("Error al Modificar");
            }
        } catch (Exception ex) {
            out.print(ex);
        }

    }else{
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
                + "                    <th>Materia</th>"
                + "                    <th>Horas en Aula</th>"
                + "                    <th>Horas de Laboratorio</th>"
                + "                    <th>&nbsp;</th>"
                + "                </tr>";

        try {
            rs = bdcon.consulmaterias("materias", "materia", "");
            int k = 0;
            while (rs.next()) {
                k++;
                tabla = tabla + "            </thead>"
                        + "            <tbody class='table'>"
                        + "                <tr>"
                        + "                    <td><span class='userName'>" + k + "</span></td>"
                        + "                    <td><span class='userName'>" + rs.getObject(2) + "</span></td>"
                        + "                    <td>" + rs.getObject(3) + "</td>"
                        + "                    <td><span class='label label-success'>" + rs.getObject(4) + "</span></td>"
                        + "                    <td>"
                        + "                        <div class='btn-group'>"
                        + "                            <a class='btn btn-xs btn-round btn-o btn-green dropdown-toggle' data-toggle='dropdown'><span class='fa fa-pencil'></span> Acciones</a>"
                        + "                            <ul class='dropdown-menu pull-right' role='menu'>"
                        + "                                <li><a href='#' >Modificar</a></li>"
                        + "                                <li><a href='#' value='Eliminar' onclick='eliminarRegistro(" + rs.getObject(1) + ")'>Eliminar</a></li>"
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

    //////////////////////////////////////
    if (procedmiento.equalsIgnoreCase("MostrarListaAvanzada")) {
        String valor = request.getParameter("valor");
        ResultSet rs = null;
        if (valor.equalsIgnoreCase("") || valor.equalsIgnoreCase(null)) {
            rs = bdcon.consulmaterias("materias", "materia", "%");
        }
        String tabla = "<div class='row'>"
                + "<div class='col-xs-12 col-sm-12 col-md-12 col-lg-6'>"
                + "    <div class='table-overflow'>"
                + "        <table class='table'>"
                + "            <thead>"
                + "                <tr>"
                + "                    <th>No.</th>"
                + "                    <th>Materia</th>"
                + "                    <th>Horas en Aula</th>"
                + "                    <th>Horas de Laboratorio</th>"
                + "                    <th>&nbsp;</th>"
                + "                </tr>";
        try {
            rs = bdcon.consulmaterias("materias", "materia", valor);
            int k = 0;
            while (rs.next()) {
                k++;
                tabla = tabla + "            </thead>"
                        + "            <tbody class='table'>"
                        + "                <tr>"
                        + "                    <td><span class='userName'>" + k + "</span></td>"
                        + "                    <td><span class='userName'>" + rs.getObject(2) + "</span></td>"
                        + "                    <td>" +rs.getString(3)+ "</td>"
                        + "                    <td><span class='label label-success'>" + rs.getObject(4) + "</span></td>"
                        + "                    <td>"
                        + "                        <div class='btn-group'>"
                        + "                            <a class='btn btn-xs btn-round btn-o btn-green dropdown-toggle' data-toggle='dropdown'><span class='fa fa-pencil'></span> Acciones</a>"
                        + "                            <ul class='dropdown-menu pull-right' role='menu'>"
                        + "                                <li><a href='updatemat.jsp?id=" + rs.getObject(1) + "'>Modificar</a></li>"
                        + "                                <li><a value='Eliminar' onclick='eliminarRegistro(" + rs.getObject(1) + ")'>Eliminar</a></li>"
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