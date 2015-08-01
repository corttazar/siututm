<%-- 
    Document   : updateprof
    Created on : 26/06/2015, 01:21:14 AM
    Author     : Tony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="bd" class="conexion.altas" scope="page"></jsp:useBean>
<jsp:useBean id="bdc" class="conexion.conectar" scope="page"></jsp:useBean>
<jsp:useBean id="bdb" class="conexion.bajas" scope="page"></jsp:useBean>
<jsp:useBean id="bdcon" class="conexion.consultas" scope="page"></jsp:useBean>
<jsp:useBean id="bdm" class="conexion.modificaciones" scope="page"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">
        <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
            <title> SIUT | UTM </title>
            <link rel="shortcut icon" href="images/logosiutico.png" type="image/png" />

            <link href="css/font-awesome.css" rel="stylesheet">
            <link href="css/simple-line-icons.css" rel="stylesheet">
            <link href="css/jquery-ui.css" rel="stylesheet">
            <link href="css/datepicker.css" rel="stylesheet">
            <link href="css/bootstrap.css" rel="stylesheet">
            <link href="css/app-blue.css" rel="stylesheet">     
            <link href="css/fileinput.min.css" rel="stylesheet">
            <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
            <script language="javascript">
               
                function modificardatos()
                        {
                            
                            $.ajax
                            ({
                                type: "POST",
                                url: "procedimientos.jsp",
                                data: "&procedimiento=ModificarInformacion&"+$("#fr_datos").serialize() ,
                                success: function(respuesta)
                                {

                                   alert(respuesta);

                                }});
                            
                        }   
            </script>
        </head>
        <body class="notransition">
               <%
             //------------------------VALIDACIÓN	DE	LA	SESION--------------------------------------
            String usu = "";
            String tipo = "";
            String id = "";
            HttpSession sesionX = request.getSession();
            if(sesionX.getAttribute("perfil")== null){
             %>
             <script>
            alert('Necesita estar registrado');
            window.location = 'index.html';
        </script>
        <% }else{
                usu = (String)sesionX.getAttribute("usuario");
                tipo = (String)sesionX.getAttribute("perfil");
                id = (String)sesionX.getAttribute("id");
                out.print("<center> Bienvenido:<font color='#F0C'>"+usu+"</font > Perfil:<font color ='#F0C'>"+tipo+"</font><a href='salir.jsp'>|---Salir---|</a ></center>");
            //------------------------------TERMINA	VALIDACION	DE	SESION------------------------------
            }
        %>
        <div id="header">
            <div class="logo">
                <a href="index.html">
                    <img src="images/logosiut5.png" alt="">
                </a>
            </div>
            <a href="#" class="navHandler"><span class="fa fa-bars"></span></a>
            <div class="headerUserWraper">
                <a href="#" class="userHandler dropdown-toggle" data-toggle="dropdown"><span class="icon-user"></span><span class="counter">5</span></a>
                <a href="#" class="headerUser dropdown-toggle" data-toggle="dropdown">
                    <img class="avatar headerAvatar pull-left" src="images/avatar-1.png" alt="Antonio Cortazar">
                    <div class="userTop pull-left">
                        <span class="headerUserName">Antonio Cortazar</span> <span class="fa fa-angle-down"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
                <div class="dropdown-menu pull-right userMenu" role="menu">
                    <div class="mobAvatar">
                        <img class="avatar mobAvatarImg" src="images/avatar-1.png" alt="Antonio Cortazar">
                        <div class="mobAvatarName">Antonio Cortazar</div>
                    </div>
                    <ul>
                        <li><a href="#"><span class="icon-settings"></span>Ajustes</a></li>
                        <li><a href="profile.html"><span class="icon-user"></span>Perfil</a></li>
                        <li><a href="#"><span class="icon-bell"></span>Notificaciones <span class="badge pull-right bg-red">5</span></a></li>
                        <li class="divider"></li>
                        <li><a href="#"><span class="icon-power"></span>Salir</a></li>
                    </ul>
                </div>
            </div>
            <a href="#" class="mapHandler"><span class="icon-map"></span></a>
            <div class="clearfix"></div>
        </div>

        <!-- Left Side Navigation -->

        <div id="leftSide">
            <nav class="leftNav scrollable">
                 <ul>
                    <li class="hasSub">
                        <a href="#"><span class="navIcon icon-user"></span><span class="navLabel">Profesores</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li><a href="addprofe.jsp" >Registrar</a></li>
                            <li><a href="buscaprof.jsp">Consultar</a></li>
                        </ul>
                    </li>
                    <li class="hasSub">
                        <a href="#"><span class="navIcon icon-book-open"></span><span class="navLabel">Materias</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li><a href="addmat.jsp" >Registrar</a></li>
                            <li><a href="buscamat.jsp">Consultar</a></li>
                        </ul>
                    </li>
                    <li class="hasSub">
                        <a href="#"><span class="navIcon icon-users"></span><span class="navLabel">Grupos</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li><a href="addgrup.jsp" >Registrar</a></li>
                            <li><a href="buscagrup.jsp" >Consultar</a></li>
                        </ul>
                    </li>
                    <li class="hasSub">
                        <a href="#"><span class="navIcon icon-link"></span><span class="navLabel">Cursos</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li><a href="addcurso.jsp" >Registrar</a></li>
                            <li><a href="buscarcur.jsp" >Consultar</a></li>
                        </ul>
                    </li>
                    <li class="hasSub">
                        <a href="#"><span class="navIcon icon-notebook"></span><span class="navLabel">Reportes</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li><a href="" data-toggle="modal" data-target="#notificacion">Carga Horaria</a></li>
                            <li><a href="" data-toggle="modal" data-target="#notificacion">Materias</a></li>
                            <li><a href="" data-toggle="modal" data-target="#notificacion">Oferta Académica</a></li>
                        </ul>
                    </li>
                    <li class="hasSub">
                        <a href="cargardatos.jsp"><span class="navIcon icon-link"></span><span class="navLabel">Datos</span><span class="fa fa-angle-left arrowRight"></span></a>
                    </li>
                    <li><a href="#" data-toggle="modal" data-target="#contacto"><span class="navIcon icon-bubbles"></span><span class="navLabel">Contacto</span></a>
                    </li>
                </ul>
            </nav>
        </div>
        <!-- Content -->

        <div id="wrapper">
            <%
                String idd = request.getParameter("idd");
            %>

            <%
                try {
                    ResultSet rs = bdcon.consulpersonas("personas", "idpersona", idd);

                    if (!rs.next()) {
                        out.print("No se encontraron usuarios registrados");

                    } else {
            %>

            <%
                do {
            %>


            <div id="content" class="mob-max">
                <div class="singleTop whiteBg">
                    <div class="row mb20">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pb20">
                            <div class="row">

                                <div class="col-xs-6">
                                    <div class="profile-card">
                                        <div class="pc-avatar"><img src="images/avatar-1.png" alt="avatar"></div>
                                        <div class="pc-name"><%=rs.getString(2)%> <%=rs.getString(3)%></div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <form role="form" id="fr_datos">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label>Identificador</label>
                                        <input type="text" class="form-control" name="id" value="<%=rs.getString(1)%>" disabled="">
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label>Nombre(s)</label>
                                        <input type="text" class="form-control" name="nombre" value="<%=rs.getString(2)%>" autofocus>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label>Apellido Paterno</label>
                                        <input type="text" class="form-control" name="appaterno" value="<%=rs.getString(3)%>">
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-">
                                    <div class="form-group">
                                        <label>Apellido Materno</label>
                                        <input type="text" class="form-control" name="apmaterno" value="<%=rs.getString(4)%>">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label>Título</label>
                                        <input type="text" class="form-control" name="titulo" value="<%=rs.getString(5)%>">
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <div class="btn-group">
                                        <label>Tipo de Profesor</label>
                                        <div class="clearfix"></div>
                                        <a href="#" data-toggle="dropdown" class="btn btn-default dropdown-toggle">
                                            <span class="dropdown-label">Seleccione uno</span>&nbsp;&nbsp;&nbsp;<span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu dropdown-select">
                                            <li><input type="radio" name="tipoprof" value="1"><a href="#">Profesor de Tiempo Completo</a></li>
                                            <li><input type="radio" name="tipoprof" value="2"><a href="#">Profesor de Asignatura</a></li>
                                            <li><input type="radio" name="tipoprof" value="3"><a href="#">Técnico Académico</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <h4>Dirección</h4>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Calle" name="calle" value="<%=rs.getString(7)%>">
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-1 col-lg-1">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Número" name="numero" value="<%=rs.getString(8)%>">
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Colonia" name="colonia" value="<%=rs.getString(9)%>">
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-1 col-lg-1">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="C. P." name="cp" value="<%=rs.getString(10)%>">
                                    </div>
                                </div>

                                <div class="btn-group">
                                    <div class="clearfix"></div>
                                    <a href="#" data-toggle="dropdown" class="btn btn-default dropdown-toggle">
                                        <span class="dropdown-label"><%=rs.getString(13)%></span>&nbsp;&nbsp;&nbsp;<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-select">
                                        <li><input type="radio" name="edo" value="1"><a href="#">Michoacán</a></li>
                                        <li><input type="radio" name="edo" value="2"><a href="#">Colima</a></li>
                                        <li><input type="radio" name="edo" value="3"><a href="#">Jalisco</a></li>
                                    </ul>
                                </div>


                                <div class="btn-group">
                                    <div class="clearfix"></div>
                                    <a href="#" data-toggle="dropdown" class="btn btn-default dropdown-toggle">
                                        <span class="dropdown-label">Municipio</span>&nbsp;&nbsp;&nbsp;<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-select">
                                        <li><input type="radio" name="mpio" value="1"><a href="#">Morelia</a></li>
                                        <li><input type="radio" name="mpio" value="2"><a href="#">Zitacuaro</a></li>
                                        <li><input type="radio" name="mpio" value="3"><a href="#">Zacapu</a></li>
                                    </ul>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label>Fecha de Nacimiento</label>
                                        <input type="text" class="form-control" id="datepicker" name="fechanac">
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                                    <div class="form-group">
                                        <label>CURP</label>
                                        <input type="text" class="form-control" name="curp" value="<%=rs.getString(13)%>">
                                    </div>
                                </div>
                            </div>
                            <h4>Contacto</h4>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <input type="tel" class="form-control" placeholder="Teléfono" name="telefono" value="<%=rs.getString(15)%>">
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <input type="tel" class="form-control" placeholder="Celular" name="celular" value="<%=rs.getString(16)%>">
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <input type="email" class="form-control" placeholder="Correo Electrónico"  name="correo" value="<%=rs.getString(17)%>">
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <input type="button" class="btn btn-blue btn-lg" onclick="modificardatos()" value="Modificar">
                            </div>
                        </form>
                    </div>
                </div>

            </div>
                                    
            <%
                        } while (rs.next());
                    }
                } catch (Exception e) {
                    out.print("Error al consultar" + e);

                }
            %> 

        </div>

        <script src="js/json2.js"></script>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/underscore.js"></script>
        <script src="js/moment-2.5.1.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery-ui-touch-punch.js"></script>
        <script src="js/jquery.placeholder.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery.touchSwipe.min.js"></script>
        <script src="js/jquery.slimscroll.min.js"></script>
        <script src="js/jquery.visible.js"></script>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=true&amp;libraries=geometry&amp;libraries=places" type="text/javascript"></script>
        <script src="js/infobox.js"></script>
        <script src="js/clndr.js"></script>
        <script src="js/jquery.tagsinput.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/fileinput.min.js"></script>
        <script src="js/app.js"></script>
        <script src="js/calendar.js"></script>
    </body>
</html>