<%-- 
    Document   : index
    Created on : 13/05/2017, 09:32:22
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.modelo.Quiz"%>
<%@page import="java.util.Collections"%>
<%@page import="br.com.fatecpg.modelo.Player"%>
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

    <body id="page-top">

        <%@include file="WEB-INF/JSPF/header.jspf" %>
       
        <header>
            <div class="header-content">
                <div class="header-content-inner">
                    <!--h1 id="homeHeading">Ranking</h1-->

                    <div class="panel panel-default">


                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <h3>Ranking</h3>
                            </h3>
                        </div>
                        <div class="panel-body">
                            <table class="table text-danger">
                                <tr>
                                    <td>Posição</td>
                                    <td>Nome</td>
                                    <td>Média</td>
                                    <td>Detalhes</td>
                                </tr>
                                <%
                                    Collections.sort(Quiz.ranking);
                                    for(Player player : Quiz.ranking){ %>
                                <tr>
                                    <td><%= Quiz.ranking.indexOf(player) + 1 %>°</td>
                                    <td><%= player.getName() %></td>
                                    <td><%= player.sumPoints(player.getPoints()) / player.getPoints().size() %></td>
                                    <td>


                                        <a href="#" class="btn btn-primary btn-sm page-scroll" data-toggle="modal" data-target="#exampleModal" data-whatever="<%= player.getPoints() %>"
                                           data-whatevernome="<%= player.getName() %>">
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

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <!--div class="form-group">
                                <label for="recipient-name" class="control-label">Recipient:</label>
                                <input type="text" class="form-control" id="recipient-name">
                            </div-->
                            <ol id="lista" class="">
                                
                            </ol>
                                
                           
                        </form>
                    </div>
                    <div class="modal-footer">
                        <!--button type="button" class="btn btn-default" data-dismiss="modal">Close</button-->
                        <button type="button" class="btn btn-primary"  data-dismiss="modal">Fechar</button>
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
                var recipient = button.data('whatever') // Extract info from data-* attributes
                var recipientnome = button.data('whatevernome')
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                //console.log(recipient["name"]);
                modal.find('.modal-title').text('Pontuações do jogador: ' + recipientnome)
                $("#lista").empty();
                for (var i = 0; i < recipient.length; i++) {
                $('<li>').text(recipient[i] + "  %").appendTo('#lista');
                //console.log(recipient[i]);
                    //modal.find('.modal-body input').val(recipient[i])
                }
            })
        </script>
    </body>

</html>
