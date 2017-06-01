<%-- 
    Document   : index
    Created on : 13/05/2017, 09:32:22
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.dao.CategoryDAO"%>
<%@page import="br.com.fatecpg.modelo.Category"%>
<%@page import="br.com.fatecpg.modelo.Player"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Quiz</title>

        <!-- Bootstrap Core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

        <!-- Plugin CSS -->
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

        <link href="css/style.css" rel="stylesheet">
        <!-- Theme CSS -->
        <link href="css/creative.min.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body id="page-top">
        <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand page-scroll" href="index.jsp">Quiz</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a class="page-scroll" href="ControladorQuizServlet?action=ranking">Ranking</a>
                        </li>
                        <% if (request.getSession().getAttribute("userCurrent") == null) { %>
                        <li>
                            <a href="" class="page-scroll" data-toggle="modal" data-target="#exampleModal"
                               >Autenticar-se</a>
                        </li>
                        <% } %>
                        <% if (request.getSession().getAttribute("userCurrent") != null) { %>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%= ((Player)request.getSession().getAttribute("userCurrent")).getName() %><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                
                                <% if (((Player)request.getSession().getAttribute("userCurrent")).getIdRole() == 1) { %>
                                <li><a href="ControladorQuestionServlet?action=getAll">Manutenção questions</a></li>
                                <li><a href="ControladorPlayerAdminServlet?action=getAll">Manutenção users</a></li>
                                <% } else { %>
                                <li><a href="ControladorPlayerServlet?action=historic">Histórico</a></li>
                                <% } %>
                                <li><a href="ControladorPlayerServlet?action=logOut">LogOut</a></li>
                                <!--li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">One more separated link</a></li!-->
                            </ul>
                        </li>
                        <% } %>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <header>
            <div class="header-content">
                <div class="header-content-inner">
                    <h1 id="homeHeading">PROJETO 03 POO - QUIZ</h1>
                    <hr>
                    <p>Esse é um sistema de quiz quue foi desenvolvido para testar seus conhecimentos
                    em diversas áreas, cadastre-se no sistema e começe a responder as quetões que são
                    geradas aleatóriamente pelo sistema.
                    </p>
                        <% if (request.getSession().getAttribute("userCurrent") != null) { %>
                    <a href="#" class="btn btn-primary btn-xl page-scroll" data-toggle="modal" data-target="#myModal" style="font-size: 40px">Iniciar Quiz</a>
                    <% } %>
                </div>
            </div>

        </header>
        <%@include file="WEB-INF/JSPF/footer.jspf" %>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Olá <%= request.getSession().getAttribute("userCurrent") != null ? ((Player)request.getSession().getAttribute("userCurrent")).getName() : ""%> preparado para o desafio? </h4>
                    </div>
                    <div class="modal-body">
                        <form action="ControladorQuizServlet" method="post">
                            <input type="hidden" name="question" value="1"/>
                           
                            <%
                                CategoryDAO categoryDAO = new CategoryDAO();
                                for (Category category : categoryDAO.getCategory()) {
                            %>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <input name="escolha" type="checkbox" value="<%= category.getId() %>"checked aria-label="...">
                                </span>
                                <input readonly type="text" value="<%= category.getName() %>" class="form-control" aria-label="...">
                            </div><!-- /input-group -->
                            <br>
                            <% } %>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Começar</button>
                            </div>
                        </form>
                    </div>


                </div>

            </div>

        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="#" class="active" id="login-form-link">Login</a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="#" id="register-form-link">Registrar-se</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" action="ControladorPlayerServlet" method="post" role="form" style="display: block;">
                                        <input type="hidden" name="action" value="logIn" />
                                        <div class="form-group">
                                            <input type="text" name="email" id="username" tabindex="1" class="form-control" placeholder="Email" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Senha">
                                        </div>
                                       
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Entrar">
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </form>
                                    <form method="post" id="register-form" action="ControladorPlayerServlet" role="form" style="display: none;">
                                        <input type="hidden" name="action" value="register" />
                                        <div class="form-group">
                                            <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Nome" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Senha">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirmar Senha">
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Cadastrar">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="http://localhost:8084/ProjetoQuiz/vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
        <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

        <!-- Theme JavaScript -->
        <script src="js/creative.min.js"></script>
        <script>
            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                //var recipient = button.data('whatever') // Extract info from data-* attributes
                // var recipientnome = button.data('whatevernome')
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                //console.log(recipient["name"]);
                //modal.find('.modal-title').text('Pontuações do jogador: ' + recipientnome)
                //$("#lista").empty();
                //for (var i = 0; i < recipient.length; i++) {
                //    $('<li>').text(recipient[i] + "  %").appendTo('#lista');
                //console.log(recipient[i]);
                //modal.find('.modal-body input').val(recipient[i])
                //}
            })

            $(function () {

                $('#login-form-link').click(function (e) {
                    $("#login-form").delay(100).fadeIn(100);
                    $("#register-form").fadeOut(100);
                    $('#register-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });
                $('#register-form-link').click(function (e) {
                    $("#register-form").delay(100).fadeIn(100);
                    $("#login-form").fadeOut(100);
                    $('#login-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });

            });

        </script>
    </body>

</html>
