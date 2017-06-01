<%-- 
    Document   : historic
    Created on : 27/05/2017, 04:56:18
    Author     : Cleide
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.modelo.Player"%>
<%@page import="br.com.fatecpg.modelo.Quiz"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Ranking</title>

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
    <body>
        <%@include file="WEB-INF/JSPF/header.jspf" %>

        <header>
            <div class="header-content">
                <div class="header-content-inner">
                    <!--h1 id="homeHeading">Ranking</h1-->

                    <div class="panel panel-default">


                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <h3>Seu histórico no quiz</h3>
                            </h3>
                        </div>
                        <div class="panel-body">
                            <table class="table text-danger">
                                <tr>
                                    <td>Pontuação</td>
                                    <td>Data</td>
                                    <td>Detalhes</td>
                                </tr>

                                <%
                                    Player player = (Player) request.getAttribute("historic");
                                    
                                    for(Quiz quiz : player.getQuiz()) {
                                %>

                                <tr>
                                    <td><%= quiz.getScore() %></td>
                                    <td><%= quiz.getDate() %></td>
                                    <td>
                                        <a href="#" class="page-scroll" data-toggle="modal" data-target="#details"
                                           data-whateverid="<%= quiz.getId() %>">

                                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                        </a>
                                    </td>

                                </tr>

                                <% } %>
                            </table>
                        </div>

                    </div>

                </div>
            </div>
        </header>
        <div id="teste" class="hidden"><%= (String)request.getAttribute("details") %></div>                    
        <div class="modal fade" id="details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">                      
                        <h4 class="modal-title" id="exampleModalLabel">
                            Detalhes do quiz
                        </h4>
                    </div>
                    <div class="modal-body">
                      
                        <ol id="lista" class="">
                            
                            <br>
                        </ol>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>         

        <%@include file="WEB-INF/JSPF/footer.jspf" %>
    </body>
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

        $('#details').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var details = $('#teste').text();
            var vetor = new Array();
            var id = button.data('whateverid')
            //alert(details);
            var modal = $(this)
            //console.log(recipient["name"]);
            modal.find('.modal-title').text();

            var arrayJson = JSON.parse(details);
            arrayJson.forEach(function (detail) {
                if (detail.idQuiz == id)
                    vetor.push(detail);
            })


            $("#lista").empty();
            for (var i = 0; i < vetor.length; i++) {
                $('<li>').text(vetor[i].question + " Resposta: " + vetor[i].answer).appendTo('#lista');
                $('<br>');
                //console.log(recipient[i]);
                //modal.find('.modal-body input').val(recipient[i])
            }

            //$('#questionId').val(recipientId)

        })
    </script>

</html>