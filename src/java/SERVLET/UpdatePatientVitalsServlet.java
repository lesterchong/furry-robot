/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLET;

import DAO.PatientDAO;
import MODEL.PatientModel;
import MODEL.VitalsModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lester Chong
 */
public class UpdatePatientVitalsServlet extends HttpServlet {

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
            PatientModel patientModel2 = new PatientModel();
            PatientDAO patientDAO = new PatientDAO();
            VitalsModel vitalsModel = new VitalsModel();
            SimpleDateFormat sd = new SimpleDateFormat("dd MMMM, yyyy");
            RequestDispatcher rd;
            
            try{
                patientModel.setPatientID(Integer.parseInt(request.getParameter("patientID")));
                vitalsModel.setTemperature(Float.parseFloat(request.getParameter("temperature")));
                vitalsModel.setBloodPressure(request.getParameter("bloodPressure"));
                vitalsModel.setLastDextrose(new java.sql.Date(sd.parse(request.getParameter("lastDextrose")).getTime()));
                vitalsModel.setDateTaken(new java.sql.Date(new java.util.Date().getTime()));
                patientModel.setPatientVitals(vitalsModel);
                
                patientModel2 = patientDAO.getPatientByID(patientModel.getPatientID());
                
                rd = getServletContext().getRequestDispatcher("/patient-profile.jsp?patient="+patientModel.getPatientID());
                if(patientDAO.transferVitalsToHistory(patientModel2) && patientDAO.updateVitals(patientModel)){
                    out.printf("<script>alert(\"Successfully Updated\")</script>");
                    rd.include(request, response);
                    return;
                }else{
                    out.printf("<script>alert(\"Could Not Update\")</script>");
                    rd.include(request, response);
                    return;
                }
            }catch(ParseException e){
                e.printStackTrace();
                out.printf("<script>alert(\"An Error Occured\")</script>");
                rd = getServletContext().getRequestDispatcher("/patient-profile.jsp?patient="+patientModel.getPatientID());;
                rd.include(request, response);
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
