
<%@page import="DAO.PatientDAO"%>
<%@page import="MODEL.PatientModel"%>
<!doctype html>
<html>
    <head>
        <title>QMMC</title>
        <!-- Polymer -->
        <script src="components/webcomponentsjs/webcomponents.js"></script>
        <link rel="import" href="elements/image-card.html"/>
        <link rel="import" href="elements/warn-orange.html"/>
        <link rel="import" href="elements/warn-red.html"/>
        <link rel="import" href="elements/brgycard-header.html"/>
        <link rel="import" href="elements/brgycard-content.html"/>
        <link rel="import" href="elements/navi-bar.html">
        <link rel="import" href="elements/sms-rec.html">
        <link rel="import" href="elements/sms-rep.html">
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
            PatientDAO dao = new PatientDAO();
            PatientModel model = dao.getPatientByID(1);
        %>
        <!-- Start Here -->
        
        <!-- nav bar -->
        <nav style="background: 0; height:50px;">
            <div class="nav-wrapper" id="start-navbar">
                <a href="#!" class="roboto-300">Q M M C - O R M S</a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="admissions.jsp">Admissions</a></li>
                    <li><a href="nurse-board2.jsp">Dashboard</a></li>                    
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="admissions.jsp">Admissions</a></li>
                    <li><a href="nurse-board2.jsp">Dashboard</a></li>                    
                </ul>
            </div>
        </nav>      
        <!-- end of nav bar -->
        <div id="above-fold"></div>
        <!-- below nav bar -->
        <div class="container">
            <div class="card">                
                <div class="card-content">
                    <h5 class="center"> 
                        <%
                            out.println(model.getPatientLastName()+", "+model.getPatientFirstName());
                        %>
                    </h5><br>
                    <div class="row center">
                        <div class="col s12 m4">
                            <p class="grey-text">Address</p>
                            <p>
                                <%
                                    out.println(model.getPatientAddress());
                                    out.println("<br>");
                                    out.println(model.getPatientBarangay());
                                %>
                            </p>
                        </div>
                        <div class="col s12 m4">
                            <p class="grey-text">Contact Details</p>
                            <p>
                                <%
                                    out.println(model.getPatientPhoneNumber());
                                %>
                            </p>
                        </div>
                        <div class="col s12 m4">
                            <p class="grey-text">Ward/Unit</p>
                            <p>
                                <%
                                    out.println(model.getPatientWard());
                                %>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="card-action"></div>
                    <h5 class="center"> 
                        Procedures
                    </h5><br>
                <div class="card-content">
                    <div class="container">
                        <form action="#">
                            <p>
                                <%
                                    for(int ctr=0; ctr<model.getProcedures().size(); ctr++){
                                        if(model.getProcedures().get(ctr).isDone())
                                            out.println("<input type=\"checkbox\" id=\""+ctr+"\" checked=\"checked\">");
                                        else
                                            out.println("<input type=\"checkbox\" id=\""+ctr+"\">");
                                        out.println("<label for=\""+ctr+"\">"+model.getProcedures().get(ctr).getProcedureName()+"</label>");
                                    }
                                %>
                            </p>

                        </form>
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