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

            if (bdb.Borrarpersona(Integer.parseInt(valor))) {
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
        String nombre = request.getParameter("nombre");
        String appaterno = request.getParameter("appaterno");
        String apmaterno = request.getParameter("apmaterno");
        String titulo = request.getParameter("titulo");
        String tipoprof = request.getParameter("tipoprof");
        String calle = request.getParameter("calle");
        String numero = request.getParameter("numero");
        String colonia = request.getParameter("colonia");
        String cp = request.getParameter("cp");
        String edo = request.getParameter("edo");
        String mpio = request.getParameter("mpio");
        String curp = request.getParameter("curp");
        String foto = request.getParameter("foto");
        String telefono = request.getParameter("telefono");
        String celular = request.getParameter("celular");
        String correo = request.getParameter("correo");
        String fechanac = request.getParameter("fechanac");

        try {
            if (bd.GuardarPersona(nombre, appaterno, apmaterno, titulo,
                    tipoprof,
                    calle, numero, colonia, cp, edo, mpio, curp, foto,
                    telefono, celular, correo, fechanac)) {
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
        String nombre = request.getParameter("nombre");
        String appaterno = request.getParameter("appaterno");
        String apmaterno = request.getParameter("apmaterno");
        String titulo = request.getParameter("titulo");
        int tipoprof = Integer.parseInt(request.getParameter("tipoprof"));
        String calle = request.getParameter("calle");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String colonia = request.getParameter("colonia");
        int cp = Integer.parseInt(request.getParameter("cp"));
        int edo = Integer.parseInt(request.getParameter("edo"));
        int mpio = Integer.parseInt(request.getParameter("mpio"));
        String curp = request.getParameter("curp");
        int telefono = Integer.parseInt(request.getParameter("telefono"));
        int celular = Integer.parseInt(request.getParameter("celular"));
        String correo = request.getParameter("correo");
        String fechanac = request.getParameter("fechanac");
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            if (bdm.ModificaPersona(nombre, appaterno, apmaterno, titulo,
                    tipoprof,
                    calle, numero, colonia, cp, edo, mpio, curp,
                    telefono, celular, correo, fechanac, id)) {
                out.print("Datos Modificados");
            } else {
                out.print("Error al Modificar");
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
                + "                    <th>Titulo</th>"
                + "                    <th>Nombre</th>"
                + "                    <th>Tipo</th>"
                + "                    <th>&nbsp;</th>"
                + "                </tr>";

        try {
            rs = bdcon.consulpersonas("personas", "nombres", "%");
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
            rs = bdcon.consulpersonas("personas", "nombres", "%");
        }
        String tabla = "<div class='row'>"
                + "<div class='col-xs-12 col-sm-12 col-md-12 col-lg-6'>"
                + "    <div class='table-overflow'>"
                + "        <table class='table'>"
                + "            <thead>"
                + "                <tr>"
                + "                    <th>No.</th>"
                + "                    <th>Titulo</th>"
                + "                    <th>Nombre</th>"
                + "                    <th>Tipo</th>"
                + "                    <th>&nbsp;</th>"
                + "                </tr>";
        try {
            rs = bdcon.consulpersonas("personas", "nombres", valor);
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
                        + "                                <li><a href='updateprof.jsp?id=" + rs.getObject(1) + "'>Modificar</a></li>"
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