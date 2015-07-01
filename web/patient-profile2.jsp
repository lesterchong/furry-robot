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
            PatientDAO patientDAO = new PatientDAO();
            PatientModel patientModel = patientDAO.getPatientByID(Integer.parseInt(request.getParameter("patientID")));;
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
                    <div class="card hoverable">
                        <div class="card-content red accent-2 white-text">
                            <div class="row">
                                <div class="col s12 m9">
                                    <h4>
                                        <%out.print(patientModel.getPatientLastName());%>, <br>
                                        <%out.print(patientModel.getPatientFirstName());%>
                                    </h4>                                    
                                </div>                                
                                <div class="col s12 m3">
                                    <br>
                                    <p>
                                        <b>Ward:</b> 
                                        <%out.print(patientModel.getPatientWard());%>
                                    </p>
                                    <p> 
                                        <b>Guardian: </b>
                                        <%out.print(patientModel.getEmergencyCompanion());%>
                                    </p>
                                    <p>
                                        <b>Guardian Contact: </b>                                        
                                    </p>
                                    <p><%out.print(patientModel.getEmegergencyContact());%></p>
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
                <div class="col s12">
                    <!-- Complete Lab Procedure -->
                    <div class="card hoverable">
                        <form method="post" action="UpdateProcedureServlet">
                            <input type="hidden" name="patientID" value="<%out.print(patientModel.getPatientID());%>"/>
                        <div class="card-content orange">
                            <span class="card-title">
                                Lab Procedures
                            </span>
                            <div class="right">                                
                                <button type="submit" class="btn-floating btn-large waves-effect waves-light orange accent-4 tooltipped"
                                   data-position="left" data-delay="50" data-tooltip="Press this button to submit edited
                                                                                      information from below">
                                    <i class="material-icons">done</i>
                                </a>
                            </div>
                        </div>
                        
                        <div class="card-content col s12 m6">
                                <div class="row">
                                    <b>Dengue Specific</b>
                                </div> 
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input id="pain-rbc" type="checkbox" class="validate" value="true" name="rbc">
                                        <label for="pain-rbc" class="active"> Red Blood Cells </label>
                                    </div>                                
                                    <div class="input-field col s6">
                                        <input id="pain-hemog" type="checkbox" class="validate" value="true" name="hemocrit">
                                        <label for="pain-hemog" class="active"> Hemotocrit </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-mcvol" type="checkbox" class="validate" value="true" name="mcv">
                                        <label for="pain-mcvol" class="active"> Mean Corpu Volume </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-mchb" type="checkbox" class="validate" value="true" name="mchb">
                                        <label for="pain-mchb" class="active"> Mean Corpu Hb </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-rbcdist" type="checkbox" class="validate" value="true" name="rbcdw">
                                        <label for="pain-rbcdist" class="active"> RBC Distribution Width </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-neutro" type="checkbox" class="validate" value="true" name="differential">
                                        <label for="pain-neutro" class="active"> Differential Count </label>
                                    </div>    
                                </div>
                            </div>
                        <div class="card-content col s12 m6">
                            <div class="row">
                                <b>Leptospirosis Specific</b>
                            </div>
                            <div class="row">                               
                                    <div class="input-field col s6">
                                        <input id="pain-pcv" type="checkbox" class="validate" value="true" name="packed">
                                        <label for="pain-pcv" class="active"> Packed cell Volume </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-sod" type="checkbox" class="validate" value="true" name="sodium">
                                        <label for="pain-sod" class="active"> Sodium </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-potass" type="checkbox" class="validate" value="true" name="potassium">
                                        <label for="pain-potass" class="active"> Potassium </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-chlo" type="checkbox" class="validate" value="true" name="chloride">
                                        <label for="pain-chlo" class="active"> Chloride </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-bico" type="checkbox" class="validate" value="true" name="bicarbonate">
                                        <label for="pain-bico" class="active"> Bicarbonate </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-urea" type="checkbox" class="validate" value="true" name="urea">
                                        <label for="pain-urea" class="active"> Urea </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-creati" type="checkbox" class="validate" value="true" name="creatinine">
                                        <label for="pain-creati" class="active"> Creatinine </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-creapho" type="checkbox" class="validate" value="true" name="creatine">
                                        <label for="pain-creapho" class="active"> Creatine Phosphokinase (U/L) </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-erythro" type="checkbox" class="validate" value="true" name="esr">
                                        <label for="pain-erythro" class="active"> Erythrocyte Sedi. Rate </label>
                                    </div>
                                
                            </div>                            
                        </div>
                            <div class="card-content col s12 m6">
                                <div class="row">
                                    <b>Non Specific</b>
                                </div>                                
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input id="pain-hae" type="checkbox" class="validate" value="true" name="hemoglobin">
                                        <label for="pain-hae" class="active"> Haemoglobin </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-placount" type="checkbox" class="validate" value="true" name="platelet">
                                        <label for="pain-placount" class="active"> Platelet Count </label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="pain-wbc" type="checkbox" class="validate" value="true" name="wbc">
                                        <label for="pain-wbc" class="active"> White Blood Cells </label>
                                    </div>
                                </div>
                            </div> 
                        <div class="card-content  col s12 m6">
                            <div class="row">
                                <b>Others</b>
                            </div>

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
                        </div>
                        </form>
                    </div>
                </div>
                <div class="col s12 m6">
                    <div class="card hoverable">
                        <form method="POST" action="UpdatePatientVitalsServlet">
                            <input type="hidden" name="patientID" value="<%out.print(patientModel.getPatientID());%>"/>
                            <div class="card-content orange">
                                <span class="card-title">Patient Vitals</span>
                                <div class="right">                                
                                    <button type="submit" class="btn-floating btn-large waves-effect waves-light orange accent-4 tooltipped"
                                   data-position="left" data-delay="50" data-tooltip="Press this button to submit edited
                                                                                      information from below">
                                    <i class="material-icons">done</i>
                                </a>
                                </div>
                            </div>
                            <div class="card-content">
                                <div class="row">
                                    <div class="input-field col s4">
                                        <input id="temperature" type="text" class="validate" value="28" name="temperature">
                                        <label for="temperature" class="active"> Temperature (in Celcius) </label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="bp" type="text" class="validate" value="180" name="bloodPressure">
                                        <label for="bp" class="active"> Blood Pressure (BP) </label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input type="date" class="datepicker" name="lastDextrose">
                                        <label for="date" class="active">Last Dextrose</label>
                                    </div>
                                </div>                                
                            </div>
                        </form>
                    </div>
                    <div class="card hoverable">
                        <form method="POST" action="UpdateSymptomServlet">
                            <input type="hidden" name="patientID" value="<%out.print(patientModel.getPatientID());%>"/>
                            <div class="card-content orange">
                                <span class="card-title">
                                    Pains/Symptoms
                                </span>
                                <div class="right">                                
                                    <button type="submit" class="btn-floating btn-large waves-effect waves-light orange accent-4 tooltipped"
                                       data-position="left" data-delay="50" data-tooltip="Press this button to submit edited
                                                                                          information from below">
                                        <i class="material-icons">done</i>
                                    </a>
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
                                        <input type="checkbox" id="pain-hy" name="hypotension" value="true"/>
                                        <label for="pain-hy">Hypertension</label>
                                    </p>
                                    <br>
                                    <div class="input-field col s4">
                                        <input id="pain-ja" type="text" class="validate" value="180" name="jaundice">
                                        <label for="pain-ja" class="active"> Jaundice </label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="pain-li" type="text" class="validate" value="180" name="liver">
                                        <label for="pain-li" class="active"> Liver (right cm) </label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="pain-sp" type="text" class="validate" value="180" name="spleen">
                                        <label for="pain-sp" class="active"> Spleen (BRCM) </label>
                                    </div>
                                </form>
                            </div>
                        </form>
                    </div>
                    
                    
                    
                                        
                </div>                
                <div class="col s12 m6">
                     
                    <div class="card hoverable">
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
                                for(int ctr =0; ctr<patientModel.getHistoryProcedure().size(); ctr++){
                            %>
                            <p>Mean Corpu Volume: <%out.print(patientModel.getHistoryProcedure().get(ctr).isMcv());%></p>
                            <p>Mean Corpu Hb: <%out.print(patientModel.getHistoryProcedure().get(ctr).isMchb());%></p>
                            <p>Hemotocrit: <%out.print(patientModel.getHistoryProcedure().get(ctr).isHemocrit());%></p>
                            <p>Red Blood Cells: <%out.print(patientModel.getHistoryProcedure().get(ctr).isRbc());%></p>
                            <p>Differential Count: <%out.print(patientModel.getHistoryProcedure().get(ctr).isDifferential());%></p>
                            <p>RBC Distribution Width: <%out.print(patientModel.getHistoryProcedure().get(ctr).isRbcdw());%></p>
                            <p>Chloride: <%out.print(patientModel.getHistoryProcedure().get(ctr).isChloride());%></p>
                            <p>Urea: <%out.print(patientModel.getHistoryProcedure().get(ctr).isUrea());%></p>
                            <p>Creatine: <%out.print(patientModel.getHistoryProcedure().get(ctr).isCreatine());%></p>
                            <p>Packed Cell Volume: <%out.print(patientModel.getHistoryProcedure().get(ctr).isPacked());%></p>
                            <p>Sodium: <%out.print(patientModel.getHistoryProcedure().get(ctr).isSodium());%></p>
                            <p>Potassium: <%out.print(patientModel.getHistoryProcedure().get(ctr).isPotassium());%></p>
                            <p>Bicarbonate: <%out.print(patientModel.getHistoryProcedure().get(ctr).isBicarbonate());%></p>
                            <p>Creatinine: <%out.print(patientModel.getHistoryProcedure().get(ctr).isCreatinine());%></p>
                            <p>Erythrocyte Sedi. Rate: <%out.print(patientModel.getHistoryProcedure().get(ctr).isEsr());%></p>
                            <p>Hemoglobin: <%out.print(patientModel.getHistoryProcedure().get(ctr).isHemoglobin());%></p>
                            <p>Platelet Count: <%out.print(patientModel.getHistoryProcedure().get(ctr).isPlatelet());%></p>
                            <p>White Blood Cells: <%out.print(patientModel.getHistoryProcedure().get(ctr).isWbc());%></p>
                            <p>AST: <%out.print(patientModel.getHistoryProcedure().get(ctr).isAst());%></p>
                            <p>ALT: <%out.print(patientModel.getHistoryProcedure().get(ctr).isAlt());%></p>
                            <p>Tourniquet: <%out.print(patientModel.getHistoryProcedure().get(ctr).isTourniquet());%></p>
                            <p>CBC: <%out.print(patientModel.getHistoryProcedure().get(ctr).isCbc());%></p>
                            <p>Date Taken: <%out.print(patientModel.getHistoryProcedure().get(ctr).getDateTaken());%></p>
                            <br>
                            <%}%>
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
                    <div class="card hoverable">
                        <div class="card-content orange">
                            <span class="card-title">Known Allergies</span>
                        </div>
                        <div class="card-content">
                            <p>
                                <%out.print(patientModel.getAllergies());%>
                            </p>
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
                $('.tooltipped').tooltip({delay: 50});
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