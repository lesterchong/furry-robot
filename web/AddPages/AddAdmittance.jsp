<%-- 
    Document   : AddAdmittance
    Created on : 20-May-2015, 20:16:12
    Author     : Lester Chong
--%>

<%@page import="MODEL.ReferenceModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.ReferenceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Admittance</title>
    </head>
    <body>
        <%
            ReferenceDAO dao = new ReferenceDAO();
            LinkedList<ReferenceModel> list;
        %>
        <form method="POST" action="../AddAdmittanceServlet">            
            First Name: <input type='text' name='firstName'/>
            <br>
            Last Name: <input type='text' name='lastName'/>
            <br>
            Nickname: <input type='text' name='nickName'/>
            <br>
            Date Of Birth: <input type='date' name='dateOfBirth'/>
            <br>
            SSS: <input type='number' name='sss'/>
            <br>
            Address: <select name="address">
            <%
                list = dao.getBarangays();
                for(int ctr=0; ctr<list.size(); ctr++){
                    out.println("<option value="+list.get(ctr).getReferenceID()+">"+list.get(ctr).getReferenceName()+"</option>");
                }
            %>
            </select>
            <br>
            Guardian: <input type="text" name="legalGuardian"/>
            <br>
            Guardian Contact: <input type="number" name="guardianNumber"/>
            <br>
            Insurance Type: <input type="radio" name="insuranceType" value="0"/>Primary
            <input type="radio" name="insuranceType" value="1"/>Secondary
            <br>
            Insurance Number: <input type="number" name="insuranceNumber"/>
            <br>
            Phone Number: <input type='number' name='phoneNumber'/>
            <br>
            Allergies: <input type="text" name="allergy"/>
            <br>
            Civil Status: <select name='civilStatus'/>
            <%
                list = dao.getCivilStatus();
                for(int ctr=0; ctr<list.size(); ctr++){
                    out.println("<option value="+list.get(ctr).getReferenceID()+">"+list.get(ctr).getReferenceName()+"</option>");
                }
            %>
            </select>
            <br>
            Age: <input type='number' name='age'/>
            <br>
            Primary Doctor: <input type='text' name='primaryDoctor'/>
            <br>
            Phone Number: <input type='number' name='doctorNumber'/>
            <br>
            Dengue Level: <input type="number" name="dengueLevel" min="1" max="4"/>
            <br>
            Consent for Release of Information: <input type="radio" name="releaseInfo" value="0"/>Yes
            <input type="radio" name="releaseInfo" value="1"/>No
            <br>
            Incident Report: <input type='text' name='incidentReport'/>
            <br>
            Incident Location: <select name='incidentLocation'/>
            <%
                list = dao.getBarangays();
                for(int ctr=0; ctr<list.size(); ctr++){
                    out.println("<option value="+list.get(ctr).getReferenceID()+">"+list.get(ctr).getReferenceName()+"</option>");
                }
            %>
            </select>
            <br>
            <h3>Emergency Contact: </h3>
            <br>
            First Name: <input name="emergencyFirstName" type="text"/>
            <br>
            Last Name: <input name="emergencyLastName" type="text"/>
            <br>
            Primary Phone Number: <input name="emergencyPrimaryNumber" type="number"/>
            <br>
            Secondary Phone Number: <input name="emergencySecondaryNumber" type="number"/>
            <br>
            Relationship: <input name="emergencyRelationship" type="text"/>
            <br>
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
