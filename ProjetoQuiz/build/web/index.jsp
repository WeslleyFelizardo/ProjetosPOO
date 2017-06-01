<%-- 
    Document   : index
    Created on : 13/05/2017, 09:32:22
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.modelo.Quiz"%>
<%@page import="br.com.fatecpg.modelo.Question"%>
<%@page import="java.util.ArrayList"%>
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

        <%@include file="WEB-INF/JSPF/header.jspf" %>

        <header>
            <div class="header-content">
                <div class="header-content-inner">
                    <h1 id="homeHeading">PROJETO 05 POO - QUIZ - GRUPO 1</h1>
                    <hr>
                    <p>Criar aplicação WEB de QUIZ, tema livre com 10 questões aleatórias.
                        As questões devem estar declaradas em atributos estáticos na classe, 
                        deve haver um contorle de sessão de usuários (não precisa de senha)e 
                        os usuários deverão ser armazenados em memória (ArrayList ou HashMap)</p>
                    <a href="#" class="btn btn-primary btn-xl page-scroll" data-toggle="modal" data-target="#myModal" style="font-size: 40px">Iniciar Quiz</a>
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
                        <h4 class="modal-title" id="myModalLabel">Informe os dados para iniciar o quiz</h4>
                    </div>
                    <div class="modal-body">
                        <form action="ControladorQuizServlet" method="post">
                            <input type="hidden" name="question" value="1"/>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Nome</label>
                                <input type="text" name="nome" class="form-control" id="exampleInputEmail1" placeholder="Nome" required="">
                            </div>

                            <div class="input-group">
                                <span class="input-group-addon">
                                    <input name="escolha" type="checkbox" value="Matematica"checked aria-label="...">
                                </span>
                                <input readonly type="text" value="Matemática" class="form-control" aria-label="...">
                            </div><!-- /input-group -->
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <input name="escolha" type="checkbox" value="Ingles" checked aria-label="...">
                                </span>
                                <input readonly type="text" value="Inglês" class="form-control" aria-label="...">
                            </div><!-- /input-group -->
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <input name="escolha" type="checkbox" value="Futebol" checked aria-label="...">
                                </span>
                                <input readonly type="text" value="Futebol" class="form-control" aria-label="...">
                            </div><!-- /input-group -->
                            <br>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Começar</button>
                            </div>
                        </form>
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

    </body>

</html>
