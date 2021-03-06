<!doctype html>
<html>
    <head>
        <title>QMMC</title>
        <!-- Polymer Elements -->
        <script src="components/webcomponentsjs/webcomponents.js"></script>        
        <link rel="import" href="elements/sms-rec.html">
        <link rel="import" href="elements/sms-rep.html">
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
        </style>
        <!-- Chart API -->
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages:["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {

            var data = google.visualization.arrayToDataTable([
            ['Count', 'Percentage per division'],
            ['2-A', 11],
            ['2-B', 20],
            ['2-C', 15],
            ['3-A', 4],
            ['3-B', 7],
            ['Others', 1]
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
        
        <!-- 
            nav bar 
        -->
        <nav style="background: 0; height:50px;">
            <div class="nav-wrapper" id="start-navbar">
                <a href="#!" class="roboto-300">Q M M C - O R M S</a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="admissions.html">Admissions</a></li>
                    <li><a href="headnurse-main.html">Dashboard</a></li>                    
                    <li><a href="nurse-list.html">Nurse List</a></li>
                </ul>
                <ul class="side-nav" id="mobile-demo">
                    <li><a href="admissions.html">Admissions</a></li>
                    <li><a href="headnurse-main.html">Dashboard</a></li>
                    <li><a href="nurse-list.html">Nurse List</a></li>
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
                    <div class="col s12 m3">
                        <div class="card">
                            <div class="card-content grey lighten-3">
                                <span class="card-title black-text">Contact Name</span>
                            </div>                            
                            <div class="card-content">
                                <ul class="tabs">
                                    <div class="row">
                                        <li class="tab col s12">
                                            <a href="#contact1" class="active">
                                                Contact 1
                                            </a>
                                        </li>
                                        <li class="tab col s12">
                                            <a href="#contact2">
                                                Contact 2
                                            </a>
                                        </li>                                        
                                    </div>                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m9">
                        <!-- this appears when changing tabs -->
                        <!-- Contact 1 -->
                        <div id="contact1">                        
                            <div class="card">
                                <div class="card-content green">
                                    <span class="card-title">Contact 1</span>
                                </div>
                                <div class="card-content">
                                    <div class="sms-zone" style="height:350px;">
                                        <sms-rec>This is ocntact 1</sms-rec>
                                        <sms-rep>Sure boss</sms-rep>
                                    </div>
                                </div>
                                <div class="card-action">
                                    <form>
                                        <div class="row input-field">
                                            <div class="col s10">
                                                <div class="input-field">
                                                    <textarea id="textarea1" class="materialize-textarea" length="160"></textarea>
                                                    <label for="textarea1">Textarea</label>
                                                </div>
                                            </div>
                                            <div class="col s2 input-field valign-wrapper">
                                                <button class="btn-floating btn-large valign waves-effect waves-light" type="submit" name="action">
                                                    <i class="material-icons">send</i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <div id="contact2">
                            <div class="card">
                                <div class="card-content green">
                                    <span class="card-title">Contact 2</span>
                                </div>
                                <div class="card-content">
                                    <div class="sms-zone" style="height:350px;">
                                        <sms-rec>This is the second contact</sms-rec>
                                        <sms-rep>Yay okay</sms-rep>
                                    </div>
                                </div>
                                <div class="card-action">
                                    <form>
                                        <div class="row input-field">
                                            <div class="col s10">
                                                <div class="input-field">
                                                    <textarea id="textarea1" class="materialize-textarea" length="160"></textarea>
                                                    <label for="textarea1">Textarea</label>
                                                </div>
                                            </div>
                                            <div class="col s2 input-field valign-wrapper">
                                                <button class="btn-floating btn-large valign waves-effect waves-light" type="submit" name="action">
                                                    <i class="material-icons">send</i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
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
                function(){
                    $(".button-collapse").sideNav();
                    $('.modal-trigger').leanModal();
                    $('input#input_text, textarea#textarea1').characterCounter();
                    $('ul.tabs').tabs();
      		    }
            );                         
      	</script>        
        <script>
          window.sr = new scrollReveal();
        </script>                                
    </body>
</html>