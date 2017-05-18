<%-- 
    Document   : perguntas
    Created on : 12/05/2017, 01:00:57
    Author     : Cleide
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.modelo.Quiz"%>
<%@page import="br.com.fatecpg.modelo.Question"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

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

        <%     
            
            Question questionCurrent = (Question) request.getAttribute("question");  
        %>
        <!--div class="alert alert-danger"></div-->

        <!--form>
            <input name="teste" type="hidden"/>
            <button type="submit">Apagar</button>
        </form-->
        <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand page-scroll" href="index.jsp"><%= request.getSession().getAttribute("namePlayer").toString() %></a>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand page-scroll"></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a class="page-scroll" href="#about">Ranking</a>
                        </li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <header>
            <div class="header-content">
                <div class="header-content-inner">
                    <div class="panel panel-default">
                        <div class="row">
                            <div class="col-md-10"></div>

                            <div id="sessao" class="col-md-2 text-danger">
                                Questão <%= request.getAttribute("countQuestion").toString() %>
                            </div>
                        </div>
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <h3><%= questionCurrent.getQuestion() %></h3>
                            </h3>
                        </div>
                        <div class="panel-body">
                            <form method="post" action="ControladorQuizServlet">
                                <% for (int i = 0; i < 4; i++) { %>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <input type="radio" aria-label="..." value="<%= questionCurrent.getAlternatives()[i] %>" name="answer" checked="">
                                            </span>
                                            <input type="text" value="<%= questionCurrent.getAlternatives()[i] %>"  class="form-control" aria-label="...">
                                        </div><!-- /input-group -->
                                    </div><!-- /.col-lg-6 -->
                                </div><!-- /.row -->
                                <br>
                                <% } %>


                                <input name="question" type="hidden" value="<%=Integer.parseInt(request.getParameter("question"))+1 %>" />

                                <button class="btn btn-success">Próximo</button>

                            </form>
                        </div>

                    </div>
                    <br>            
                </div>
            </div>
        </header>           
        <!--button onclick="redirectToNextQuestion()">teste</button-->
        <!--form action="perguntas.jsp">
            <input type="text" name="apagar" value=""/><br>
            <button type="submit">teste</button>
        </form-->
        <!--button onclick="startCountdown()">teste</button-->
        <!-- jQuery -->
        <!--script src="http://localhost:8084/ProjetoQuiz/Dependencias/vendor/jquery/jquery.min.js"></script-->
        <script src="vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
        <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

        <!-- Theme JavaScript -->
        <script src="js/creative.min.js"></script>
        <!--script src="js/cronometro.js"></script-->

    </body>

</html>

