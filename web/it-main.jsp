<%@page import="MODEL.ReferenceModel"%>
<%@page import="DAO.ReferenceDAO"%>
<%@page import="MODEL.PatientModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.PatientDAO"%>
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
            #map-canvas {
                height: 500px;
            }
        </style>
        <!-- Map API -->
        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <script>
            function initialize() {
                var mapCanvas = document.getElementById('map-canvas');
                var mapOptions = {
                    center: new google.maps.LatLng(14.6213346, 121.0725841),
                    zoom: 16,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }
                var map = new google.maps.Map(mapCanvas, mapOptions)
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
        <!-- Chart API -->
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Count', 'Percentage per Age'],
                    ['Children', 6],
                    ['Adult', 30],
                    ['Elderly', 15]
                ]);

                var options = {
                    title: 'Active  Cases',
                    legend: {position: 'bottom'}
                };

                var chart = new google.visualization.PieChart(document.getElementById('agechart'));

                chart.draw(data, options);
            }
        </script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Count', 'Percentage per Ward'],
                    ['WARD A', 6],
                    ['WARD B', 30],
                    ['WARD C', 15],
                    ['WARD D', 22]
                ]);

                var options = {
                    title: 'Active  Cases',
                    legend: {position: 'bottom'}
                };

                var chart = new google.visualization.PieChart(document.getElementById('wardchart'));

                chart.draw(data, options);
            }
        </script>
    </head>
    <!-- Start of Body -->
    <body class="grey lighten-4">
        <!-- Start Here -->
        <%
            PatientDAO patientDAO = new PatientDAO();
            ReferenceDAO refDAO = new ReferenceDAO();
            LinkedList<PatientModel> patientList;
            LinkedList<ReferenceModel> refList;
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
                    <li><a href="it-main.jsp">Dashboard</a></li>                    
                    <li><a href="GenerateDischargeReport">Generate Discharge Report</a></li>
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="admissions.jsp">Admissions</a></li>
                    <li><a href="it-main.jsp">Dashboard</a></li>
                    <li><a href="GenerateDischargeReport">Generate Discharge Report</a></li>
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
                <div class="row">
                    <div class="col s12">
                        <div class="card">
                            <div class="card-content">
                                Hello Username                    
                            </div>
                            <div class="card-action">
                                <div class="row">
                                    <div class="col s12 m7 s-border-right">                            
                                        <div id="map-canvas"></div>
                                    </div>  
                                    <!-- 
                                        Barangay Modals 
                                    -->
                                    <div class="col s12 m5">                                
                                        <div class="card">
                                            <div class="card-content blue">
                                                <span class="card-title"> Some Information</span>
                                            </div>
                                            <div class="card-content">
                                                Information
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
                <div class="card " data-sr="reset enter bottom move 40px">
                    <div class="card-content green accent-4">
                        <span class="card-title">
                            Patients Pending Transfer
                        </span>
                    </div>
                    <div class="card-content white">                                
                        <table class="hoverable centered">
                            <thead>
                                <tr>
                                    <th data-field="">Patient Name</th>
                                    <th data-field="">Ward</th>
                                    <th data-field="">Diagnosis</th>
                                    <th data-field="">Date Admitted</th>
                                    <th data-field="">Action</th>
                                    <th data-field="">Hospital</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <%
                                    patientList = patientDAO.getPendingTransferPatients();
                                    for(int ctr=0; ctr<patientList.size(); ctr++){
                                %>
                                <form method="POST" action="TransferPatientServlet">
                                    <input type="hidden" value="<%out.print(patientList.get(ctr).getPatientID());%>" name="patientID"/>
                                <tr>
                                    <td><%out.print(patientList.get(ctr).getPatientLastName()+", "+patientList.get(ctr).getPatientFirstName());%></td>
                                    <td><%out.print(patientList.get(ctr).getPatientWard());%></td>
                                    <td><%out.print(patientList.get(ctr).getPatientDiagnosis());%></td>
                                    <td><%out.print(patientList.get(ctr).getDateAdmitted());%></td>
                                    <td><button type="submit"/>Approve Transfer To</td>
                                    <td>
                                        <select name="hospitalID" class="browser-default">
                                            <%
                                                refList = refDAO.getHospitals();
                                                for(int ctr2=0; ctr2<refList.size(); ctr2++){
                                            %>
                                            <option value="<%out.print(refList.get(ctr2).getReferenceID());%>"><%out.print(refList.get(ctr2).getReferenceName());%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>
                                </form>
                                <%}%>
                            </tbody>                                    
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m6">
                        <div class="card">
                            <div class="card-content orange">
                                <span class="card-title">Ward</span>
                            </div>
                            <div class="card-content">
                                <div id="agechart" style="height:22em;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m6">
                        <div class="card">
                            <div class="card-content orange">
                                <span class="card-title">Age</span>
                            </div>
                            <div class="card-content">
                                <div id="wardchart" style="height:22em;"></div>
                            </div>
                        </div>
                    </div>
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
                    function() {
                        $(".button-collapse").sideNav();
                        $('.modal-trigger').leanModal();
                    }
            );

            var options = [
                {selector: '#sec-2', offset: 200, callback: 'changeNavbarToDark()'},
                {selector: '#sec-3', offset: 200, callback: 'changeNavbarToWhite()'},
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