/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLET;

import DAO.PatientDAO;
import DAO.ReferenceDAO;
import MODEL.PatientModel;
import MODEL.ReferenceModel;
import SMTP.SMTPDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TransferPatientServlet extends HttpServlet {

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
            PatientDAO patientDAO = new PatientDAO();
            SMTPDAO smtpDAO = new SMTPDAO();
            ReferenceDAO refDAO = new ReferenceDAO();
            LinkedList<ReferenceModel> refList = refDAO.getHospitals();
            PatientModel patientModel;
            int hospitalID;
            String email=null;
            
            hospitalID = Integer.parseInt(request.getParameter("hospitalID"));
            patientModel = patientDAO.getPatientByID(Integer.parseInt(request.getParameter("patientID")));
            for(int ctr=0; ctr<refList.size(); ctr++){
                if(refList.get(ctr).getReferenceID() == hospitalID)
                    email = refList.get(ctr).getEmail();
            }
            
            rd = getServletContext().getRequestDispatcher("/it-main.jsp");
            
            if(smtpDAO.sendPatient(patientModel, email) && patientDAO.deleteFromPendingTransfer(patientModel)){
                out.printf("<script>alert(\"Email Sent to "+email+"\")</script>");
                rd.include(request, response);
                return;
            }else{
                out.printf("<script>alert(\"Could Not Be Sent\")</script>");
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
