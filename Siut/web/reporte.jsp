<%-- 
    Document   : reporte
    Created on : 21/08/2015, 04:26:07 AM
    Author     : Tony
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<% /*Parametros para realizar la conexión*/ 
Connection conexion; 
Class.forName("oracle.jdbc.OracleDriver").newInstance(); 
conexion = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cargahorariadb", "root");
/*Establecemos la ruta del reporte*/ 
File reportFile = new File(application.getRealPath("/reportes/materias.jasper")); 
/* No enviamos parámetros porque nuestro reporte no los necesita asi que escriba 
cualquier cadena de texto ya que solo seguiremos el formato del método runReportToPdf*/ 
Map parameters = new HashMap(); parameters.put("Nombre_parametro", "Valor_Parametro"); 
/*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/ 
byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), null, conexion); 
/*Indicamos que la respuesta va a ser en formato PDF*/ response.setContentType("application/pdf");
response.setContentLength(bytes.length); ServletOutputStream ouputStream = response.getOutputStream(); 
ouputStream.write(bytes, 0, bytes.length); /*Limpiamos y cerramos flujos de salida*/ ouputStream.flush(); 
ouputStream.close();


/**try
 {
 if (fnc.conectar()){

 JasperReport reporte = JasperCompileManager.compileReport("C:\\Documents and
Settings\\@nel\\Escritorio\\bdOracle\\web\\reporteAccesorios.jrxml");
 byte[] bytes = JasperRunManager.runReportToPdf(reporte,null,fnc.conexion);
 response.setContentType("application/pdf");
 response.setContentLength(bytes.length);
 ServletOutputStream ouputStream = response.getOutputStream();
 ouputStream.write(bytes, 0, bytes.length);
 ouputStream.flush();
 ouputStream.close();
 }
 }
 catch (Exception e)
 {
 out.print("No es posible cargar el archivo" + e);*/

%>
