/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.servlet;

import br.com.fatecpg.dao.PlayerDAO;
import br.com.fatecpg.dao.QuizDAO;
import br.com.fatecpg.modelo.Player;
import br.com.fatecpg.modelo.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Cleide
 */
@WebServlet(name = "ControladorPlayerServlet", urlPatterns = {"/ControladorPlayerServlet"})
public class ControladorPlayerServlet extends HttpServlet {

    private PlayerDAO playerDAO;

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
        if (request.getParameter("action").equals("historic")) {
            Player player = playerDAO.getHistoric(((Player) request.getSession().getAttribute("userCurrent")).getEmail());

            request.setAttribute("historic", player);
            try {
                request.setAttribute("details", new QuizDAO().detailsToJson());
            } catch (JSONException ex) {
                Logger.getLogger(ControladorPlayerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("historic.jsp").forward(request, response);
        } else {
            request.getSession().invalidate();
            response.sendRedirect("index.jsp");
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
        //System.out.println("Hello Player");
        playerDAO = new PlayerDAO();
        Player player;
        String action = request.getParameter("action");
        if (action.equals("register")) {

            player = new Player();
            player.setName(request.getParameter("username"));
            player.setEmail(request.getParameter("email"));
            player.setPassword(request.getParameter("password"));
            player.setIdRole(2);
            
            playerDAO.playerRegistering(player);

            if (playerDAO.logIn(player)) {
                request.getSession().setAttribute("userCurrent", playerDAO.getPlayer(player.getEmail()));
                response.sendRedirect("index.jsp");
            }
        } else if (action.equals("logIn")) {
            System.out.println("logIn");

            player = new Player();
            player.setEmail(request.getParameter("email"));
            player.setPassword(request.getParameter("password"));

            if (playerDAO.logIn(player)) {
                request.getSession().setAttribute("userCurrent", playerDAO.getPlayer(player.getEmail()));
                response.sendRedirect("index.jsp");
            } else{
                response.sendRedirect("index.jsp");
            }
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
