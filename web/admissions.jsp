<%@page import="MODEL.ReferenceModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.ReferenceDAO"%>
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
        <style> [data-sr] { visibility: hidden; } </style>
        <style>
            body{
                background: rgb(250,250,250);
            }
        </style>
    </head>
    <!-- Start of Body -->
    <body class="teal darken-4"> 
        <!-- Populate Fields -->
        <%
            ReferenceDAO dao = new ReferenceDAO();
            LinkedList<ReferenceModel> list;
        %>
        <!-- Start Here -->
        <!-- nav bar -->
        <nav style="background: 0; height:50px;">
            <div class="nav-wrapper" id="start-navbar">
                <a href="#!" class="roboto-300">Q M M C - O R M S</a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="admissions.html">Admissions</a></li>
                    <li><a href="nurse-board2.html">Dashboard</a></li>                    
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="admissions.html">Admissions</a></li>
                    <li><a href="nurse-board2.html">Dashboard</a></li>                    
                </ul>
            </div>
        </nav>      
        <!-- end of nav bar -->
        <div id="above-fold"></div>
        <!-- below nav bar -->
        <div class="container">
            <div class="row center">
                <!-- start of admission form -->                
                
                <div class="col s12">
                    <div class="card">
                        <div class="card-content">
                            <!-- Title -->
                            <div class="card-title">
                                <span class="grey-text text-darken-4 center">
                                    Admission Form
                                </span>
                            </div>                        
                            <!-- input boxes -->
                            <!-- Patient Form -->
                            <form id="admission_form" action="AddAdmittanceServlet" method="POST">
                                <div id="patient" class="row">
                                    <h5 class="roboto-300">
                                        Patient Name
                                    </h5>                            
                                    <div class="input-field col m6 s12">
                                        <input id="p_lastname" type="text" class="validate" name="patientLastName">
                                        <label for="p_lastname">Patient's Last Name</label>
                                    </div>
                                    <div class="input-field col m6 s12">
                                        <input id="p_firstname" type="text" class="validate" name="patientFirstName">
                                        <label for="p_firstname">First Name</label>
                                    </div>
                                    <div class="input-field col m2 s12">
                                        <input id="p_age" type="text" class="validate" name="patientAge">
                                        <label for="p_age">Age</label>
                                    </div>
                                    <div class="input-field col m3 s12">
                                        <input type="date" class="datepicker" name="patientBirthdate">
                                        <label for="p_birthdate">Birthdate</label>
                                    </div>
                                    <div class="input-field col m4 s12">
                                        <input id="p_number" type="text" class="validate" name="patientPhoneNumber">
                                        <label for="p_number">Phone Number</label>
                                    </div>
                                    <div class="input-field col m3 s12">                                
                                        <select id="p_marital" class="browser-default" name="patientCivilStatus">                                    
                                            <option value="" disabled selected>Civil Status</option>
                                            <%
                                                list = dao.getCivilStatus();
                                                for(int ctr=0; ctr<list.size(); ctr++)
                                                    out.println("<option value="+list.get(ctr).getReferenceID()+">"+list.get(ctr).getReferenceName()+"</option>");
                                            %>
                                        </select>                                
                                    </div>  
                                    <div class="input-field col m8 s12">
                                        <textarea id="p_address" class="materialize-textarea" name="patientAddress"></textarea>
                                        <label for="p_address">Patient's Address</label>
                                    </div>
                                    <div class="input-field col m4 s12">                                
                                        <select id="p_address" class="browser-default" name="patientBarangay">                                    
                                            <option value="" disabled selected>BRGY</option>
                                            <%
                                                list = dao.getBarangays();
                                                for(int ctr=0; ctr<list.size(); ctr++)
                                                    out.println("<option value="+list.get(ctr).getReferenceID()+">"+list.get(ctr).getReferenceName()+"</option>");
                                            %>
                                        </select>                                
                                    </div>
                                    <div class="input-field col m8 s12">
                                        <textarea id="p_incident_address" class="materialize-textarea" name="incidentLocation"></textarea>
                                        <label for="p_address">Incident Location</label>
                                    </div>                                    
                                    <div class="input-field col m4 s12">                                
                                        <select id="p_incident_address" class="browser-default" name="incidentBarangay">                                    
                                            <option value="" disabled selected>BRGY</option>
                                            <%
                                                list = dao.getBarangays();
                                                for(int ctr=0; ctr<list.size(); ctr++)
                                                    out.println("<option value="+list.get(ctr).getReferenceID()+">"+list.get(ctr).getReferenceName()+"</option>");
                                            %>
                                        </select>                                
                                    </div>
                                    <div class="input-field col m12 s12">
                                        <textarea id="p_allergies" class="materialize-textarea" name="knownAllergy"></textarea>
                                        <label for="p_allergies">Known Allergies</label>
                                    </div>
                                </div>              
                                
                                <!-- Companion's Information -->
                                <div id="companion" class="row">
                                    <h5 class="roboto-300">
                                        Companion's Name
                                    </h5>                            
                                    <div class="input-field col m6 s12">
                                        <input id="c_lastname" type="text" class="validate" name="companionLastName">
                                        <label for="c_lastname">Last Name</label>
                                    </div>
                                    <div class="input-field col m6 s12">
                                        <input id="c_firstname" type="text" class="validate" name="companionFirstName">
                                        <label for="c_firstname">First Name</label>
                                    </div>
                                    <div class="input-field col m2 s12">
                                        <input id="c_age" type="text" class="validate" name="companionAge">
                                        <label for="c_age">Age</label>
                                    </div>
                                    <div class="input-field col m3 s12">
                                        <input type="date" class="datepicker" name="companionBirthdate">
                                        <label for="c_birthdate">Birthdate</label>
                                    </div>
                                    <div class="input-field col m4 s12">
                                        <input id="c_number" type="text" class="validate" name="companionPhoneNumber">
                                        <label for="c_number">Phone Number</label>
                                    </div>
                                    <div class="input-field col m3 s12">                                
                                        <select id="c_relationship" class="browser-default" name="companionRelationship">
                                            <option value="" disabled selected>Relationship with Patient</option>
                                            <%
                                                list = dao.getRelationships();
                                                for(int ctr=0; ctr<list.size(); ctr++)
                                                    out.println("<option value="+list.get(ctr).getReferenceID()+">"+list.get(ctr).getReferenceName()+"</option>");
                                            %>
                                        </select>                                
                                    </div>  
                                    <div class="input-field col m8 s12">
                                        <textarea id="c_address" class="materialize-textarea" name="companionAddress"></textarea>
                                        <label for="c_address">Companion's Address</label>
                                    </div>
                                    <div class="input-field col m4 s12">                                
                                        <select id="c_address" class="browser-default" name="companionBarangay">                                    
                                            <option value="" disabled selected>BRGY</option>
                                            <%
                                                list = dao.getBarangays();
                                                for(int ctr=0; ctr<list.size(); ctr++)
                                                    out.println("<option value="+list.get(ctr).getReferenceID()+">"+list.get(ctr).getReferenceName()+"</option>");
                                            %>
                                        </select>                                
                                    </div>
                                </div>
                                <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                                    <i class="mdi-content-send right"></i>
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
      	<script type="text/javascript">
      		$(document).ready(function(){
    			$(".button-collapse").sideNav();
      		});
      	</script>
        <script src='js/scrollReveal.min.js'></script>
        <script>

          window.sr = new scrollReveal();

        </script>        
        <script src="js/laurenz.js"></script>                  
        
        <script>            
          $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15 // Creates a dropdown of 15 years to control year
          });
        </script>
        
    </body>
</html>