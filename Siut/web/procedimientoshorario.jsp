<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean id="bd" class="conexion.altas" scope="page"></jsp:useBean>
<jsp:useBean id="bdc" class="conexion.conectar" scope="page"></jsp:useBean>
<jsp:useBean id="bdb" class="conexion.bajas" scope="page"></jsp:useBean>
<jsp:useBean id="bdcon" class="conexion.consultas" scope="page"></jsp:useBean>
<jsp:useBean id="bdm" class="conexion.modificaciones" scope="page"></jsp:useBean>


<%

    int idcurso = Integer.parseInt(request.getParameter("mate"));
    int iddia = Integer.parseInt(request.getParameter("dia"));
    int idhora = Integer.parseInt(request.getParameter("hora"));
    int idprof = Integer.parseInt(request.getParameter("idprof"));
    int idhorario = Integer.parseInt(request.getParameter("idhorario"));
    int idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
    try {
        if (!bdm.ModificaHorario(idcurso, iddia, idhora, idprof, idhorario, idgrupo)) {
%>
<script>
    alert('Modificado correctamente');
    window.location = 'horariogrupo.jsp?idgru=<%=idgrupo%>';
</script>
<%
    }
%>
<script>
    alert('Dia y hora ocupados');
    window.location = 'horariogrupo.jsp?idgru=<%=idgrupo%>';
</script>
<%
    } catch (Exception ex) {
        out.print(ex);
    }
%>