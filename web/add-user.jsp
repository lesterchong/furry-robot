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
            
            .card .card-action a {
                margin-right: 0px;
            }            
            .input-field input[type=text]:focus {
                border-bottom: 1px solid white;
                box-shadow: 0 1px 0 0 white;
            }
        </style>
    </head>
    <!-- Start of Body -->
    <body class="grey lighten-4">
        <!-- Start Here -->
        
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
        <div class="progress hide">
            <div class="indeterminate"></div>
        </div>                   
        <!-- 
            Start of Below the fold content
        -->
        <section>
            <div class="container">
                <div class="card">
                    <div class="card-content grey accent-3">
                        <span class="card-title">
                            Add New Nurse
                        </span>
                    </div>
                    <div class="card-content">
                        <form class="container" method="POST" action="AddStaffServlet">
                            <div class="row">
                                <div class="input-field col s6">
                                    <input id="first_name" type="text" class="validate" name="firstName">
                                    <label for="first_name">First Name</label>
                                </div>
                                <div class="input-field col s6">
                                    <input id="last_name" type="text" class="validate" name="lastName">
                                    <label for="last_name">Last Name</label>
                                </div>                        
                            <div class="input-field col s12 center">
                                <button class="btn waves-effect waves-light green" type="submit" name="action">
                                    Add Nurse                                  
                                </button>
                            </div>
                        </form>
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
                function(){
                    $(".button-collapse").sideNav();
                    $('.modal-trigger').leanModal();
      		    }
            );
            
      	</script>        
        <script>
          window.sr = new scrollReveal();
        </script>                                
    </body>
</html>