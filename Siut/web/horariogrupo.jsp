<%-- 
    Document   : horario
    Created on : 5/08/2015, 02:51:38 AM
    Author     : Tony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="bdcon" class="conexion.consultas" scope="page"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">
        <head>
        <%
            ResultSet rs = null;
            //------------------------VALIDACIÓN	DE	LA	SESION--------------------------------------
            String usu = "";
            String tipo = "";
            String id = "";
            String nombre = "";
            String appa = "";
            String titu = "";
            String idtipo = "";
            String foto = "";
            String turno = "";
            int horasdisp = 0;
            String horasprof = "40";
            HttpSession sesionX = request.getSession();
            if (sesionX.getAttribute("perfil") == null) {
        %>
        <script>
            alert('Necesita estar registrado');
            window.location = 'index.html';
        </script>
        <% } else {
                usu = (String) sesionX.getAttribute("usuario");
                tipo = (String) sesionX.getAttribute("perfil");
                id = (String) sesionX.getAttribute("id");
                nombre = (String) sesionX.getAttribute("nombre");
                appa = (String) sesionX.getAttribute("appa");
                titu = (String) sesionX.getAttribute("titu");
                idtipo = (String) sesionX.getAttribute("idtipo");
                foto = (String) sesionX.getAttribute("foto");

                //------------------------------TERMINA	VALIDACION	DE	SESION------------------------------
            }
        %>
        <script language="JavaScript">
            switch (<%=idtipo%>) {
                case 21:
                    function muestra_oculta(id) {
                        //se obtiene el id

                        var el = document.getElementById(id);
                        el.style.display = 'block';
                    }
                    window.onload = function () {
                        muestra_oculta('contenido_a_mostrar');
                        muestra_oculta('contenido_a_mostrar2');
                        muestra_oculta('contenido_a_mostrar3');
                        muestra_oculta('contenido_a_mostrar4');
                        muestra_oculta('contenido_a_mostrar5');
                        muestra_oculta('cur_con');
                        muestra_oculta('cur_hor');
                        muestra_oculta('rep_car');
                        muestra_oculta('rep_mat');
                        muestra_oculta('contenido_a_mostrar6');
                    }
                    break;
                case 1:
                    function muestra_oculta(id) {
                        //se obtiene el id

                        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
                        el.style.display = 'block'; //damos un atributo display:none que oculta el div

                    }
                    window.onload = function () {/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
                        muestra_oculta('contenido_a_mostrar4');
                        muestra_oculta('contenido_a_mostrar5');
                        muestra_oculta('cur_con');
                        muestra_oculta('cur_hor');
                        muestra_oculta('rep_car');
                        muestra_oculta('rep_mat');
                        muestra_oculta('contenido_a_mostrar6');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */

                    }
                    break;
                case 2:
                    function muestra_oculta(id) {
                        //se obtiene el id

                        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
                        el.style.display = 'block'; //damos un atributo display:none que oculta el div

                    }
                    window.onload = function () {/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
                        muestra_oculta('contenido_a_mostrar4');
                        muestra_oculta('contenido_a_mostrar5');
                        muestra_oculta('cur_con');
                        muestra_oculta('cur_hor');
                        muestra_oculta('rep_car');
                        muestra_oculta('rep_mat');
                        muestra_oculta('contenido_a_mostrar6');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */

                    }
                    break;
                case 3:
                    function muestra_oculta(id) {
                        //se obtiene el id

                        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
                        el.style.display = 'block'; //damos un atributo display:none que oculta el div

                    }
                    window.onload = function () {/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
                        muestra_oculta('contenido_a_mostrar4');
                        muestra_oculta('contenido_a_mostrar5');
                        muestra_oculta('cur_con');
                        muestra_oculta('cur_hor');
                        muestra_oculta('rep_car');
                        muestra_oculta('rep_mat');
                        muestra_oculta('contenido_a_mostrar6');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */

                    }
                    break;
            }
        </script>
        <%
            String idgru = request.getParameter("idgru");
        %>
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
    </head>
    <body class="notransition" oncontextmenu="return false">

        <!-- Encabezado -->

        <div id="header">
            <div class="logo">
                <a href="index.html">
                    <img src="images/logosiut5.png">
                </a>
            </div>
            <a href="#" class="navHandler"><span class="fa fa-bars"></span></a>
            <div class="headerUserWraper">
                <a href="#" class="userHandler dropdown-toggle" data-toggle="dropdown"><span class="icon-user"></span><span class="counter">5</span></a>
                <a href="#" class="headerUser dropdown-toggle" data-toggle="dropdown">
                    <img class="avatar headerAvatar pull-left" src="<%=foto%>" alt="<%out.print(nombre + " " + appa);%>">
                    <div class="userTop pull-left"> 
                        <span class="headerUserName"><%out.print(titu + ". " + nombre + " " + appa);%></span> <span class="fa fa-angle-down"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
                <div class="dropdown-menu pull-right userMenu" role="menu">
                    <div class="mobAvatar">
                        <img class="avatar mobAvatarImg" src="<%=foto%>" alt="<%out.print(nombre + " " + appa);%>">
                        <div class="mobAvatarName"><%out.print(titu + ". " + nombre + " " + appa);%></div>
                    </div>
                    <ul>
                        <li><a href="#"><span class="icon-settings"></span>Ajustes</a></li>
                        <li><a href='updateprof.jsp?id=<%=id%>'><span class="icon-user"></span>Perfil</a></li>
                        <li><a href="#"><span class="icon-bell"></span>Notificacionesss <span class="badge pull-right bg-red">5</span></a></li>
                        <li class="divider"></li>
                        <li><a href="salir.jsp"><span class="icon-power"></span>Salir</a></li>
                    </ul>
                </div>
            </div>
            <a href="#" class="mapHandler"><span class="icon-map"></span></a>
            <div class="clearfix"></div>
        </div>

        <!-- Menú de navegación -->

        <div id="leftSide">
            <nav class="leftNav scrollable">
                <ul>
                    <li class="hasSub" id="contenido_a_mostrar" style="display:none">
                        <a href="#"><span class="navIcon icon-user"></span><span class="navLabel">Profesores</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li><a href="addprofe.jsp" >Registrar</a></li>
                            <li><a href="buscaprof.jsp">Consultar</a></li>
                        </ul>
                    </li>
                    <li class="hasSub" id="contenido_a_mostrar2" style="display:none">
                        <a href="#"><span class="navIcon icon-book-open"></span><span class="navLabel">Materias</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li><a href="addmat.jsp" >Registrar</a></li>
                            <li><a href="buscamat.jsp">Consultar</a></li>
                        </ul>
                    </li>
                    <li class="hasSub" id="contenido_a_mostrar3" style="display:none">
                        <a href="#"><span class="navIcon icon-users"></span><span class="navLabel">Grupos</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li><a href="addgrup.jsp" >Registrar</a></li>
                            <li><a href="buscagrup.jsp" >Consultar</a></li>
                        </ul>
                    </li>
                    <li class="hasSub" id="contenido_a_mostrar4" style="display:none">
                        <a href="#"><span class="navIcon icon-link"></span><span class="navLabel">Cursos</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li id="cur_reg" style="display:none"><a href="addcurso.jsp" >Registrar</a></li>
                            <li id="cur_con" style="display:none"><a href="buscarcur.jsp" >Consultar</a></li>
                            <li id="cur_hor" style="display:none"><a href="horario.jsp" >Horarios</a></li>
                        </ul>
                    </li>
                    <li class="hasSub" id="contenido_a_mostrar5" style="display:none">
                        <a href="#"><span class="navIcon icon-notebook"></span><span class="navLabel">Reportes</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li id="rep_car" style="display:none"><a href="" data-toggle="modal" data-target="#notificacion">Carga Horaria</a></li>
                            <li id="rep_mat" style="display:none"><a href="" data-toggle="modal" data-target="#notificacion">Materias</a></li>
                            <li id="rep_ofe" style="display:none"><a href="" data-toggle="modal" data-target="#notificacion">Oferta Académica</a></li>
                        </ul>
                    </li>
                    <li id="contenido_a_mostrar6" style="display:none"><a href="#" data-toggle="modal" data-target="#contacto"><span class="navIcon icon-bubbles"></span><span class="navLabel">Contacto</span></a>
                    </li>
                </ul>
            </nav>
        </div>

        <!-- Content -->
        <div id="wrapper">
            <div id="content" class="max">
                <div class="whiteBg">
                    <h4 class="text-green">Materias por Grupo</h4>
                    <%
                        try {
                            rs = bdcon.horariogrupo(idgru);

                            if (!rs.next()) {
                                out.print("No se encontraron materias registradas");

                            } else {
                    %>
                    <div class="row icons pb20" id="contenido_grupo">
                        <div class="col-sm-6">
                            <div class="tabsWidget">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="active"><a href="#properties" role="tab" data-toggle="tab">Asignadas</a></li>
                                    <li><a href="#users" role="tab" data-toggle="tab">Disponibles</a></li>
                                </ul>
                                <div class="tab-content tab-scroll">
                                    <div class="tab-pane fade in active" id="properties">
                                        <div class="notificationsWidget">
                                            <div class="notification">
                                                <%
                                                    do {
                                                %>
                                                <div class="time red">
                                                    <div class="timeBody hidden-xs"><%=rs.getString(1)%></div>
                                                    <div class="timeArrow hidden-xs"><span class="fa fa-caret-right"></span></div>
                                                    <div class="indicator"><span class="fa fa-circle-o"></span></div>
                                                    <div class="notifyArrow"><span class="fa fa-caret-left"></span></div>
                                                </div>
                                                <div class="notifyContent">
                                                    <div class="notifyBody">
                                                        <div class="notifyRound notifyRound-red fa fa-paper-plane-o"></div>
                                                        <div class="notify pull-left">
                                                            <div class="name"><%=rs.getString(2)%> <%=rs.getString(3)%> <%=rs.getString(4)%></div>
                                                            <div class="message"><%=rs.getString(6)%> <%=rs.getString(7)%>:00 - <%=rs.getString(8)%>:00</div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                                <%
                                                            } while (rs.next());
                                                        }
                                                    } catch (Exception e) {
                                                        out.print("Error al consultar: " + e);
                                                    }
                                                %>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>

                                    </div>
                                    <%
                                        try {
                                            rs = bdcon.horariogrupodisponible(idgru);

                                            if (!rs.next()) {
                                                out.print("No se encontraron materias disponibles");

                                            } else {
                                                horasdisp = (Integer.parseInt(horasprof) - rs.getInt(6));
                                                turno = rs.getString(7);
                                    %>
                                    <div class="tab-pane fade" id="users">
                                        <div class="tab-pane fade in active" id="properties">
                                            <div class="notificationsWidget">
                                                <div class="notification">
                                                    <%
                                                        do {
                                                    %>
                                                    <div class="time blue">
                                                        <div class="timeBody hidden-xs"><%=rs.getString(1)%></div>
                                                        <div class="timeArrow hidden-xs"><span class="fa fa-caret-right"></span></div>
                                                        <div class="indicator"><span class="fa fa-circle-o"></span></div>
                                                        <div class="notifyArrow"><span class="fa fa-caret-left"></span></div>
                                                    </div>
                                                    <div class="notifyContent"  data-toggle="modal" data-target="#tomarmateria">
                                                        <div class="notifyBody">
                                                            <div class="notifyRound notifyRound-blue fa fa-paper-plane-o"></div>
                                                            <div class="notify pull-left">
                                                                <div class="name">Sin Profesor</div>
                                                                <div class="message"><%=rs.getString(2)%> <%=rs.getString(3)%>:00 - <%=rs.getString(4)%>:00</div>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                    <%
                                                                } while (rs.next());
                                                            }
                                                        } catch (Exception e) {
                                                            out.print("Error al consultar: " + e);
                                                        }
                                                    %>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>  

                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="modal fade" id="tomarmateria" role="dialog" aria-labelledby="contactLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="contactLabel">¿Desea impartir alguna materia?</h4>
                        <h1 class="modal-title" id="contactLabel">Tiene <%=horasdisp%> horas disponibles</h1>
                    </div>
                    <div class="modal-body">

                        <form class="contactForm" role="form" method="post" action="procedimientoshorario.jsp">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="btn-group">
                                    <div class="clearfix"></div>
                                    <a href="#" data-toggle="dropdown" class="btn btn-default dropdown-toggle">
                                        <span class="dropdown-label">Seleccione una materia</span>&nbsp;&nbsp;&nbsp;<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-select">
                                        <%
                                            try {
                                                ResultSet rss = bdcon.horariogrupodisponible(idgru);

                                                if (!rss.next()) {
                                                    out.print("No se encontraron usuarios registrados");

                                                } else {
                                                    do {

                                        %>
                                        <li><input type="radio" name="mate" value="<%=rss.getString(8)%>"><a href="#"><%=rss.getString(1)%></a></li>
                                        <input name="idhorario" style="display: none;" value="<%=rss.getString(9)%>">
                                        <input name="idprof" style="display: none;" value="<%=id%>">
                                        <input name="idgrupo" style="display: none;" value="<%=idgru%>">
                                        <%
                                                    } while (rss.next());
                                                }
                                            } catch (Exception e) {
                                                out.print("Error al consultar los profesores: " + e);
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="btn-group">
                                    <div class="clearfix"></div>
                                    <a href="#" data-toggle="dropdown" class="btn btn-default dropdown-toggle">
                                        <span class="dropdown-label">Seleccione un día</span>&nbsp;&nbsp;&nbsp;<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-select">
                                        <%
                                            try {
                                                ResultSet rss = bdcon.consuldias(turno);

                                                if (!rss.next()) {
                                                    out.print("No se encontraron dias registrados");

                                                } else {
                                                    do {

                                        %>
                                        <li><input type="radio" name="dia" value="<%=rss.getString(1)%>"><a href="#"><%=rss.getString(2)%></a></li>
                                            <%
                                                        } while (rss.next());
                                                    }
                                                } catch (Exception e) {
                                                    out.print("Error al consultar los dias: " + e);
                                                }
                                            %>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                <div class="btn-group">
                                    <div class="clearfix"></div>
                                    <a href="#" data-toggle="dropdown" class="btn btn-default dropdown-toggle">
                                        <span class="dropdown-label">Seleccione una hora</span>&nbsp;&nbsp;&nbsp;<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-select">
                                        <%
                                            try {
                                                ResultSet rss = bdcon.consul1hora(turno);

                                                if (!rss.next()) {
                                                    out.print("No se encontraron horas registradas");

                                                } else {
                                                    do {

                                        %>
                                        <li><input type="radio" name="hora" value="<%=rss.getString(1)%>"><a href="#"><%=rss.getString(2)%>:00 - <%=rss.getString(3)%>:00 </a></li>
                                            <%
                                                        } while (rss.next());
                                                    }
                                                } catch (Exception e) {
                                                    out.print("Error al consultar las horas: " + e);
                                                }
                                            %>
                                    </ul>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="#" data-dismiss="modal" class="btn btn-round btn-o btn-gray">Cancelar</a>
                                <input type="submit" id="enviarlog" value="Aceptar" name="enviarlog" class="btn btn-lg btn-blue">
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade" id="notificacion" role="dialog" aria-labelledby="contactLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="siut.corttazar.com / addprof.html">×</button>
                        <h4 class="modal-title" id="contactLabel">Notificación</h4>
                    </div>
                    <div class="modal-body">
                        <b>Módulo en construcción</b>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="contacto" role="dialog" aria-labelledby="contactLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="contactLabel">Contactar Agente</h4>
                    </div>
                    <div class="modal-body">

                        <form class="contactForm" method="post" action="contacto.php">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 cfItem">
                                    <input id="nombre" type="text" name="nombre" placeholder="Nombre" class="form-control" required>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 cfItem">
                                    <input  id="email" type="email" name="email" placeholder="Correo Electónico" class="form-control" required>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 cfItem">
                                    <input id="asunto" type="text" name="asunto"  placeholder="Asunto" class="form-control" required>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 cfItem">
                                    <textarea id="mensaje" name="mensaje" placeholder="Mensaje" rows="3" class="form-control" required></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="#" data-dismiss="modal" class="btn btn-round btn-o btn-gray">Cerrar</a>
                                <input class="btn btn-round btn-green" id="submit" type="submit" name="submit" value="Enviar mensaje">

                            </div>
                        </form>
                    </div>

                </div>
            </div>
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

        <script src="http://maps.googleapis.com/maps/api/js?sensor=true&amp;libraries=geometry&amp;libraries=places" type="text/javascript"></script>
        <script src="js/jquery.visible.js"></script>
        <script src="js/infobox.js"></script>
        <script src="js/clndr.js"></script>
        <script src="js/jquery.tagsinput.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/fileinput.min.js"></script>
        <script src="js/app.js"></script>
        <script src="js/calendar.js"></script>
    </body>
</html>