<%@page import="MODEL.PatientModel"%>
<%@page import="DAO.PatientDAO"%>
<%@page import="MODEL.WardModel"%>
<%@page import="DAO.WardDAO"%>
<%@page import="MODEL.BarangayModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.BarangayDAO"%>
<!doctype html>
<html>
    <head>
        <title>QMMC</title>
 
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/animate.min.css">
        <link type="text/css" rel="stylesheet" href="css/materialize.css"  media="screen,projection"/>	      
        <link type="text/css" rel="stylesheet" href="css/styles.css"/>
        <link type="text/css" rel="stylesheet" href="css/animation.css">
        
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes"/>
        <style> 
            [data-sr] { visibility: hidden; }   
            
            .card .card-action a {
                margin-right: 0px;
            }            
            
        </style>
        <!-- Chart API -->
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages:["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {

            var data = google.visualization.arrayToDataTable([
                ['Count', 'Percentage per division'],
                <%
                    BarangayDAO bdao = new BarangayDAO();
                    LinkedList<BarangayModel> patientCount = bdao.getCountPerBarangaySansSMS();
                    for(int ctr=0; ctr<patientCount.size(); ctr++){
                        out.print("[\'"+patientCount.get(ctr).getBarangayName()+"\', "+patientCount.get(ctr).getPatientCount()+"],");
                    }
                %>            
            ]);

            var options = {
                title: 'Active  Cases', 
                legend: { position: 'bottom'}
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
            }
        </script>
    </head>
    <!-- Start of Body -->
    <body class="grey lighten-4">
        <!-- Start Here -->
        <%
            WardDAO wdao = new WardDAO();
            PatientDAO pdao = new PatientDAO();
            LinkedList<WardModel> wardList;
            LinkedList<BarangayModel> barangayList;
            LinkedList<PatientModel> patientList;
        %>
        <!-- 
            nav bar 
        -->
        <nav style="background: 0; height:50px;">
            <div class="nav-wrapper" id="start-navbar">
                <a href="#!" class="roboto-300">Q M M C - O R M S</a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="admissions.jsp">Admissions</a></li>
                    <li><a href="headnurse-main.jsp">Dashboard</a></li>                    
                    <li><a href="add-user.jsp">Add Staff</a></li>
                    <li><a href="UserLogoutServlet">Log Out</a></li>
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="admissions.jsp">Admissions</a></li>
                    <li><a href="headnurse-main.jsp">Dashboard</a></li>
                    <li><a href="add-user.jsp">Add Staff</a></li>
                    <li><a href="UserLogoutServlet">Log Out</a></li>
                </ul>
            </div>
        </nav>      
        <!-- end of nav bar -->
        <div id="above-fold"></div>
        <!-- below nav bar -->
        <div class="progress hide">
            <div class="indeterminate"></div>
        </div>                   
        <!-- 
            Start of Below the fold content
        -->
        <section>
            <div class="container">
                <div class="card">
                    <div class="card-content">
                        Hello <% out.print(request.getSession().getAttribute("username")); %>
                    </div>
                    <div class="card-action">
                        <div class="row">
                            <div class="col s12 m6 s-border-right">                            
                                <div id="piechart" style="height:22em;"></div>
                            </div>  
                            <!-- 
                                Barangay Modals 
                            -->
                            <div class="col s12 m6">                                
                                <span class="card-title black-text">Barangays</span>                            
                                <div class="card-content no-padding">
                                    <!-- Modal Trigger -->
                                    <%
                                        barangayList = bdao.getCountPerBarangay();
                                        for(int ctr=0; ctr<barangayList.size(); ctr++){
                                    %>
                                    <div class="collection">
                                        <a href="#modal<%out.print(barangayList.get(ctr).getBarangayID());%>" class="collection-item modal-trigger black-text"><%out.print(barangayList.get(ctr).getBarangayName());%></a>
                                    </div>                                                           
                                    <!-- Modal Structure -->
                                    <div id="modal<%out.print(barangayList.get(ctr).getBarangayID());%>" class="modal grey darken-3">
                                        <div class="modal-content">                                            
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col s12 m6">
                                                        <div class="card">
                                                            <div class="card-content">
                                                                <span class="card-title grey-text text-darken-3">
                                                                    Barangay Information
                                                                </span>                                                                
                                                            </div>
                                                            <div class="card-action">
                                                                <%out.print(barangayList.get(ctr).getBarangayName());%><br>
                                                                Contact details:
                                                                <%out.print(barangayList.get(ctr).getBarangayContact());%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col s12 m6">
                                            <div class="card">
                                                <div class="card-content">
                                                    <span class="card-title grey-text text-darken-3">
                                                        Medical Information
                                                    </span>                                                                
                                                </div>
                                                <div class="card-action">
                                                    <div>
                                                        Outbreak Count: <% out.print(barangayList.get(ctr).getPatientCount()); %>
                                                    </div>
                                                    <br>                                                                
                                                    <a class="waves-effect blue accent-2 white-text waves-light btn mo" style="width: 100%" href="AlertBarangayServlet?=<%out.print(barangayList.get(ctr).getBarangayID());%>">
                                                            <i class="material-icons right"></i>
                                                                Alert Barangay
                                                        </a>
                                                    </div>                                                                
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer grey">
                                            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat blue-text text-accent-4">Close</a>
                                        </div>
                                    </div>   
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-action">
                        <div class="row">
                            <div class="col s6 m2">
                                <div class="card">
                                    <a href="protocol.jsp">
                                        <div class="card-content">
                                            Protocols
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m2">
                                <div class="card">
                                    <a href="nurse-list.jsp">
                                        <div class="card-content">
                                            Nurse List
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m2">
                                <div class="card">
                                    <a href="patient-list.jsp">
                                        <div class="card-content">
                                            Patients List
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m2">
                                <div class="card">
                                    <a href="supply.jsp">
                                        <div class="card-content">
                                            Supply Page
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m2">
                                <div class="card">
                                    <a href="sms-main.jsp">
                                        <div class="card-content">
                                            SMS Page
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m2">
                                <div class="card">
                                    <a href="contacts.jsp">
                                        <div class="card-content">
                                            Contacts
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>                    
                
                <div class="row">
                    <!-- Left Side -->
                    <div class="col s12 m6">
                        <div class="card " >
                            <div class="card-content green accent-4">
                                <span class="card-title">
                                    Wards (Patient #)
                                </span>
                            </div>
                            <div class="card-content white">                                
                                <table class="hoverable centered">
                                    <thead>
                                        <tr>
                                            <th data-field="ward-name">Ward Name</th>
                                            <th data-field="ward-patients">Patients</th>
                                            <th data-field="ward-max">Max</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                            wardList = wdao.getPatientCountPerWard();
                                            for(int ctr=0; ctr<wardList.size(); ctr++){
                                        %>
                                        <tr>
                                            <td><% out.print(wardList.get(ctr).getWardName()); %></td>
                                            <td><% out.print(wardList.get(ctr).getCurrentNumber()); %></td>
                                            <td><% out.print(wardList.get(ctr).getCapacity()); %></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                    
                                </table>
                            </div>
                        </div>
                        <div class="card " data-sr="reset enter bottom move 40px">
                            <div class="card-content green accent-4">
                                <span class="card-title">
                                    Wards (Staff #)
                                </span>
                            </div>
                            <div class="card-content white">                                
                                <table class="hoverable centered">
                                    <thead>
                                        <tr>
                                            <th data-field="ward-name">Ward Name</th>
                                            <th data-field="ward-patients">Staff</th>
                                            <th data-field="ward-max">Max</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                            wardList = wdao.getStaffCountPerWard();
                                            for(int ctr=0; ctr<wardList.size(); ctr++){
                                        %>
                                        <tr>
                                            <td><% out.print(wardList.get(ctr).getWardName()); %></td>
                                            <td><% out.print(wardList.get(ctr).getCurrentNumber()); %></td>
                                            <td><% out.print(wardList.get(ctr).getCapacity()); %></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                    
                                </table>
                            </div>
                        </div>
                        <div class="card" data-sr="reset enter bottom move 40px">
                            <div class="card-content indigo lighten-2">
                                <span class="card-title">Discharged Patients</span>
                            </div>
                            <div class="card-content">
                                <table class="centered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Condition</th>
                                            <th>Ward</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            patientList = pdao.getDischargedPatients();
                                            for(int ctr=0; ctr<patientList.size(); ctr++){
                                        %>
                                        <tr>
                                            <td><a href="patient-profile.jsp?patient=<%out.print(patientList.get(ctr).getPatientID());%>"><%out.print(patientList.get(ctr).getPatientLastName()+", "+patientList.get(ctr).getPatientFirstName());%></a></td>
                                            <td><%out.print(patientList.get(ctr).getPatientDiagnosis());%></td>
                                            <td><%out.print(patientList.get(ctr).getPatientWard());%></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Right Side -->
                    <div class="col s12 m6">
                        <div class="card" >
                            <div class="card-content orange">
                                <span class="card-title">
                                    5 Latest Incoming Patients
                                </span>
                                <div class="right">
                                    <a class="btn-large btn-floating orange center" href="patient-list.jsp">ALL</a>
                                </div>
                            </div>
                            <div class="card-content">
                                <table class="centered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Condition</th>
                                            <th>Ward</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            patientList = pdao.getLatestTenPatients();
                                            for(int ctr=0; ctr<patientList.size(); ctr++){
                                        %>
                                        <tr>
                                            <td><a href="patient-profile.jsp?patient=<%out.print(patientList.get(ctr).getPatientID());%>"><%out.print(patientList.get(ctr).getPatientLastName()+", "+patientList.get(ctr).getPatientFirstName());%></a></td>
                                            <td><%out.print(patientList.get(ctr).getPatientDiagnosis());%></td>
                                            <td><%out.print(patientList.get(ctr).getPatientWard());%></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card" data-sr="reset enter bottom move 40px">
                            <div class="card-content orange">
                                <span class="card-title">
                                    Latest Outgoing Patients
                                </span>
                                <div class="right">
                                    <a class="btn-large btn-floating orange center" href="patient-list.jsp">ALL</a>
                                </div>
                            </div>
                            <div class="card-content no">
                                <table class="centered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Condition</th>
                                            <th>Ward</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            patientList = pdao.getLatestTenDischargedPatients();
                                            for(int ctr=0; ctr<patientList.size(); ctr++){
                                        %>
                                        <tr>
                                            <td><a href="patient-profile.jsp?patient=<%out.print(patientList.get(ctr).getPatientID());%>"><%out.print(patientList.get(ctr).getPatientLastName()+", "+patientList.get(ctr).getPatientFirstName());%></a></td>
                                            <td><%out.print(patientList.get(ctr).getPatientDiagnosis());%></td>
                                            <td><%out.print(patientList.get(ctr).getPatientWard());%></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card" data-sr="reset enter bottom move 40px">
                            <div class="card-content grey darken-3">
                                <span class="card-title">Casualty Count</span>
                            </div>
                            <div class="card-content">
                                <table class="hoverable centered">
                                    <thead>
                                        <tr>
                                            <th>Cause</th>
                                            <th>Count</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            patientList = pdao.getPatientCountPerDiagnosisSansDetails();
                                            for(int ctr=0; ctr<patientList.size(); ctr++){     
                                        %>
                                        <tr> 
                                            <!--Used diagnosis and ID fields instead of creating a new object. Trying to save memory.-->
                                            <td><% out.print(patientList.get(ctr).getPatientDiagnosis()); %></td>
                                            <td><% out.print(patientList.get(ctr).getPatientID()); %></td>                                    
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    
                    
                </div>
            </div>
        </section>
        <!-- Do Not Go Beyond Here -->
        <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
      	<script type="text/javascript" src="js/materialize.min.js"></script>
        
      	<script src='js/scrollReveal.min.js'></script>
        <script src="js/laurenz.js"></script>
        <script type="text/javascript">
      		$(document).ready(
                function(){
                    $(".button-collapse").sideNav();
                    $('.modal-trigger').leanModal();
      		    }
            );
            
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