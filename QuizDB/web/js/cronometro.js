/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var id = 0;
var tempo = new Number();
// Tempo em segundos
tempo = 5;

function startCountdown() {

    // Se o tempo não for zerado
    if ((tempo - 1) >= 0) {

        // Pega a parte inteira dos minutos
        var min = parseInt(tempo / 60);
        // Calcula os segundos restantes
        var seg = tempo % 60;

        // Formata o número menor que dez, ex: 08, 07, ...
        if (min < 10) {
            min = "0" + min;
            min = min.substr(0, 2);
        }
        if (seg <= 9) {
            seg = "0" + seg;
        }
        // Cria a variável para formatar no estilo hora/cronômetro
        horaImprimivel = '00:' + min + ':' + seg;
        //JQuery pra setar o valor
        $("#sessao").html(horaImprimivel);
        // Define que a função será executada novamente em 1000ms = 1 segundo
        setTimeout('startCountdown()', 1000);
        // diminui o tempo
        tempo--;

        // Quando o contador chegar a zero faz esta ação
    } else {
        redirectToNextQuestion();
    }

}

// Chama a função ao carregar a tela
startCountdown();
//retornarId();

function redirectToNextQuestion() {
    //tempo = 120;
    //clearTimeout();
    //startCountdown();
    var parameter = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&').toString();
    var value = parameter.substring(9, parameter.length);
    var answer = getAnswer("answer");
    //alert(getAnswer("answer"));
    if (value != "1")
        //  value = value.substring(9, value.length);
        value = value.substring(value.indexOf('=') + 1, value.length);
    window.location.href = "http://localhost:8084/ProjetoQuiz/ControladorQuizServlet?answer=" + answer + "&question=" + (parseInt(value) + 1);
}

function getAnswer(name) {
    var radio = document.getElementsByName(name);

    for (var i = 0; i < radio.length; i++) {
        if (radio[i].checked) {
            return radio[i].value;
        }
    }

    return null;
}
        