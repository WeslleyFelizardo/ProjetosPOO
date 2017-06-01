<%-- 
    Document   : maintenanceUsers
    Created on : 28/05/2017, 22:29:59
    Author     : Cleide
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.modelo.Player"%>
<%@page import="br.com.fatecpg.modelo.Role"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Manutenção de Player</title>

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
       ArrayList<Role> roles = (ArrayList<Role>) request.getAttribute("roles");
       ArrayList<Player> players = (ArrayList<Player>) request.getAttribute("players");
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
                            <a class="page-scroll" href="ControladorQuizServlet?action=ranking" >Ranking</a>
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
                                        Manutenção de Jogador
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
                                    <td>Nome</td>
                                    <td>Email</td>
                                   
                                    <td>Permissão</td>
                                    <td></td>
                                </tr>
                                <% for (Player player : players) {%>
                                <tr>
                                    <td><%= player.getId() %></td>
                                    <td><%= player.getName() %></td>
                                    <td><%= player.getEmail() %></td>
                                   
                                    <td><%= player.getRole().getName() %></td>
                                    <td>
                                        <a href="#" class="page-scroll" data-toggle="modal" data-target="#exampleModal"         
                                           data-whateverid="<%= player.getId() %>"
                                           data-whateverrole="<%= player.getRole().getName() %>"
                                           data-whatevername="<%= player.getName() %>"
                                           data-whateveremail="<%= player.getEmail() %>"
                                           data-whateverpassword="<%= player.getPassword() %>"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    </td>
                                    <td><a href="" class="page-scroll" data-toggle="modal" data-target="#deleteModal"
                                           data-whateverid="<%= player.getId() %>"><span class="glyphicon glyphicon-trash" aria-hidden="true"
                                                                                      ></span></a></td>
                                </tr>
                                <% }  %>
                            </table>
                        </div>

                    </div>

                </div>
            </div>
        </header>
        <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">Nova jogador</h4>
                    </div>
                    <div class="modal-body">

                        <form action="ControladorPlayerAdminServlet" method="post" >
                            <input type="hidden" name="action" value="register" />
                            <div class="form-group">
                                <label for="name" class="control-label">Nome</label>
                                <input type="text" name="name" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
                            </div>
                            <div class="form-group">
                                <label for="categorys" class="control-label">Email</label>
                                <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
                            </div>
                            <div class="form-group">
                                <label for="categorys" class="control-label">Senha</label>
                                <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="categorys" class="control-label">Confirmar senha</label>
                                <input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
                            </div>

                            <div class="form-group">
                                <label for="roles" class="control-label">Permissão</label>
                                <select class="form-control" name="role">
                                    <option>Selecione...</option>
                                    <% for (Role role : roles) { %>
                                    <option value="<%= role.getId() %>"><%= role.getName() %></option>
                                    <% } %>
                                </select>
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

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">Atualizar questão</h4>
                    </div>
                    <div class="modal-body">
                        <form action="ControladorPlayerAdminServlet" method="post">
                            <input type="hidden" name="action" value="update" />
                            <input type="hidden" name="idPlayer" id="idPlayer" />
                            <div class="form-group">
                                <label for="name" class="control-label">Nome</label>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                            <div class="form-group">
                                <label for="email" class="control-label">Email</label>
                                <input type="email" name="mail" class="form-control" id="mail">
                            </div>
                            <div class="form-group">
                                <label for="passwordCurrent" class="control-label">Senha</label>
                                <input type="password" class="form-control" name="passwordCurrent" id="passwordCurrent" readonly="">
                            </div>
                            <div class="form-group">
                                <label for="newPassword" class="control-label">Nova senha</label>
                                <input type="text" name="newPassword" class="form-control" id="newPassword">
                            </div>
                            <div class="form-group">
                                <label for="roles" class="control-label">Permissão</label>
                                <select class="form-control" name="roles" id="roles">
                                    <option>Selecione...</option>
                                    <% for (Role role : roles) { %>
                                    <option value="<%= role.getId() %>"><%= role.getName() %></option>
                                    <% } %>
                                </select>
                            </div>
                           
                            <div class="modal-footer">
                                <a href="ControladorPlayerAdminServlet?action=getAll" class="btn btn-default">Close</a>
                                <button type="submit" class="btn btn-success">Atualizar</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>


        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">Deseja exluir o player ?</h4>
                    </div>

                    <div class="modal-footer">
                        <form action="ControladorPlayerAdminServlet">
                            <input type="hidden" name="delete" id="questionId"/>
                            <a class="btn btn-default" data-dismiss="modal">Cancelar</a>
                            <button class="btn btn-success">Confirmar</button>
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

        <script>
            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                //var recipient = button.data('whatever') // Extract info from data-* attributes
                var recipientid = button.data('whateverid')
                var recipientrole = button.data('whateverrole')
                var recipientname = button.data('whatevername')
                var recipientemail = button.data('whateveremail')
                var recipientpassword = button.data('whateverpassword')
                //var alternatives = button.data('whateveralternatives')
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                //console.log(recipient["name"]);
                modal.find('.modal-title').text();
                
                $('#idPlayer').val(recipientid)
                $('#name').val(recipientname)
                $('#mail').val(recipientemail)
                $('#passwordCurrent').val(recipientpassword)
                //alert(recipientrole);
                //$(document).ready(function () {
                // Armazena nome do mês que quer selecionar
                var role = recipientrole;
                // Guarda em opt o elemento que retornar do filtro que vai testar entre as
                // options possíveis
                var opt = $('#roles option').filter(function () {
                    // testa entre as options qual delas tem o mesmo conteúdo que o desejado
                    return $(this).text().trim() === role;
                });

                // Redefine o atributo do elemento encontrado pra selecionado.
                opt.attr('selected', true);
                //});

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
    </body>
</html>
