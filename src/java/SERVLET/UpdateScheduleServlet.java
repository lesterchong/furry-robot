/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLET;

import DAO.StaffDAO;
import MODEL.StaffModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lester Chong
 */
public class UpdateScheduleServlet extends HttpServlet {

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
            RequestDispatcher rd;
            StaffDAO staffDAO = new StaffDAO();
            StaffModel model = new StaffModel();
            StringBuilder sb = new StringBuilder();
            String[] days;
            
            model.setStaffID(Integer.parseInt(request.getParameter("staffID")));
            days = request.getParameterValues("days");
            for(int ctr=0; ctr<days.length; ctr++)
                sb.append(days[ctr]);
            model.setDaysAssigned(sb.toString());
            model.setTimeAssigned(request.getParameter("timeStart")+"-"+request.getParameter("timeEnd"));
            model.setShiftStatus(request.getParameter("shiftStatus"));
            model.setAssignedWard(request.getParameter("ward"));
            
            if(staffDAO.updateStaffSchedule(model)){
                out.printf("<script>alert(\"Successfully Updated\")</script>");
                rd = getServletContext().getRequestDispatcher("/nurse-profile.jsp?staff="+model.getStaffID());
                rd.include(request, response);
                return;
            }else{
                rd = getServletContext().getRequestDispatcher("/nurse-profile.jsp?staff="+model.getStaffID());
                out.printf("<script>alert(\"Could Not Update\")</script>");
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
