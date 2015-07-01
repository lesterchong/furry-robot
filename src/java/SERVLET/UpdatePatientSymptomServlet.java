/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLET;

import DAO.PatientDAO;
import MODEL.PatientModel;
import MODEL.SymptomModel;
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
public class UpdatePatientSymptomServlet extends HttpServlet {

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
            PatientModel patientModel = new PatientModel();
            PatientModel patientModel2;
            PatientDAO patientDAO = new PatientDAO();
            SymptomModel symptomModel = new SymptomModel();
            RequestDispatcher rd;
            
            patientModel.setPatientID(Integer.parseInt(request.getParameter("patientID")));
            if(request.getParameter("abdominalPain").equals("true"))
                symptomModel.setAbdominalPain(true);
            else
                symptomModel.setAbdominalPain(false);
            
            if(request.getParameter("abdominalPain").equals("true"))
                symptomModel.setAscites(true);
            else
                symptomModel.setAscites(false);
            
            if(request.getParameter("abdominalPain").equals("true"))
                symptomModel.setHypotension(true);
            else
                symptomModel.setHypotension(false);
            
            if(request.getParameter("abdominalPain").equals("true"))
                symptomModel.setPleuralEffusion(true);
            else
                symptomModel.setPleuralEffusion(false);
            
            symptomModel.setJaundice(request.getParameter("jaundice"));
            symptomModel.setLiver(Float.parseFloat(request.getParameter("liver")));
            symptomModel.setSpleen(Float.parseFloat(request.getParameter("spleen")));
            symptomModel.setDateTaken(new java.sql.Date(new java.util.Date().getTime()));
            patientModel.setPatientSymptoms(symptomModel);
            
            rd = getServletContext().getRequestDispatcher("/patient-profile.jsp?patient="+patientModel.getPatientID());
            patientModel2 = patientDAO.getPatientByID(patientModel.getPatientID());
            
            patientDAO.transferSymptomsToHistory(patientModel2);
            
            if(patientDAO.transferSymptomsToHistory(patientModel2) && patientDAO.updateSymptom(patientModel)){
                out.printf("<script>alert(\"Successfully Updated\")</script>");
                rd.include(request, response);
                return;
            }else{
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
