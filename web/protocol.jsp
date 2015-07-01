<%@page import="MODEL.ReferenceModel"%>
<%@page import="DAO.ReferenceDAO"%>
<%@page import="MODEL.ProtocolModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.ProtocolDAO"%>
<!doctype html>
<html>
    <head>
        <title>QMMC</title>
 
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/animate.min.css">
        <link type="text/css" rel="stylesheet" href="css/materialize.css"  media="screen,projection"/>	      
        <link type="text/css" rel="stylesheet" href="css/styles.css"/>
        <link type="text/css" rel="stylesheet" href="css/animation.css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
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
            .table-text-left {
                text-align:left; 
                padding-left:4em;
            }
        </style>
        <!-- For Tabbed Content --> 
    </head>
    <!-- Start of Body -->
    <body class="grey lighten-4">
        <!-- Start Here -->
        <%
            ReferenceDAO referenceDAO = new ReferenceDAO();
            ProtocolDAO protocolDAO = new ProtocolDAO();
            LinkedList<ProtocolModel> protocolList;
            LinkedList<ReferenceModel> referenceList;
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
                <div class="row">
                    <div class="col s12 m4">
                        <div class="card">
                            <div class="card-content grey lighten-3">
                                <span class="card-title black-text">Add Protocol</span>
                            </div>
                            <div class="card-content">
                                <form method="POST" action="AddProtocolServlet">
                                    <label>Protocol Color</label>
                                    <select class="browser-default" name="color">
                                        <%
                                            referenceList = referenceDAO.getProtocolColors();
                                            for(int ctr=0; ctr<referenceList.size(); ctr++){
                                        %>
                                        <option value="<%out.print(referenceList.get(ctr).getReferenceID());%>"><%out.print(referenceList.get(ctr).getReferenceName());%></option>
                                        <%}%>
                                    </select>
                                    <label>Protocol Type</label>
                                    <select class="browser-default" name="condition">
                                        <option value="" disabled selected>Choose your option</option>
                                        <option value="0">Dengue</option>
                                        <option value="1">Leptospirosis</option>
                                    </select>
                                    <div class="input-field col s12">
                                        <textarea id="textarea1" class="materialize-textarea" name="protocol"></textarea>
                                        <label for="textarea1">Description</label>
                                    </div>
                                    <button class="btn waves-effect waves-light green accent-4" type="submit" name="action" style="width:100%;">
                                        Create Protocol                                        
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>                    
                    <div class="col s12 m8">
                        <div class="card">
                            <div class="card-content teal">
                                <span class="card-title">
                                    Protocols
                                </span>
                            </div>
                            <div class="card-content">
                                <ul class="tabs grey lighten-2">
                                    <li class="tab col s6"><a href="#dengue">Dengue</a></li>
                                    <li class="tab col s6"><a href="#leptospirosis">Leptospirosis</a></li>
                                </ul>
                                <div class="tabcontents">
                                    <div id="dengue">
                                        <table class="hoverable centered">
                                    <thead>
                                        <tr>
                                            <th>Color</th>
                                            <th>Description</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            protocolList = protocolDAO.getDengueProtocols();
                                            for(int ctr=0; ctr<protocolList.size(); ctr++){
                                        %>
                                        <tr>
                                            <td><%out.print(protocolList.get(ctr).getProtocolColor());%></td>
                                            <td class="table-text-left">
                                                <%out.print(protocolList.get(ctr).getProtocol());%>
                                            </td>
                                            <td>
                                                <a href="DeleteProtocol?protocol=<%out.print(protocolList.get(ctr).getProtocolID());%>" class="btn red accent-2"> Delete </a>
                                            </td>
                                        </tr>                                        
                                        <%}%>
                                    </tbody>
                                </table>
                                        
                                    </div>
                                    <div id="leptospirosis">
                                        <table class="hoverable centered">
                                    <thead>
                                        <tr>
                                            <th>Color</th>
                                            <th>Description</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            protocolList = protocolDAO.getLeptoProtocols();
                                            for(int ctr=0; ctr<protocolList.size(); ctr++){
                                        %>
                                        <tr>
                                            <td><%out.print(protocolList.get(ctr).getProtocolColor());%></td>
                                            <td class="table-text-left">
                                                <%out.print(protocolList.get(ctr).getProtocol());%>
                                            </td>
                                            <td>
                                                <a href="DeleteProtocol?protocol=<%out.print(protocolList.get(ctr).getProtocolID());%>" class="btn red accent-2"> Delete </a>
                                            </td>
                                        </tr>  
                                        <%}%>
                                    </tbody>
                                </table>
                                    </div>
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
                    $('ul.tabs').tabs();
      		    }
            );
            
      	</script>        
        <script>
          window.sr = new scrollReveal();
        </script>                                
    </body>
</html>