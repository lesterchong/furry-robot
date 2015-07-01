/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.PatientDAO;
import MODEL.PatientModel;
import MODEL.ProcedureModel;
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
public class UpdateProcedureServlet extends HttpServlet {

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
            PatientDAO patientDAO = new PatientDAO();
            PatientModel model = new PatientModel();
            PatientModel model2;
            ProcedureModel procedureModel = new ProcedureModel();
            RequestDispatcher rd;

//            model.setPatientID(Integer.parseInt(request.getParameter("patientID")));
            model.setPatientID(Integer.parseInt(request.getParameter("patientID")));
            procedureModel.setMcv(Boolean.parseBoolean(request.getParameter("mcv")));
            procedureModel.setMchb(Boolean.parseBoolean(request.getParameter("mchb")));
            procedureModel.setHemocrit(Boolean.parseBoolean(request.getParameter("hemocrit")));
            procedureModel.setRbc(Boolean.parseBoolean(request.getParameter("rbc")));
            procedureModel.setDifferential(Boolean.parseBoolean(request.getParameter("differential")));
            procedureModel.setRbcdw(Boolean.parseBoolean(request.getParameter("rbcdw")));
            procedureModel.setChloride(Boolean.parseBoolean(request.getParameter("chloride")));
            procedureModel.setUrea(Boolean.parseBoolean(request.getParameter("urea")));
            procedureModel.setCreatine(Boolean.parseBoolean(request.getParameter("creatine")));
            procedureModel.setPacked(Boolean.parseBoolean(request.getParameter("packed")));
            procedureModel.setSodium(Boolean.parseBoolean(request.getParameter("sodium")));
            procedureModel.setPotassium(Boolean.parseBoolean(request.getParameter("potassium")));
            procedureModel.setBicarbonate(Boolean.parseBoolean(request.getParameter("bicarbonate")));
            procedureModel.setCreatinine(Boolean.parseBoolean(request.getParameter("creatinine")));
            procedureModel.setEsr(Boolean.parseBoolean(request.getParameter("esr")));
            procedureModel.setHemoglobin(Boolean.parseBoolean(request.getParameter("hemoglobin")));
            procedureModel.setPlatelet(Boolean.parseBoolean(request.getParameter("platelet")));
            procedureModel.setWbc(Boolean.parseBoolean(request.getParameter("wbc")));
            procedureModel.setAlt(Boolean.parseBoolean(request.getParameter("alt")));
            procedureModel.setAst(Boolean.parseBoolean(request.getParameter("ast")));
            procedureModel.setTourniquet(Boolean.parseBoolean(request.getParameter("tourniquet")));
            procedureModel.setCbc(Boolean.parseBoolean(request.getParameter("cbc")));
            procedureModel.setDateTaken(new java.sql.Date(new java.util.Date().getTime()));
            model.setPatientProcedure(procedureModel);

            rd = getServletContext().getRequestDispatcher("/patient-profile.jsp?patient=" + model.getPatientID());
            model2 = patientDAO.getPatientByID(model.getPatientID());

            if (patientDAO.transferProcedureToHistory(model2) && patientDAO.updateProcedure(model)) {
                out.printf("<script>alert(\"Successfully Updated\")</script>");
                rd.include(request, response);
                return;
            } else {
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
