/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.servlet;

import br.com.fatecpg.dao.AlternativeDAO;
import br.com.fatecpg.dao.CategoryDAO;
import br.com.fatecpg.dao.QuestionDAO;
import br.com.fatecpg.modelo.Alternative;
import br.com.fatecpg.modelo.Question;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;

/**
 *
 * @author a
 */
@WebServlet(name = "ControladorQuestionServlet", urlPatterns = {"/ControladorQuestionServlet"})
public class ControladorQuestionServlet extends HttpServlet {
private QuestionDAO questionDAO;
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
        questionDAO = new QuestionDAO();
        String action = request.getParameter("action") != null ? request.getParameter("action") :"";
        
        if(action.equals("getAll")){
            questions = new ArrayList<Question>();
            questions = questionDAO.getAllQuestions();
            new AlternativeDAO().getAlternativeQuestion(questions);
            
            request.setAttribute("questions", questions);
            //request.setAttribute("links", questionDAO.generateLinks());
            request.setAttribute("categorys", new CategoryDAO().getCategory());
            try {
                request.setAttribute("jsonAlternatives", AlternativeDAO.toJson(questions));
            } catch (JSONException ex) {
                Logger.getLogger(ControladorQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("maintenanceQuestions.jsp").forward(request, response);
        }
        else if(request.getParameter("delete") != null){
            //System.out.println(request.getParameter("delete"));
            questionDAO.deleteQuestion(Integer.parseInt(request.getParameter("delete")));
            
            response.sendRedirect("ControladorQuestionServlet?action=getAll");
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
        String action = request.getParameter("action");
        questionDAO = new QuestionDAO();
        if (action.equals("newQuestion")) {
            Question question = new Question(questionDAO.generateId(), request.getParameter("description"),
                    new CategoryDAO().getById(Integer.parseInt(request.getParameter("category"))),
                    1);
            //System.out.println(request.getParameterValues("descriptionAlternative")[2]);
            String[] alternatives = request.getParameterValues("descriptionAlternative");
            
            for (int i = 0; i < 4; i++) {
                Alternative alternative = new Alternative();
                alternative.setDescription(alternatives[i]);
                alternative.setQuestion(question);
                if(request.getParameter("alternativeCorrect").equals(alternatives[i]))
                    alternative.setAnswerCorrect(1);
                
                question.getAlternatives().add(alternative);
            }
            
            questionDAO.registerQuestion(question);
            
            //System.out.println(questionDAO.getAllQuestions().);
            
            AlternativeDAO alternativeDAO = new AlternativeDAO();
            alternativeDAO.registerAlternative(question.getAlternatives());
            
            response.sendRedirect("ControladorQuestionServlet?action=getAll");
//System.out.println(question);
        } else if (action.equals("update")) {
            AlternativeDAO alternativeDAO = new AlternativeDAO();
            
            Question question = new Question(Integer.parseInt(request.getParameter("idQuestion")),
                                             request.getParameter("descriptionUpdate"),
                                             new CategoryDAO().getById(Integer.parseInt(request.getParameter("categorys"))),
                                             1);
            //System.out.println(request.getParameterValues("descriptionAlternative")[2]);
            String[] alternatives = request.getParameterValues("descriptionAlternativeUpdate");
            String[] alternativesIds = request.getParameterValues("ids");
            
            for (int i = 0; i < 4; i++) {
                Alternative alternative = new Alternative();
                
                alternative = alternativeDAO.getById(Integer.parseInt(alternativesIds[i]));               
                alternative.setDescription(alternatives[i]);
                alternative.setQuestion(question);
                if(Integer.parseInt(request.getParameter("respostaCerta")) == alternative.getId())
                    alternative.setAnswerCorrect(1);
                else
                    alternative.setAnswerCorrect(0);
                
                question.getAlternatives().add(alternative);
            }  
            
            questionDAO.updateQuestion(question);
            alternativeDAO.updateAlternatives(question.getAlternatives());
            
            response.sendRedirect("ControladorQuestionServlet?action=getAll");
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
