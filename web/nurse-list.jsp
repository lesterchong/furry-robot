<%@page import="MODEL.StaffModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.StaffDAO"%>
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
        <%
            StaffDAO sdao = new StaffDAO();
            LinkedList<StaffModel> staffList;
            if(request.getSession().getAttribute("staffList") != null){
                staffList = (LinkedList<StaffModel>)request.getSession().getAttribute("staffList");
                request.getSession().setAttribute("staffList", null);
            }else
                 staffList = sdao.getStaff();
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
                <div class="card">
                    <div class="card-content blue accent-2">
                        <div class="row">
                            <div class="col s12 m9">
                                <span class="card-title"> Nurse/Staff List </span>
                            </div>
                            <div class="col s12 m3">
                                <div class="card">
                                    <div class="card-content"> 
                                        <form method="POST" action="SearchStaffByNameServlet">                                            
                                            <div class="input-field">
                                                <div class="row">
                                                    <div class="col s12">                                                        
                                                        <input id="last_name" type="text" class="validate" name="search">
                                                        <label for="last_name">Search Name</label>    
                                                    </div>
                                                    <div class="col s12">
                                                        <button class="btn green accent-3 waves-effect waves-light" type="submit" name="action" style="width: 100%;">
                                                            <i class="material-icons">search</i>
                                                        </button>      
                                                    </div>
                                                </div>                                              
                                            </div>                                            
                                        </form>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        
                        
                    </div>
                   </div> 
                <div class="card">
                    <div class="card-content">
                        <table class="hoverable centered">
                            <thead>
                                <tr>
                                    <th data-field="id">Last Name</th>
                                    <th data-field="name">First Name</th>
                                    <th data-field="price">Ward</th>
                                    <th data-field="asd">Patient Count</th>
                                    <th data-field="asd">Schedule</th>
                                    <th data-field="">Shift</th>
                                    <th data-field="">Link</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    for(int ctr=0; ctr<staffList.size(); ctr++){
                                %>
                                <tr>
                                    <td><% out.print(staffList.get(ctr).getStaffLastName()); %></td>
                                    <td><% out.print(staffList.get(ctr).getStaffFirstName()); %></td>
                                    <td><% out.print(staffList.get(ctr).getAssignedWard()); %></td>                                    
                                    <td><% out.print(staffList.get(ctr).getPatientAssigned()); %></td>
                                    <%if(staffList.get(ctr).getDaysAssigned()!=null){%>
                                        <td><% out.print(staffList.get(ctr).getDaysAssigned()); %></td>
                                    <%}else{%>
                                        <td>N/A</td>
                                    <%}%>
                                    
                                    <%if(staffList.get(ctr).getTimeAssigned()!=null){%>
                                        <td><% out.print(staffList.get(ctr).getTimeAssigned()); %></td>
                                    <%}else{%>
                                        <td>N/A</td>
                                    <%}%>
                                    <td><a href="nurse-profile.jsp?staff=<%out.print(staffList.get(ctr).getStaffID());%>">More</a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
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