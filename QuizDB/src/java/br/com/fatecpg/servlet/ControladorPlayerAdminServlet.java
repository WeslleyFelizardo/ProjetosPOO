/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.servlet;

import br.com.fatecpg.dao.PlayerDAO;
import br.com.fatecpg.dao.RoleDAO;
import br.com.fatecpg.modelo.Player;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cleide
 */
@WebServlet(name = "ControladorPlayerAdminServlet", urlPatterns = {"/ControladorPlayerAdminServlet"})
public class ControladorPlayerAdminServlet extends HttpServlet {

    PlayerDAO playerDAO;
    ArrayList<Player> players;

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
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";

        playerDAO = new PlayerDAO();

        if (action.equals("getAll")) {
            players = new ArrayList<Player>();

            players = playerDAO.getAllPlayer();

            request.setAttribute("players", players);
            request.setAttribute("roles", new RoleDAO().getAllRole());
            request.getRequestDispatcher("maintenanceUsers.jsp").forward(request, response);
        } else if (request.getParameter("delete") != null) {
            //System.out.println(request.getParameter("delete"));
            playerDAO.deletePlayer(Integer.parseInt(request.getParameter("delete")));

            response.sendRedirect("ControladorPlayerAdminServlet?action=getAll");
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
        playerDAO = new PlayerDAO();
        
        if (action.equals("register")) {
            Player player = new Player(0,
                                       request.getParameter("name"),
                                       request.getParameter("email"),
                                       Integer.parseInt(request.getParameter("role")));
            player.setPassword(request.getParameter("password"));
            
            playerDAO.playerRegistering(player);
            
            response.sendRedirect("ControladorPlayerAdminServlet?action=getAll");
        } else if (action.equals("update")) {
            Player player = new Player(Integer.parseInt(request.getParameter("idPlayer")),
                                       request.getParameter("name"),
                                       request.getParameter("mail"),
                                       Integer.parseInt(request.getParameter("roles")));
            player.setPassword(!request.getParameter("newPassword").equals("") ? request.getParameter("newPassword") : request.getParameter("passwordCurrent"));
            
            playerDAO.updatePlayer(player);
            
            response.sendRedirect("ControladorPlayerAdminServlet?action=getAll");
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
