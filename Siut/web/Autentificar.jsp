<%-- 
    Document   : Autentificar
    Created on : 28/07/2015, 10:53:12 PM
    Author     : Issa Servín
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page	import="java.sql.*"%>
        <jsp:useBean id="base" class="conexion.conectar" scope="page"></jsp:useBean>
        <title>JSP Page</title>
    </head>
    <body>
    <%
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("pass");
    %>
    <%
        try {
            ResultSet mrc = base.usr(usuario, clave);
            if (!mrc.next()) {
                %>
        <script>
            alert('Datos incorrectos');
            window.location = 'index.html';
        </script>
        <%      
            } else {
                String perfil = mrc.getString(3);
                String usu = mrc.getString(1);
                String nombre = mrc.getString(5);
                String appa = mrc.getString(6);
                String titu = mrc.getString(7);
                String id =  mrc.getString(4);
                String idtipo =  mrc.getString(8);
                String foto = mrc.getString(9);
                int horasadmin = 40;
                int horasptc = 40;
                int horasprof = 30;
                int horastec = 20;
                String idcarrera = mrc.getString(10);

                
                if (perfil.equals("Administrador")) {
                    HttpSession sesionX = request.getSession();
                    sesionX.setAttribute("usuario", usuario);
                    sesionX.setAttribute("perfil", perfil);
                    sesionX.setAttribute("id", id);
                    sesionX.setAttribute("nombre", nombre);
                    sesionX.setAttribute("appa", appa);
                    sesionX.setAttribute("titu", titu);
                    sesionX.setAttribute("idtipo", idtipo);
                    sesionX.setAttribute("foto", foto);
                    sesionX.setAttribute("idcarrera", idcarrera);
                    sesionX.setAttribute("horasadmin", horasadmin);
                    response.sendRedirect("admin.jsp");
                    
                    
                } else if (perfil.equals("Técnico Académico")) {
                    HttpSession sesionX = request.getSession();
                    sesionX.setAttribute("usuario", usuario);
                    sesionX.setAttribute("perfil", perfil);
                    sesionX.setAttribute("id", id);
                    sesionX.setAttribute("nombre", nombre);
                    sesionX.setAttribute("appa", appa);
                    sesionX.setAttribute("titu", titu);
                    sesionX.setAttribute("idtipo", idtipo);
                    sesionX.setAttribute("foto", foto);
                    sesionX.setAttribute("idcarrera", idcarrera);
                    sesionX.setAttribute("horastec", horastec);
                    response.sendRedirect("admin.jsp");
                    
                } else if (perfil.equals("Profesor de Tiempo Completo")) {
                    HttpSession sesionX = request.getSession();
                    sesionX.setAttribute("usuario", usuario);
                    sesionX.setAttribute("perfil", perfil);
                    sesionX.setAttribute("id", id);
                    sesionX.setAttribute("nombre", nombre);
                    sesionX.setAttribute("appa", appa);
                    sesionX.setAttribute("titu", titu);
                    sesionX.setAttribute("idtipo", idtipo);
                    sesionX.setAttribute("foto", foto);
                    sesionX.setAttribute("horasptc", horasptc);
                    sesionX.setAttribute("idcarrera", idcarrera);
                    response.sendRedirect("admin.jsp");
                }
                 else if (perfil.equals("Profesor de Asignatura")) {
                    HttpSession sesionX = request.getSession();
                    sesionX.setAttribute("usuario", usuario);
                    sesionX.setAttribute("perfil", perfil);
                    sesionX.setAttribute("id", id);
                    sesionX.setAttribute("nombre", nombre);
                    sesionX.setAttribute("appa", appa);
                    sesionX.setAttribute("titu", titu);
                    sesionX.setAttribute("idtipo", idtipo);
                    sesionX.setAttribute("foto", foto);
                    sesionX.setAttribute("horasprof", horasprof);
                    sesionX.setAttribute("idcarrera", idcarrera);
                    response.sendRedirect("admin.jsp");
                }
            }
        } catch (Exception e) {
           out.print("Error al consultar:	"	+	e);
        }
    %>
    
    </body>
</html>
