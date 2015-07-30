<%-- 
    Document   : salir
    Created on : 28/07/2015, 11:10:31 PM
    Author     : Issa Servín
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@	page	session="true"	%>
        <%
            HttpSession sesionX = request.getSession();
            sesionX.invalidate();
        %>
        <jsp:forward	page="index.html"/>
    </body>
</html>
