/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.servlet;

import br.com.fatecpg.dao.AlternativeDAO;
import br.com.fatecpg.dao.PlayerDAO;
import br.com.fatecpg.dao.QuestionDAO;
import br.com.fatecpg.dao.QuestionQuizDAO;
import br.com.fatecpg.dao.QuizDAO;
import br.com.fatecpg.modelo.Alternative;
import br.com.fatecpg.modelo.Player;
import br.com.fatecpg.modelo.Question;
import br.com.fatecpg.modelo.QuestionQuiz;
import br.com.fatecpg.modelo.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aula
 */
@WebServlet(name = "ControladorQuiz", urlPatterns = {"/ControladorQuiz"})
public class ControladorQuizServlet extends HttpServlet {

    private AlternativeDAO alternativeDAO;
    private ArrayList<Question> questions;
    private ArrayList<Alternative> answers;
    ArrayList<Integer> chooses = new ArrayList<Integer>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        QuizDAO quizDAO = new QuizDAO();
        
        if (action.equals("ranking")) {
            ArrayList<Player> ranking = new ArrayList<Player>();
            ranking = quizDAO.getRanking();
            
            request.setAttribute("ranking", ranking);
            request.getRequestDispatcher("ranking.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        if (!request.getParameter("question").equals("")) {
            int question = Integer.parseInt(request.getParameter("question"));
            if (question == 1) {
                answers = new ArrayList<Alternative>();
                chooses = new ArrayList<Integer>();
                String[] parametros = request.getParameterValues("escolha");

                for (int i = 0; i < parametros.length; i++) {
                    chooses.add(Integer.parseInt(parametros[i]));
                }
                //System.out.println(chooses.toString());
                questions = new ArrayList<Question>();
                QuestionDAO questionDAO = new QuestionDAO();

                try {
                    alternativeDAO = new AlternativeDAO();
                    questions = questionDAO.getQuestionRandom(chooses);
                    alternativeDAO.getAlternativeQuestion(questions);

                } catch (SQLException ex) {
                    System.out.println("Erro: " + ex.getMessage());
                }
                
                request.setAttribute("question", questions.get(0));
                request.getSession().setAttribute("namePlayer", request.getParameter("nome"));
            }
            if (question > 10) {
                answers.add(alternativeDAO.getById(Integer.parseInt(request.getParameter("answer"))));
                //System.out.println(request.getSession().getAttribute("namePlayer").toString());
                //Pegar o usuario logado que esta na session e passar para a classe quiz                
                //Player player = new Player(request.getSession().getAttribute("namePlayer").toString());
                //Player.adicionarJogadorRank(player, Quiz.validateQuiz(Quiz.answer, questions));
                PlayerDAO playerDAO = new PlayerDAO();
                Player playerCurrent = playerDAO.getPlayer(((Player)request.getSession().getAttribute("userCurrent")).getEmail());
                Quiz quiz = new Quiz(0.0, playerCurrent);

                QuizDAO quizDAO = new QuizDAO();
                quizDAO.newQuiz(quiz);

                QuestionQuizDAO questionQuizDAO = new QuestionQuizDAO();
                QuestionQuiz questionQuiz = new QuestionQuiz(answers, quizDAO.getLastQuiz(playerCurrent.getId()));

                questionQuizDAO.registerAnswers(questionQuiz);
                quizDAO.validateQuiz(quizDAO.getLastQuiz(playerCurrent.getId()).getId());
                
                request.setAttribute("scoreAverage", playerDAO.getScoreAverage(playerCurrent.getId()));
                request.setAttribute("lastScore", quizDAO.getLastQuiz(playerCurrent.getId()).getScore());
                request.getRequestDispatcher("resultado.jsp").forward(request, response);
            } else {
                if (request.getParameter("answer") != null) {
                    //System.out.println(alternativeDAO.getById(73).getDescription());
                     answers.add(alternativeDAO.getById(Integer.parseInt(request.getParameter("answer"))));
                    //System.out.println(answers.get(0).getDescription());
                }

                request.setAttribute("question", questions.get(question - 1));
                request.setAttribute("countQuestion", question);
                request.getRequestDispatcher("/perguntas.jsp?question=" + question).forward(request, response);
            }

            //request.getRequestDispatcher("/perguntas.jsp?question=1").forward(request, response);
            //response.sendRedirect("perguntas.jsp?question=1");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
