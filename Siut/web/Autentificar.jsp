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
                out.print("Datos incorrectos!!");
            } else {
                String perfil = mrc.getString(3);
                String usu = mrc.getString(1);
              out.print	("Bienvenido " +usu);

                if (perfil.equals("profesor tiempo completo")) {
                    HttpSession sesionX = request.getSession();
                    sesionX.setAttribute("usuario", usuario);
                    sesionX.setAttribute("perfil", perfil);
                    sesionX.setAttribute("id", mrc.getString(4));
                    response.sendRedirect("admin.jsp");
                    
                    
                } else if (perfil.equals("OPERADOR")) {
                    HttpSession sesionX = request.getSession();
                    sesionX.setAttribute("usuario", usuario);
                    sesionX.setAttribute("perfil", perfil);
                    sesionX.setAttribute("id", mrc.getString(1));
                    response.sendRedirect("menu.jsp");
                } else if (perfil.equals("INVITADO")) {
                    HttpSession sesionX = request.getSession();
                    sesionX.setAttribute("Usuario", usuario);
                    sesionX.setAttribute("perfil", perfil);
                    sesionX.setAttribute("id", mrc.getString(1));
                    response.sendRedirect("menu.jsp");
                }
            }
        } catch (Exception e) {
           out.print("Error al consultar:	"	+	e);
        }
    %>
    
    </body>
</html>
