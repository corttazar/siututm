<%-- 
    Document   : procedimientosgrup.jsp
    Created on : 15/07/2015, 10:42:13 AM
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
        String grado = request.getParameter("grado");
        String grupo = request.getParameter("grupo");
        String idcarrera = request.getParameter("idcarrera");
        String turno = request.getParameter("turno");


        try {
            if (bd.GuardarGrupo(grado, grupo, idcarrera, turno)) {
                out.print("Datos Almacenados Satisfactoriamente");
            } else {
                out.print("Error al Almacenar el grupo");
            }
        } catch (Exception ex) {
            out.print(ex);
        }

    }

    ///////////////////////////////////////
    if (procedmiento.equalsIgnoreCase("MostrarLista")) {
        ResultSet rs = null;
        String tabla = "<div class='row'>"
                + "<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>"
                + "    <div class='table-overflow'>"
                + "        <table class='table'>"
                + "            <thead>"
                + "                <tr>"
                + "                    <th>No.</th>"
                + "                    <th>Grupo</th>"
                + "                    <th>Turno</th>"
                + "                    <th>Materia</th>"
                + "                    <th>&nbsp;</th>"
                + "                </tr>";

        try {
            rs = bdcon.consulgrupo();
            int k = 0;
            while (rs.next()) {
                k++;
                tabla = tabla + "            </thead>"
                        + "            <tbody class='table'>"
                        + "                <tr>"
                        + "                    <td><span class='userName'>" + k + "</span></td>"
                        + "                    <td><span class='userName'>" + rs.getObject(5) + "</span></td>"
                        + "                    <td>" + rs.getObject(2) + " " + rs.getObject(3) + " " + rs.getObject(4) + "</td>"
                        + "                    <td><span class='label label-success'>" + rs.getObject(20) + "</span></td>"
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

    ///////////////////////////////////////////////
    if (procedmiento.equalsIgnoreCase("modificarRegistro")) {
        String v1 = request.getParameter("valor");
        String v2 = request.getParameter("v2");
        String v3 = request.getParameter("v3");
        String DATOS = "";

        DATOS = "<strong>IDENTIFICACION:</strong>" + v1 + "<BR/>"
                + "<strong>NOMBRES:</strong>" + v1 + "<BR/>"
                + "<strong>APELLIDOS:</strong>" + v1 + "<BR/>"
                + "<h4 style='color:red;'>No se encontraron datos al respecto.</h4>";

        out.print(DATOS);

    }

    //////////////////////////////////////
    if (procedmiento.equalsIgnoreCase("MostrarListaAvanzada")) {
        String valor = request.getParameter("valor");
        ResultSet rs = null;
        if (valor.equalsIgnoreCase("") || valor.equalsIgnoreCase(null)) {
            rs = bdcon.consulgrupo();
        }
        String tabla = "<div class='row'>"
                + "<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>"
                + "    <div class='table-overflow'>"
                + "        <table class='table'>"
                + "            <thead>"
                + "                <tr>"
                + "                    <th>No.</th>"
                + "                    <th>Grupo</th>"
                + "                    <th>Turno</th>"
                + "                    <th>Materia</th>"
                + "                    <th>&nbsp;</th>"
                + "                </tr>";
        try {
            rs = bdcon.consulgrupo();
            int k = 0;
            while (rs.next()) {
                k++;
                tabla = tabla + "            </thead>"
                        + "            <tbody class='table'>"
                        + "                <tr>"
                        + "                    <td><span class='userName'>" + k + "</span></td>"
                        + "                    <td>" + rs.getObject(3) + " " + rs.getObject(2) + "</td>"
                        + "                    <td><span class='userName'>" + rs.getObject(4) + "</span></td>"
                        + "                    <td><span class='label label-success'>" + rs.getObject(7) + "</span></td>"
                        + "                    <td>"
                        + "                        <div class='btn-group'>"
                        + "                            <a class='btn btn-xs btn-round btn-o btn-green dropdown-toggle' data-toggle='dropdown'><span class='fa fa-pencil'></span> Acciones</a>"
                        + "                            <ul class='dropdown-menu pull-right' role='menu'>"
                        + "                                <li><a href='#'>Modificar</a></li>"
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