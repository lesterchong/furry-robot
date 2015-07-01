<%@page import="MODEL.PatientModel"%>
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
            PatientDAO pdao = new PatientDAO();
            PatientModel patientModel = pdao.getPatientByID(Integer.parseInt(request.getParameter("patient")));
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
                        <div class="card-content red accent-2 white-text">
                            <div class="row">
                                <div class="col s12 m9">
                                    <h4>
                                        <% out.print(patientModel.getPatientLastName()); %>, 
                                        <br>
                                        <% out.print(patientModel.getPatientFirstName()); %>
                                    </h4>                                    
                                </div>                                
                                <div class="col s12 m3">
                                    <br>
                                    <p>
                                        <b>Ward:</b> 
                                        <% out.print(patientModel.getPatientWard()); %>
                                    </p>
                                    <p> 
                                        <b>Guardian: </b>
                                        <% out.print(patientModel.getEmergencyCompanion()); %>
                                    </p>
                                    <p>
                                        <b>Guardian Contact: </b>                                        
                                    </p>
                                    <p><% out.print(patientModel.getEmegergencyContact()); %></p>
                                </div>
                            </div>    
                        </div>
                        <div class="card-action red accent-1 white-text">
                            <div class="right">
                                <a href="#" class="white-text">Transfer</a>
                                <a href="AddDischargeServlet?patient=<%out.print(patientModel.getPatientID());%>" class="white-text">Discharge</a>
                            </div>
                            <span class="transparent-text">.</span>
                        </div>
                    </div>
                </div>
                <div class="col s12 m6">
                    <div class="card">
                        <form method="POST" action="UpdatePatientVitalsServlet">
                            <input type="hidden" value="<%out.print(patientModel.getPatientID());%>" name="patientID"/>
                            <div class="card-content orange">
                                <span class="card-title">Patient Vitals</span>
                                <div class="right">                                
                                    <button type="submit" class="btn-floating btn-large waves-effect waves-light orange accent-4"><i class="material-icons">done</i></a>
                                </div>
                            </div>
                            <div class="card-content">
                                <div class="input-field col s4">
                                    <input id="temperature" type="text" class="validate" value="" name="temperature">
                                    <label for="temperature" class="active"> Temperature (in Celcius) </label>
                                </div>
                                <div class="input-field col s4">
                                    <input id="bp" type="text" class="validate" value="" name="bloodPressure">
                                    <label for="bp" class="active"> Blood Pressure (BP) </label>
                                </div>
                                <div class="input-field col s4">
                                    <input type="date" class="datepicker" name="lastDextrose">
                                    <label for="date">Last Dextrose</label>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="card">
                        <form method="POST" action="UpdatePatientSymptomServlet">
                            <input type="hidden" value="<%out.print(patientModel.getPatientID());%>" name="patientID"/>
                            <div class="card-content orange">
                                <span class="card-title">
                                    Pains/Symptoms
                                </span>
                                <div class="right">                                
                                    <button type="submit"  class="btn-floating btn-large waves-effect waves-light orange accent-4"><i class="material-icons">done</i></a>
                                </div>
                            </div>
                            <div class="card-content">
                                <form>
                                    <p>
                                        <input type="checkbox" id="pain-ab" name="abdominalPain" value="true"/>
                                        <label for="pain-ab">Abdominal Pain</label>
                                    </p>
                                    <p>
                                        <input type="checkbox" id="pain-pe" name="pleuralEffusion" value="true"/>
                                        <label for="pain-pe">Pleural Effusion</label>
                                    </p>
                                    <p>
                                        <input type="checkbox" id="pain-as" name="ascites" value="true"/>
                                        <label for="pain-as">Ascites</label>
                                    </p>
                                    <p>
                                        <input type="checkbox" id="pain-hy" name="hypertension" value="true"/>
                                        <label for="pain-hy">Hypertension</label>
                                    </p>
                                    <br>
                                    <div class="input-field col s4">
                                        <input id="pain-ja" type="text" class="validate" name="jaundice">
                                        <label for="pain-ja" class="active"> Jaundice </label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="pain-li" type="text" class="validate" name="liver">
                                        <label for="pain-li" class="active"> Liver (right cm) </label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="pain-sp" type="text" class="validate" name="spleen">
                                        <label for="pain-sp" class="active"> Spleen (BRCM) </label>
                                    </div>
                                </form>
                            </div>
                        </form>
                    </div>
                    <div class="card">
                        <div class="card-content orange">
                            <span class="card-title">Known Allergies</span>
                        </div>
                        <div class="card-content">
                            <p>
                                <% out.print(patientModel.getAllergies()); %>
                            </p>
                        </div>
                    </div>
                </div>                
                <div class="col s12 m6">
                    <div class="card">
                        <form method="POST" action="UpdateProcedureServlet">
                            <input type="hidden" name="patientID" value="<%out.print(patientModel.getPatientID());%>"/>
                            <div class="card-content orange">
                                <span class="card-title">Lab Procedures</span>
                                <div class="right">                                
                                    <button type="submit" class="btn-floating btn-large waves-effect waves-light orange accent-4"><i class="material-icons">done</i></a>
                                </div>
                            </div>
                            <div class="card-content">
                                <p>
                                    <input type="checkbox" id="lab-he" value="true" name="hemoglobin"/>
                                    <label for="lab-he">Hemoglobin</label>
                                </p>
                                <p>
                                    <input type="checkbox" id="lab-ht" value="true" name="hemocrit"/>
                                    <label for="lab-ht">Hemotocrit</label>
                                </p>
                                <p>
                                    <input type="checkbox" id="lab-ast" value="true" name="ast"/>
                                    <label for="lab-ast">AST</label>
                                </p>
                                <p>
                                    <input type="checkbox" id="lab-alt" value="true" name="alt"/>
                                    <label for="lab-alt">ALT</label>
                                </p>
                                <p>
                                    <input type="checkbox" id="lab-to" value="true" name="tourniquet"/>
                                    <label for="lab-to">Tourniquet</label>
                                </p>
                                <p>
                                    <input type="checkbox" id="lab-cbc" value="true" name="cbc"/>
                                    <label for="lab-cbc">CBC</label>
                                </p>
                                <p>
                                    <input type="checkbox" id="lab-pl" value="true" name="platelets"/>
                                    <label for="lab-pl">Platelets</label>
                                </p>
                                <p>
                                    <input type="checkbox" id="lab-wbc" value="true" name="wbc"/>
                                    <label for="lab-wbc">WBC</label>
                                </p>
                            </div>
                        </form>
                    </div>
                    <div class="card">
                        <div class="card-content orange">
                            <span class="card-title">History</span>
                        </div>
                        <div class="card-content">
                            Vitals<br>
                            <%
                                for(int ctr =0; ctr<patientModel.getHistoryVitals().size(); ctr++){
                            %>
                            <p>Date Taken: <% out.print(patientModel.getHistoryVitals().get(ctr).getDateTaken()); %></p>
                            <p>Temperature: <% out.print(patientModel.getHistoryVitals().get(ctr).getTemperature()); %></p>
                            <p>Blood Pressure: <% out.print(patientModel.getHistoryVitals().get(ctr).getBloodPressure()); %></p>
                            <p>Last Dextrose: <% out.print(patientModel.getHistoryVitals().get(ctr).getLastDextrose()); %></p>
                            <br>
                            <%}%>
                            Procedures: <br>
                            
                            <%
                                
                            %>
                            
                            Symptoms: <br>
                            <%
                                for(int ctr=0; ctr<patientModel.getHistorySymptoms().size(); ctr++){
                            %>
                            <p>Abdominal Pain: <% out.print(patientModel.getHistorySymptoms().get(ctr).isAbdominalPain()); %></p>
                            <p>Ascites: <% out.print(patientModel.getHistorySymptoms().get(ctr).isAscites()); %></p>
                            <p>Hypertension: <% out.print(patientModel.getHistorySymptoms().get(ctr).isHypotension()); %></p>
                            <p>Pleural Effusion: <% out.print(patientModel.getHistorySymptoms().get(ctr).isPleuralEffusion()); %></p>
                            <p>Jaundice: <% out.print(patientModel.getHistorySymptoms().get(ctr).getJaundice()); %></p>
                            <p>Liver: <% out.print(patientModel.getHistorySymptoms().get(ctr).getLiver()); %></p>
                            <p>Spleen: <% out.print(patientModel.getHistorySymptoms().get(ctr).getSpleean()); %></p>
                            <br>
                            <%}%>
                            
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
      		});
            
            $('.datepicker').pickadate({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 15 // Creates a dropdown of 15 years to control year
              });
      	</script>        
        <script>
          window.sr = new scrollReveal();
        </script>                                
    </body>
</html>