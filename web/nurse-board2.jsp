
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.AdmittanceDAO"%>
<%@page import="MODEL.BarangayModel"%>
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
        </style>
    </head>
    <!-- Start of Body -->
    <body class="blue-grey darken-4">
        <!--JSP Stuff-->
        <%
            AdmittanceDAO dao = new AdmittanceDAO();
            LinkedList<BarangayModel> barangayList;
        %>
        <!-- Start Here -->
        
        <!-- nav bar -->
        <nav style="background: 0; height:50px;">
            <div class="nav-wrapper" id="start-navbar">
                <a href="#!" class="roboto-300">Q M M C - O R M S</a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="admissions.jsp">Admissions</a></li>
                    <li><a href="nurse-board2.html">Dashboard</a></li>                    
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="admissions.jsp">Admissions</a></li>
                    <li><a href="nurse-board2.html">Dashboard</a></li>                    
                </ul>
            </div>
        </nav>      
        <!-- end of nav bar -->
        <div id="above-fold"></div>
        <!-- below nav bar -->
        <div class="progress hide">
            <div class="indeterminate"></div>
        </div>   
        <div id="" class="container">
            <div class="row">
                <!-- Start of week view @weekview-->
                <div class="col s12 m4">
                    <div id="weekview" class="fixed">
                        <div class="col s12 ">

                            <ul class="collapsible popout collection with-header">         
                                <li class="collection-header "><h4>Weekly Assignments</h4></li>
                                <!-- MONDAY -->
                                <li>
                                    <div class="collapsible-header">
                                        Monday                                
                                    </div>   
                                    <div class="collapsible-body grey lighten-3">
                                        <p>Assigned Staff</p>
                                        <ul class="collapsible popout">
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Laurenz tolentino
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>
                                                    <!--
                                                    <div>                                                        
                                                        <div id="assigned-patients">
                                                            <ul class="collapsible" data-collapsible="accordion">
                                                                <li>
                                                                    <div class="collapsible-header">
                                                                        <i class="mdi-social-person"></i>
                                                                        Assigned Patients
                                                                    </div>
                                                                    <div class="collapsible-body light-blue lighten-4">Miranda Kerr</div>
                                                                    <div class="collapsible-body light-blue lighten-4">Steve Kerr</div>
                                                                </li>                                                                    
                                                            </ul>
                                                        </div>                                                                                                              
                                                    </div>
                                                    -->
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Taylor Swift
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Emma Watson
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Miranda Kerr
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <!-- TUESDAY -->
                                <li>
                                    <div class="collapsible-header">
                                        Tuesday                                
                                    </div>   
                                    <div class="collapsible-body grey lighten-3">
                                        <p>Assigned Staff</p>
                                        <ul class="collapsible popout">
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Laurenz tolentino
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>
                                                    <!--
                                                    <div>                                                        
                                                        <div id="assigned-patients">
                                                            <ul class="collapsible" data-collapsible="accordion">
                                                                <li>
                                                                    <div class="collapsible-header">
                                                                        <i class="mdi-social-person"></i>
                                                                        Assigned Patients
                                                                    </div>
                                                                    <div class="collapsible-body light-blue lighten-4">Miranda Kerr</div>
                                                                    <div class="collapsible-body light-blue lighten-4">Steve Kerr</div>
                                                                </li>                                                                    
                                                            </ul>
                                                        </div>                                                                                                              
                                                    </div>
                                                    -->
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Taylor Swift
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Emma Watson
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Miranda Kerr
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <!-- WEDNESDAY -->
                                <li>
                                    <div class="collapsible-header">
                                        Wednesday                                
                                    </div>   
                                    <div class="collapsible-body grey lighten-3">
                                        <p>Assigned Staff</p>
                                        <ul class="collapsible popout">
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Laurenz tolentino
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>
                                                    <!--
                                                    <div>                                                        
                                                        <div id="assigned-patients">
                                                            <ul class="collapsible" data-collapsible="accordion">
                                                                <li>
                                                                    <div class="collapsible-header">
                                                                        <i class="mdi-social-person"></i>
                                                                        Assigned Patients
                                                                    </div>
                                                                    <div class="collapsible-body light-blue lighten-4">Miranda Kerr</div>
                                                                    <div class="collapsible-body light-blue lighten-4">Steve Kerr</div>
                                                                </li>                                                                    
                                                            </ul>
                                                        </div>                                                                                                              
                                                    </div>
                                                    -->
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Taylor Swift
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Emma Watson
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Miranda Kerr
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <!-- THURSDAY -->
                                <li>
                                    <div class="collapsible-header">
                                        Thursday                                
                                    </div>   
                                    <div class="collapsible-body grey lighten-3">
                                        <p>Assigned Staff</p>
                                        <ul class="collapsible popout">
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Laurenz tolentino
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>
                                                    <!--
                                                    <div>                                                        
                                                        <div id="assigned-patients">
                                                            <ul class="collapsible" data-collapsible="accordion">
                                                                <li>
                                                                    <div class="collapsible-header">
                                                                        <i class="mdi-social-person"></i>
                                                                        Assigned Patients
                                                                    </div>
                                                                    <div class="collapsible-body light-blue lighten-4">Miranda Kerr</div>
                                                                    <div class="collapsible-body light-blue lighten-4">Steve Kerr</div>
                                                                </li>                                                                    
                                                            </ul>
                                                        </div>                                                                                                              
                                                    </div>
                                                    -->
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Taylor Swift
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Emma Watson
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Miranda Kerr
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <!-- FRIDAY -->
                                <li>
                                    <div class="collapsible-header">
                                        Friday                                
                                    </div>   
                                    <div class="collapsible-body grey lighten-3">
                                        <p>Assigned Staff</p>
                                        <ul class="collapsible popout">
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Laurenz tolentino
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>
                                                    <!--
                                                    <div>                                                        
                                                        <div id="assigned-patients">
                                                            <ul class="collapsible" data-collapsible="accordion">
                                                                <li>
                                                                    <div class="collapsible-header">
                                                                        <i class="mdi-social-person"></i>
                                                                        Assigned Patients
                                                                    </div>
                                                                    <div class="collapsible-body light-blue lighten-4">Miranda Kerr</div>
                                                                    <div class="collapsible-body light-blue lighten-4">Steve Kerr</div>
                                                                </li>                                                                    
                                                            </ul>
                                                        </div>                                                                                                              
                                                    </div>
                                                    -->
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Taylor Swift
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Emma Watson
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Miranda Kerr
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <!-- SATURDAY -->
                                <li>
                                    <div class="collapsible-header">
                                        Saturday                                
                                    </div>   
                                    <div class="collapsible-body grey lighten-3">
                                        <p>Assigned Staff</p>
                                        <ul class="collapsible popout">
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Laurenz tolentino
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>
                                                    <!--
                                                    <div>                                                        
                                                        <div id="assigned-patients">
                                                            <ul class="collapsible" data-collapsible="accordion">
                                                                <li>
                                                                    <div class="collapsible-header">
                                                                        <i class="mdi-social-person"></i>
                                                                        Assigned Patients
                                                                    </div>
                                                                    <div class="collapsible-body light-blue lighten-4">Miranda Kerr</div>
                                                                    <div class="collapsible-body light-blue lighten-4">Steve Kerr</div>
                                                                </li>                                                                    
                                                            </ul>
                                                        </div>                                                                                                              
                                                    </div>
                                                    -->
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Taylor Swift
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Emma Watson
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Miranda Kerr
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <!-- SUNDAY -->
                                <li>
                                    <div class="collapsible-header">
                                        Sunday                                
                                    </div>   
                                    <div class="collapsible-body grey lighten-3">
                                        <p>Assigned Staff</p>
                                        <ul class="collapsible popout">
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Laurenz tolentino
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>
                                                    <!--
                                                    <div>                                                        
                                                        <div id="assigned-patients">
                                                            <ul class="collapsible" data-collapsible="accordion">
                                                                <li>
                                                                    <div class="collapsible-header">
                                                                        <i class="mdi-social-person"></i>
                                                                        Assigned Patients
                                                                    </div>
                                                                    <div class="collapsible-body light-blue lighten-4">Miranda Kerr</div>
                                                                    <div class="collapsible-body light-blue lighten-4">Steve Kerr</div>
                                                                </li>                                                                    
                                                            </ul>
                                                        </div>                                                                                                              
                                                    </div>
                                                    -->
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Taylor Swift
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Emma Watson
                                                </div>
                                                <div class="collapsible-body grey lighten-5">
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                            <li>
                                                <div class="collapsible-header">
                                                    <i class="mdi-social-person"></i>
                                                    Miranda Kerr
                                                </div>
                                                <div class="collapsible-body grey lighten-5">                                                    
                                                    <ul class="collection with-header">
                                                        <li class="collection-header">
                                                            <b>Status</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            Active
                                                        </li>
                                                        <li class="collection-header">
                                                            <b>Duration</b>
                                                        </li>
                                                        <li class="collection-item">
                                                            30 Days
                                                        </li>
                                                        <li class="collection-header">
                                                            Assigned Patients
                                                        </li>
                                                        <li class="collection-item"> Miranda Kerr </li>
                                                        <li class="collection-item"> Steve Kerr </li>
                                                    </ul>                                                    
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <!-- End of Week placements-->
                            </ul>
                        </div>    
                    </div>
                    <!-- End of Week View -->                                        
                </div>
                <!-- Start of outbreak monitor thing -->
                <div class="col s12 m8">                    
                    <div class="card">                        
                        <div class="card-content">
                            <!-- title -->
                            <span class="card-title black-text">
                                Outbreak Monitor Protocol
                            </span>
                            <!-- body -->
                            <div>
                                <ul class="collapsible collection with-header">
                                    <!-- BARANGAY -->
                                    <!--THIS IS MY BOOKMARK-->
                                    <%
                                        barangayList = dao.getCountPerBarangay();
                                        for(int ctr=0; ctr<barangayList.size(); ctr++){
                                            out.println("<li>");
                                            out.println("<div class=\"collapsible-header\">");
                                            out.println(barangayList.get(ctr).getBarangayName());
                                            out.println("<span class=\"badge\">"+barangayList.get(ctr).getPatientCount()+"</span>");
                                            out.println("</div>");
                                            out.println("<div class=\"collapsible-body grey lighten-3\">");
                                            out.println("Contact Number: "+barangayList.get(ctr).getBarangayContact());
                                            out.println("</div>");
                                            out.println("</li>");
                                        }
                                    %>
                                </ul>
                            </div>                            
                        </div>
                    </div>                                                        
                </div>
            </div>
            <div class="">
                <div class="row">
                    <div class="col s12">
                        <div class="card grey lighten-4">
                            <div class="card-content">
                                <span class="card-title black-text">Information Panel</span>                                
                                <div class="row">
                                    <div class="col s3">
                                        <div class="card grey lighten lighten-5">
                                            <div class="card-content">
                                                <span class="card-title black-text">
                                                    Brgy. Pikashoo
                                                </span>                                                
                                            </div>
                                            <div class="card-content red lighten-1 white-text">
                                                Has reached dangerous levels. 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col s3">
                                        <div class="card grey lighten lighten-5">
                                            <div class="card-content">
                                                <span class="card-title black-text">
                                                    Brgy. Sumsung
                                                </span>                                                
                                            </div>
                                            <div class="card-content orange lighten-1 white-text">
                                                Has reached warning levels. 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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