<%-- 
    Document   : AddDischarge
    Created on : 20-May-2015, 20:18:38
    Author     : Lester Chong
--%>

<%@page import="MODEL.AdmittanceModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.AdmittanceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Discharge </title>
    </head>
    <body>
        <%
            AdmittanceDAO dao = new AdmittanceDAO();
            LinkedList<AdmittanceModel> list = dao.getAdmittances();
        %>
        <form action="AddDischargeServlet" method="POST">
            Patient: <select name="patient">
                <%
                    for(int ctr=0; ctr<list.size(); ctr++){
                        out.println("<option value="+list.get(ctr).getAdmittanceID()+">"+list.get(ctr).getLastName()+", "+list.get(ctr).getFirstName()+"</option>");
                    }
                %>
            </select>
            <br>
            Room Number: <input type="number" name="roomNumber"/>
            <br>
            Date of Discharge: <input type="date" name="dateOfDischarge"/>
            <br>
            Provisional Diagnosis: <input type="text" name="provisionalDiagnosis"/>
            <br>
            Final Diagnosis: <input type="text" name="finalDiagnosis"/>
            <br>
            Brief History: <input type="text" name="briefHistory"/>
            <br>
            Patient and Laboratory Findings: <input type="text" name="findings"/>
            <br>
            Course of Treatment: <input type="text" name="courseOfTreatment"/>
            <br>
            Condition of Discharge: <input type="text" name="conditionOfDischarge"/>
            <br>
            Rehabilitation Potential: <input type="text" name="rehabPotential"/>
            <br>
            Follow-up and Discharge Medication: <input type="text" name="followUp"/>
            <br>
            Approved By: <input type="text" name="approvedBy"/>
            <br>
            <button type="submit"/>Submit
        </form>
    </body>
</html>
