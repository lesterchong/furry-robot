/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLET;

import DAO.UserDAO;
import MODEL.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UserAuthenticationServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            UserModel model = new UserModel();
            UserDAO dao = new UserDAO();
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.html");
            
            model.setUsername(request.getParameter("username"));
            model.setPassword(request.getParameter("password"));
            
            if(dao.validateAccount(model)){
                model = dao.getUserByUsername(model.getUsername());
                HttpSession sesh = request.getSession();
                sesh.setAttribute("userLogged", model.getUserID());
                sesh.setAttribute("username", model.getUsername());
                sesh.setAttribute("userPrivy", model.getPrivilegeType());
                sesh.setAttribute("hospitalID", model.getHospital());
                sesh.setAttribute("isLogged", true);
                out.printf("<script>alert(\"Successful Login\")</script>");
                if(model.getPrivilegeType().equals("IT"))
                    rd = getServletContext().getRequestDispatcher("/it-main.jsp");
                else
                    rd = getServletContext().getRequestDispatcher("/headnurse-main.jsp");
                rd.include(request, response);
                return;
            }else{
                out.printf("<script>alert(\"Invalid Username/Password Combination\")</script>");
                rd.include(request, response);
                return;
            }
        }
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
