﻿<!DOCTYPE html>
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
    </head>
    <body class="notransition" oncontextmenu="return false">
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
                    <img class="avatar headerAvatar pull-left" src="images/avatar-1.png" alt="John Smith">
                    <div class="userTop pull-left">
                        <span class="headerUserName">Antonio Cortazar</span> <span class="fa fa-angle-down"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
                <div class="dropdown-menu pull-right userMenu" role="menu">
                    <div class="mobAvatar">
                        <img class="avatar mobAvatarImg" src="images/avatar-1.png" alt="John Smith">
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

        <!-- Menú de navegación -->

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
                            <li><a href="buscagrup.html" >Consultar</a></li>
                        </ul>
                    </li>
                    <li class="hasSub">
                        <a href="#"><span class="navIcon icon-link"></span><span class="navLabel">Cursos</span><span class="fa fa-angle-left arrowRight"></span></a>
                        <ul>
                            <li><a href="addcurso.jsp" >Registrar</a></li>
                            <li><a href="#" >Consultar</a></li>
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
        <a href="">Cargar Profesores</a>

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