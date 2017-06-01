<%-- 
    Document   : maintenanceQuestions
    Created on : 27/05/2017, 06:02:20
    Author     : Cleide
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.modelo.Question"%>
<%@page import="br.com.fatecpg.modelo.Player"%>
<%@page import="br.com.fatecpg.modelo.Category"%>
<%@page import="br.com.fatecpg.dao.AlternativeDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Manutenção de Questão</title>

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
    <% 
        //Gson gson = new Gson();
        ArrayList<Question> questions = (ArrayList<Question>) request.getAttribute("questions");
        ArrayList<Category> categorys = (ArrayList<Category>) request.getAttribute("categorys");
    %>
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%= ((Player)request.getSession().getAttribute("userCurrent")).getName() %> <span class="caret"></span></a>
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
                    <!--h1 id="homeHeading">Ranking</h1-->

                    <div class="panel panel-default">


                        <div class="panel-heading">



                            <h2 class="">
                                <div class="row">
                                    <div class="col-md-11">
                                        Manutenção de Questões
                                    </div>
                                    <div class="col-md-1">
                                        <a href="" class="page-scroll btn btn-primary" data-toggle="modal" data-target="#newModal">
                                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 
                                        </a>
                                    </div>
                                </div>
                            </h2>


                        </div>
                        <div class="panel-body">
                            <table class="table text-danger">
                                <tr>
                                    <td>Id</td>
                                    <td>Descrição</td>
                                    <td>Tipo</td>
                                    <td>Ação</td>
                                </tr>
                                <% for(Question question : questions) { %>
                                <tr>
                                    <td><%= question.getId() %></td>
                                    <td><%= question.getDescription() %></td>
                                    <td><%= question.getCategory().getName() %></td>
                                    <td>
                                        <a id="editar" href="#" class="page-scroll" data-toggle="modal" data-target="#exampleModal"
                                           data-whateverquestion="<%= question.getDescription() %>"
                                           data-whateveraquestionid="<%=question.getId()%>"
                                           data-whatevercategory="<%=question.getCategory().getName()%>"
                                           ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>

                                    </td>
                                    <td><a href="" class="page-scroll" data-toggle="modal" data-target="#deleteModal"
                                           data-whateverid="<%= question.getId() %>"><span class="glyphicon glyphicon-trash" aria-hidden="true"
                                                                                        ></span></a></td>
                                </tr>

                                <% } %>
                            </table>
                            
                        </div>

                    </div>

                </div>
            </div>
        </header>
        <div id="teste" class="hidden"><%= (String)request.getAttribute("jsonAlternatives") %></div>
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">Deseja exluir a questão</h4>
                    </div>

                    <div class="modal-footer">
                        <form>
                            <input type="hidden" name="delete" id="questionId"/>
                            <a class="btn btn-default" data-dismiss="modal">Cancelar</a>
                            <button class="btn btn-success">Confirmar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>                

        <div class="modal fade" data-backdrop="static" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title" id="exampleModalLabel">Atualizar questão</h4>
                    </div>
                    <div class="modal-body">
                        <form action="ControladorQuestionServlet" method="post" >
                            <div class="form-group">
                                <label for="descriptionUpdate" class="control-label">Questão</label>
                                <input type="text" class="form-control" id="descriptionUpdate" required="" name="descriptionUpdate">
                            </div>
                            <div class="form-group">
                                <label for="categorys" class="control-label">Categoria</label>
                                <select class="form-control" name="categorys" id="categorys">
                                    <option>Selecione...</option>
                                    <% for (Category category : categorys) { %>
                                    <option value="<%= category.getId() %>"><%= category.getName() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="recipientalternative" class="control-label">Alternativas</label><br>
                                <% for (int i = 0; i < 4; i++) { %>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <input id="alternativeCorrectUpdate" type="radio" aria-label="..." name="alternativeCorrectUpdate" required="">
                                    </span>
                                    <input id="descriptionAlternativeUpdate" name="descriptionAlternativeUpdate" type="text" class="form-control" aria-label="..." required="">
                                </div><!-- /input-group -->
                                <input type="hidden" name="ids" id="ids" />
                                <% } %>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="respostaCerta" id="respostaCerta" />
                                <!--button type="button" class="btn btn-default" data-dismiss="modal">Close</button-->
                                <input type="hidden" name="action" value="update" />
                                <input type="hidden" name="idQuestion" id="idQuestion" />
                                <a href="ControladorQuestionServlet?action=getAll" id="" class="btn btn-default">Fechar</a>
                                <button id="updateButton" type="submit" class="btn btn-success">Atualizar</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">Nova questão</h4>
                    </div>
                    <div class="modal-body">
                        <form action="ControladorQuestionServlet" method="post" >
                            <div class="form-group">
                                <label for="description" class="control-label">Questão</label>
                                <input type="text" class="form-control" id="description" required="" name="description">
                            </div>
                            <div class="form-group">
                                <label for="categorys" class="control-label">Categoria</label>
                                <select class="form-control" name="category">
                                    <option>Selecione...</option>
                                    <% for (Category category : categorys) { %>
                                    <option value="<%= category.getId() %>"><%= category.getName() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="recipientalternative" class="control-label">Alternativas</label><br>
                                <% for (int i = 0; i < 4; i++) { %>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <input id="corrects" type="radio" aria-label="..." name="alternativeCorrect" required="">
                                    </span>
                                    <input id="descriptionAlternative" name="descriptionAlternative" type="text" class="form-control" aria-label="..." required="">
                                </div><!-- /input-group -->
                                <% } %>
                            </div>
                            <div class="modal-footer">
                                <!--button type="button" class="btn btn-default" data-dismiss="modal">Close</button-->
                                <input type="hidden" name="action" value="newQuestion" />
                                <button type="submit" class="btn btn-success">Cadastrar</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

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
        var vetor = new Array();
        $('#exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal

            var modal = $(this)
            //console.log(recipient["name"]);
            modal.find('.modal-title').text();
            var recipientquestion = button.data('whateverquestion')
            var recipientcategory = button.data('whatevercategory')
            var id = button.data('whateveraquestionid')
            //alert(id);
            //$("input[name=a]").val('teste');
            $('#idQuestion').val(id)
            $('#descriptionUpdate').val(recipientquestion)
            var alernatives = $('#teste').text();

            var arrayJson = JSON.parse(alernatives);
            arrayJson.forEach(function (alternative) {
                if (alternative.idQuestion == id)
                    vetor.push(alternative);
            })
            var i = -1;
            $('input[name="descriptionAlternativeUpdate"]').each(function () {
                i++;
                $(this).val(vetor[i].description);
            });

            i = -1;
            $('input[name="ids"]').each(function () {
                i++;
                $(this).val(vetor[i].id);
            });

            i = -1;
            $('input[name="alternativeCorrectUpdate"]').each(function () {
                i++;
                //alert(vetor[i].id);
                $(this).value = vetor[i].id;
            });
            i = -1;
            $('input[name="alternativeCorrectUpdate"]').each(function () {
                i++;
                if ($(this).value = vetor[i].id) {
                    if (vetor[i].isCorrect == 1) {
                        //alert(vetor[i].description);
                        $(this).attr('checked', true);
                    }
                }
            });

            // Guarda em opt o elemento que retornar do filtro que vai testar entre as
            // options possíveis
            var opt = $('#categorys option').filter(function () {
                //alert($(this).text().trim());
                // testa entre as options qual delas tem o mesmo conteúdo que o desejado
                return $(this).text().trim() == recipientcategory.trim();
            });
            //alert(opt.text());
            // Redefine o atributo do elemento encontrado pra selecionado.
            opt.attr('selected', true);
            //$('#updateButton').onclick(function () {

            //})

        })
        $('#updateButton').click(function () {
            var k = -1;
            $('input[name="alternativeCorrectUpdate"]').each(function () {
                k++;
                // testa entre as options qual delas tem o mesmo conteúdo que o desejado
                if ($(this).is(':checked')) {
                    $('#respostaCerta').val(vetor[k].id)
                }
                //return $(this).text().trim() == recipientcategory.trim();
            });

        })

    </script>

    <script>
        $('#deleteModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            //var recipient = button.data('whatever') // Extract info from data-* attributes
            var recipientId = button.data('whateverid')

            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this)
            //console.log(recipient["name"]);
            modal.find('.modal-title').text();
            // alert("delete");
            $('#questionId').val(recipientId)

            // categorys.forEach(function (item) {
            //   $('select').append('<option>' + item + '</option>');
            //});
            //}
        })
    </script>

    <script>
        $("input[name=alternativeCorrect]").change(function () { // na mudanca do radio button
            //var freteResultado = pptMotorista.val(); // Pega o valor do pptMotorista.
            var descriptionAlternatives = $("input:text[name='descriptionAlternative']")
            ///var correct = $("#corrects");
            var radioButtons = $("input:radio[name='alternativeCorrect']");
            var selectedIndex = radioButtons.index(radioButtons.filter(':checked'))
            //alert(descriptionAlternatives[2].value);
            //  alert(this.value + descriptionAlternatives[0].value);
            for (var i = 0; i < 4; i++) {
                if (i == selectedIndex) {
                    this.value = descriptionAlternatives[i].value;
                }
            }
            //alert(this.value);
            //freteMotorista.val(freteResultado); // Mostra no campo freteMorotista o resultado do calculo
        });
    </script>
</html>
