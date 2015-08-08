<%-- 
    Document   : updateprof
    Created on : 26/06/2015, 01:21:14 AM
    Author     : Tony
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="bd" class="conexion.altas" scope="page"></jsp:useBean>
<jsp:useBean id="bdc" class="conexion.conectar" scope="page"></jsp:useBean>
<jsp:useBean id="bdb" class="conexion.bajas" scope="page"></jsp:useBean>
<jsp:useBean id="bdcon" class="conexion.consultas" scope="page"></jsp:useBean>
<jsp:useBean id="bdm" class="conexion.modificaciones" scope="page"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%
            //------------------------VALIDACIÓN	DE	LA	SESION--------------------------------------
            String usu = "";
            String tipo = "";
            String id = "";
            String nombre = "";
            String appa = "";
            String titu = "";
            String idtipo = "";
            String foto = "";
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
        <script language="javascript">
                $(document).ready(function () {

                    mostrarLista();


                });
                ///////////////////////////////////
                function modificardatos()
                        {
                            
                            $.ajax
                            ({
                                type: "POST",
                                url: "procedimientos.jsp",
                                data: "&procedimiento=Modificarcontrasena&"+$("#fr_datos").serialize() ,
                                success: function(respuesta)
                                {

                                   alert(respuesta);

                                }});
                            
                        }   
            </script>
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
                        <li><a href='updateprof.jsp?idd=<%=id%>'><span class="icon-user"></span>Perfil</a></li>
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
            <div id="content" class="mob-max">
                <div class="singleTop whiteBg">
                    <div class="row mb20">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pb20">
                            <div class="row">

                                <div class="col-xs-6">
                                    <div class="profile-card">
                                        <div class="pc-avatar"><img src="<%=foto%>" alt="avatar"></div>
                                        <div class="pc-name"><%=titu%> <%=nombre%> <%=appa%></div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <form role="form" id="fr_datos">
                            <h4>Modificar la contraseña</h4>
                            <div class="row">
                                
                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <label>Nueva Contrasñe</label>
                                        <input type="text" class="form-control" name="contrasena" value="" autofocus>
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