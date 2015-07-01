<%@page import="DAO.ReferenceDAO"%>
<%@page import="MODEL.ReferenceModel"%>
<%@page import="MODEL.StaffModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.StaffDAO"%>
<!doctype html>
<html>
    <head>
        <title>QMMC</title>
  
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/animate.min.css">
        <link type="text/css" rel="stylesheet" href="css/materialize.css"  media="screen,projection"/>	      
        <link type="text/css" rel="stylesheet" href="css/styles.css"/>
        <link type="text/css" rel="stylesheet" href="css/animation.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes"/>
        <style> 
            [data-sr] { visibility: hidden; }             
        </style>
    </head>
    <!-- Start of Body -->
    <body class="grey lighten-4">
        <!-- Start Here -->
        <%
            StaffDAO sdao = new StaffDAO();
            ReferenceDAO rdao = new ReferenceDAO();
            LinkedList<ReferenceModel> referenceList;
            StaffModel staffModel = sdao.getStaffByID(Integer.parseInt(request.getParameter("staff")));
        %>
        <!-- nav bar -->
        <nav style="background: 0; height:50px;">
            <div class="nav-wrapper" id="start-navbar">
                <a href="#!" class="roboto-300">Q M M C - O R M S</a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="admissions.jsp">Admissions</a></li>
                    <li><a href="headnurse-main.jsp">Dashboard</a></li>                    
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="admissions.jsp">Admissions</a></li>
                    <li><a href="headnurse-main.jsp">Dashboard</a></li>                    
                </ul>
            </div>
        </nav>      
        <!-- end of nav bar -->
        <div id="above-fold"></div>
        <!-- below nav bar -->
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <div class="card">
                        <div class="card-content blue accent-2 white-text">
                            <div class="row">
                                <div class="col s12 m4">
                                    <h4>
                                        <% out.println(staffModel.getStaffLastName()); %>
                                        ,<br>
                                        <% out.println(staffModel.getStaffFirstName()); %>
                                    </h4>                                
                                </div>
                                <div class="col s12 m4">
                                    <span class="card-title">
                                        Schedule
                                    </span>
                                    <p>
                                        <% out.println(staffModel.getDaysAssigned()); %>
                                        <br>
                                        <% out.println(staffModel.getTimeAssigned()); %>
                                        <br>
                                        <% out.println(staffModel.getShiftStatus()); %>
                                    </p>
                                </div>
                                <div class="col s12 m4">
                                    <span class="card-title">Assigned Ward</span>
                                    <p>
                                        <% out.println(staffModel.getAssignedWard()); %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>
                <div class="col s12 m6">
                    <div class="card">
                        <div class="card-content orange">
                            <span class="card-title">Assigned Patients</span>  
                            <p class="white-text">Click name to view more detailed page.</p><br>
                        </div>
                        <div class="card-content">
                            <table class="hoverable centered">
                                <thead>
                                    <tr>
                                        <th data-field="id">Name</th>
                                        <th data-field="name">Ward</th>
                                        <th data-field="price">Condition</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <%
                                        for(int ctr=0; ctr<staffModel.getPatients().size(); ctr++){
                                    %>
                                    <tr>
                                        <td><a href="patient-profile.jsp?patient=<%out.print(staffModel.getPatients().get(ctr).getPatientID());%>"><% out.print(staffModel.getPatients().get(ctr).getPatientLastName()+", "+staffModel.getPatients().get(ctr).getPatientFirstName()); %></a></td>
                                        <td><% out.print(staffModel.getPatients().get(ctr).getPatientWard()); %></td>
                                        <td><% out.print(staffModel.getPatients().get(ctr).getPatientDiagnosis()); %></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col s12 m6">
                    <div class="card">
                        <div class="card-content green">
                            <span class="card-title">
                                Staff Schedule Details
                            </span>
                            <p class="white-text">To change info, edit input and press update. Leave the form alone if there are no updates to be made.</p>
                        </div>
                        <div class="card-content">                            
                            <form method="POST" action="UpdateScheduleServlet">
                                <input type="hidden" value="<%out.print(staffModel.getStaffID());%>" name="staffID">
                                <div class="row">
                                    <div class="col s12">
                                        <label>Assigned Ward</label>
                                        <select class="browser-default" name="ward">
                                        <%
                                            referenceList = rdao.getWards();
                                            for(int ctr=0; ctr<referenceList.size(); ctr++){
                                        %>
                                        <option value="<%out.print(referenceList.get(ctr).getReferenceID());%>"><%out.print(referenceList.get(ctr).getReferenceName());%></option>
                                        <%}%>
                                        </select>
                                        
                                    </div>
                                    <div class="col s12"><br></div>
                                    <div class="col s12">
                                        <label>Shift Status</label>
                                        <select class="browser-default" name="shiftStatus">
                                        <%
                                            referenceList = rdao.getShiftStatus();
                                            for(int ctr=0; ctr<referenceList.size(); ctr++){
                                        %>
                                            <option value="<%out.print(referenceList.get(ctr).getReferenceID());%>"><%out.print(referenceList.get(ctr).getReferenceName());%></option>
                                        <%}%>
                                        </select>
                                    </div>
                                    <div class="col s12"><br></div>
                                    <div class="col s6">                                                                           
                                        <div class="input-field col s12">
                                            <input id="time-in-hour" type="text" class="validate" value="0800" name="timeStart">
                                            <label for="time-in-hour">Time In</label>
                                        </div>
                                    </div>
                                    <div class="col s6">                                                                           
                                        <div class="input-field col s12">
                                            <input id="time-out-hour" type="text" class="validate" value="2300" name="timeEnd">
                                            <label for="time-out-hour">Time Out</label>
                                        </div>
                                    </div>
                                    <div class="col s12"><br></div>
                                    <div class="col s12 center">
                                        <p>Days of the week</p>
                                        <span>
                                            <input type="checkbox" class="filled-in" id="time-monday" checked="checked" value="M" name="days"/>
                                            <label for="time-monday"> MON </label>
                                        </span>
                                        <span>
                                            <input type="checkbox" class="filled-in" id="time-tuesday" checked="checked" value="T" name="days"/>
                                            <label for="time-tuesday"> TUE </label>
                                        </span>
                                        <span>
                                            <input type="checkbox" class="filled-in" id="time-wednesday" checked="checked" value="W" name="days"/>
                                            <label for="time-wednesday"> WED </label>
                                        </span>
                                        <span>
                                            <input type="checkbox" class="filled-in" id="time-thursday" checked="checked" value="TH" name="days"/>
                                            <label for="time-thursday"> THU </label>
                                        </span><br>
                                        <span>
                                            <input type="checkbox" class="filled-in" id="time-friday" checked="checked" value="F" name="days"/>
                                            <label for="time-friday"> FRI </label>
                                        </span>
                                        <span>
                                            <input type="checkbox" class="filled-in" id="time-saturday" checked="checked" value="Sa" name="days"/>
                                            <label for="time-saturday"> SAT </label>
                                        </span>
                                        <span>
                                            <input type="checkbox" class="filled-in" id="time-sunday" checked="checked" value="Su" name="days"/>
                                            <label for="time-sunday"> SUN </label>
                                        </span>
                                    </div>
                                </div>
                                <button class="btn blue accent-4 waves-effect waves-light" type="submit" name="action" style="width: 100%;">
                                    Update Assignment                                    
                                </button> 
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>             
        </div>
        
        <!-- 
        Start of Below the fold content
        -->
        <!-- Do Not Go Beyond Here -->
        <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
      	<script type="text/javascript" src="js/materialize.min.js"></script>
        
      	<script src='js/scrollReveal.min.js'></script>
        <script src="js/laurenz.js"></script>
        <script type="text/javascript">
      		$(document).ready(function(){
    			$(".button-collapse").sideNav();
                 $('select').material_select();
      		});
            
            var options = [
                {selector: '#sec-2', offset: 200, callback: 'changeNavbarToDark()' },
                {selector: '#sec-3', offset: 200, callback: 'changeNavbarToWhite()' },
            ];
            //Materialize.scrollFire(options);
            
            function changeNavbarToDark()
            {
                var nav = document.getElementById('start-navbar');
                //nav.style.background = 'black';
                nav.className = 'blue-grey darken-4';
            }
            function changeNavbarToWhite()
            {
                var nav = document.getElementById('start-navbar');                
                nav.className = 'grey lighten-5';
            }
      	</script>        
        <script>
          window.sr = new scrollReveal();
        </script>                                
    </body>
</html>