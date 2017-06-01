/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.modelo;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cleide
 */
public class ControladorQuizServlet extends HttpServlet {

    private ArrayList<String> escolhas;
    private ArrayList<Question> questions;

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
        processRequest(request, response);
        
        
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
                escolhas = new ArrayList<String>();
                String[] parametros = request.getParameterValues("escolha");

                for (int i = 0; i < parametros.length; i++) {
                    
                    escolhas.add(parametros[i]);
                }
                
                questions = new ArrayList<Question>();
                questions = Quiz.getQuestionsRandom(escolhas);
                
                request.setAttribute("question", questions.get(0));
                request.getSession().setAttribute("namePlayer", request.getParameter("nome"));
            }
            if (question > 10) {
                Quiz.answer.add(request.getParameter("answer"));
                //System.out.println(request.getSession().getAttribute("namePlayer").toString());
                Player player = new Player(request.getSession().getAttribute("namePlayer").toString());
                Player.adicionarJogadorRank(player, Quiz.validateQuiz(Quiz.answer, questions));
                
                
                response.sendRedirect("resultado.jsp");
            } else {
                if (request.getParameter("answer") != null) {
                    
                    Quiz.answer.add(request.getParameter("answer"));
                    
                }
                
                request.setAttribute("question", questions.get(question - 1));
                request.setAttribute("countQuestion", question);
                request.getRequestDispatcher("/perguntas.jsp?question=" + question).forward(request, response);
            }

            //request.getRequestDispatcher("/perguntas.jsp?question=1").forward(request, response);
            //response.sendRedirect("perguntas.jsp?question=1");
        }

        //if (!request.getParameter("question").equals("")) {
        //}
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
