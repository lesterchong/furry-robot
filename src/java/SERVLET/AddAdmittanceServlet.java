/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLET;

import DAO.AdmittanceDAO;
import DAO.PatientDAO;
import DAO.StaffDAO;
import DAO.WardDAO;
import MODEL.AdmittanceModel;
import MODEL.PatientModel;
import MODEL.WardModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddAdmittanceServlet extends HttpServlet {

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
            AdmittanceModel model = new AdmittanceModel();
            PatientModel patientModel = new PatientModel();
            LinkedList<WardModel> wardList = new LinkedList<>();
            AdmittanceDAO dao = new AdmittanceDAO();
            PatientDAO patientDAO = new PatientDAO();
            StaffDAO staffDAO = new StaffDAO();
            WardDAO wardDAO = new WardDAO();
            SimpleDateFormat sd = new SimpleDateFormat("dd MMMM, yyyy");
            RequestDispatcher rd;
            
            wardList = wardDAO.getPatientCountPerWard();
            
            try{
                model.setPatientFirstName(request.getParameter("patientFirstName"));
                model.setPatientLastName(request.getParameter("patientLastName"));
                model.setPatientBirthDate(new java.sql.Date(sd.parse(request.getParameter("patientBirthdate")).getTime()));
                model.setPatientAge(Integer.parseInt(request.getParameter("patientAge")));
                model.setPatientCivilStatus(request.getParameter("patientCivilStatus"));
                model.setPatientPhoneNumber(Long.parseLong(request.getParameter("patientPhoneNumber")));
                model.setPatientAddress(request.getParameter("patientAddress"));
                model.setPatientBarangay(request.getParameter("patientBarangay"));
                model.setIncidentLocation(request.getParameter("incidentLocation"));
                model.setIncidentBarangay(request.getParameter("incidentBarangay"));
                model.setKnownAllergies(request.getParameter("knownAllergy"));
                
                model.setCompanionAddress(request.getParameter("companionAddress"));
                model.setCompanionAge(Integer.parseInt(request.getParameter("companionAge")));
                model.setCompanionBarangay(request.getParameter("companionBarangay"));
                model.setCompanionBirthDate(new java.sql.Date(sd.parse(request.getParameter("companionBirthdate")).getTime()));
                model.setCompanionFirstName(request.getParameter("companionFirstName"));
                model.setCompanionLastName(request.getParameter("companionLastName"));
                model.setCompanionPhoneNumber(Long.parseLong(request.getParameter("companionPhoneNumber")));
                model.setCompanionRelationship(request.getParameter("companionRelationship"));
                model.setDateFiled(new java.sql.Date(new java.util.Date().getTime()));
                model.setHospitalID(0);
                //PatientDAO here. Determine ward and diagnosis.
                if(wardList.get(0).getCurrentNumber() == wardList.get(0).getCapacity())
                    patientModel.setPatientWard("0");
                else if(wardList.get(1).getCurrentNumber() == wardList.get(1).getCapacity())
                    patientModel.setPatientWard("1");
                else
                    patientModel.setPatientWard("2");
                patientModel.setPatientDiagnosis(request.getParameter("diagnosis"));
                patientModel.setAssignedNurse(String.valueOf(staffDAO.getStaffIDWithFewestPatients()));
                System.out.println(String.valueOf(staffDAO.getStaffIDWithFewestPatients()));
                
                rd = getServletContext().getRequestDispatcher("/admissions.jsp");
                
                if(dao.addAdmittance(model) && patientDAO.addPatient(patientModel)){
                    out.printf("<script>alert(\"Successfully Updated\")</script>");
                    rd.include(request, response);
                    return;
                }else{
                    out.printf("<script>alert(\"Could Not Update\")</script>");
                    rd.include(request, response);
                    return;
                }
            }catch(ParseException e){
                out.printf("<script>alert(\"An Error Occured\")</script>");
                rd = getServletContext().getRequestDispatcher("/admissions.jsp");
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
