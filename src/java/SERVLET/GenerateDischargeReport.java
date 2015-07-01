/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLET;

import DAO.PatientDAO;
import MODEL.PatientModel;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lester Chong
 */
public class GenerateDischargeReport extends HttpServlet {

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
            File file = new File("DischargeReport.txt");
            BufferedWriter bw = new BufferedWriter(new FileWriter(file));
            PatientDAO patientDAO = new PatientDAO();
            LinkedList<PatientModel> patientList;
            RequestDispatcher rd;
            
            if(!file.exists())
                file.createNewFile();
            
            patientList = patientDAO.getDischargedPatients();
            bw.write("Patient Name, ");
            bw.write("Date Admitted, ");
            bw.write("Date Discharged, ");
            bw.write("Diagnosis, ");
            bw.write("Barangay, ");
            bw.write("Incident Report");
            bw.newLine();
            
            for(int ctr=0; ctr<patientList.size(); ctr++){
                bw.write(patientList.get(ctr).getPatientLastName() + patientList.get(ctr).getPatientFirstName()+", ");
                bw.write(patientList.get(ctr).getDateAdmitted().toString()+", ");
                bw.write(patientList.get(ctr).getDateDischarged().toString()+", ");
                bw.write(patientList.get(ctr).getPatientDiagnosis()+", ");
                bw.write(patientList.get(ctr).getPatientBarangay()+", ");
                bw.write(patientList.get(ctr).getIncidentBarangay());
                bw.newLine();
            }
            bw.close();
            
            rd = getServletContext().getRequestDispatcher("/it-main.html");
            out.printf("<script>alert(\"Report Succesfully Generated at "+file.getCanonicalPath()+"\")</script>");
            rd.include(request, response);
            return;
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
