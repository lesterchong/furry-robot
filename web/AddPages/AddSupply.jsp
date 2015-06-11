<%-- 
    Document   : AddSupply
    Created on : 20-May-2015, 19:59:24
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
        <title>Add Supply</title>
    </head>
    <body>
        <%
            ReferenceDAO dao = new ReferenceDAO();
            LinkedList<ReferenceModel> list = dao.getPharmacy();
        %>
        <form method="POST" action="../AddSupplyServlet">
            Supply Name: <input type="text" name="supplyName"/>
            <br>
            Supply Amount: <input type="number" name="supplyAmount"/>
            <br>
            Hospital: <select name="hospital">
            <%
                for(int ctr=0; ctr<list.size(); ctr++){
                    out.println("<option value="+list.get(ctr).getReferenceID()+">"+list.get(ctr).getReferenceName()+"</option>");
                }
            %>
            </select>
            <br>
            <button type="submit"/>Submit
        </form>
        
    </body>
</html>
