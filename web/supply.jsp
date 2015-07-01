<%@page import="MODEL.SuppliesModel"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAO.SuppliesDAO"%>
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
            SuppliesDAO supplyDAO = new SuppliesDAO();
            LinkedList<SuppliesModel> supplyList;
            if(request.getSession().getAttribute("supplyList")!= null){
                supplyList = (LinkedList<SuppliesModel>)request.getSession().getAttribute("supplyList");
                request.getSession().setAttribute("supplyList", null);
            }else
                supplyList = supplyDAO.getSupplies();
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
                    <div class="col s12 m3">
                        <form method="POST" action="SearchSupplyServlet">
                            <div class="card">
                                <div class="card-content purple darken-3">
                                    <div class="row">
                                        <div class="col s12">
                                            <span class="card-title"> Supply List </span>
                                        </div>                                    
                                    </div> 
                                </div>
                                <div class="card-content">

                                    <div class="input-field">
                                        <div class="row">
                                            <div class="col s12">                                                        
                                                <input id="last_name" type="text" class="validate" name="search">
                                                <label for="last_name">Search Name</label>    
                                            </div>
                                            <div class="col s12">
                                                <button class="btn waves-effect waves-light" type="submit" name="action" style="width: 100%;">
                                                    <i class="material-icons">search</i>
                                                </button>      
                                            </div>                                                            
                                        </div>                                        
                                    </div>                                            

                                </div>
                                <div class="card-action">
                                    <div class="row center">
                                        <label>
                                            When you have finalized your orders please press 
                                            the button below to proceed to the checkout page.
                                        </label>
                                        <div class="row"><!-- just for spacing --> </div>
                                        <div class="col s12">
                                            <a href="checkout.html" class="btn waves-effect waves-light orange accent-4 white-text" 
                                               type="submit" name="action" style="width: 100%;">
                                                Checkout
                                            </a>  
                                        </div>
                                    </div>
                                </div>
                           </div> 
                        </form>
                    </div>
                    <div class="col s12 m9">
                        <div class="card">
                            <div class="card-content">
                                <table class="hoverable centered">
                                    <thead>
                                        <tr>
                                            <th data-field="id">Supply No.</th>
                                            <th data-field="name">Supply Name</th>
                                            <th data-field="price">Available</th>
                                            <th data-field="asd">On Hand</th>
                                            <th data-field="">Action</th>                                    
                                        </tr>
                                    </thead>
                                    <tbody>                                
                                        <%
                                            for(int ctr=0; ctr<supplyList.size(); ctr++){
                                        %>
                                        <tr>
                                            <td><%out.print(supplyList.get(ctr).getSupplyID());%></td>
                                            <td><%out.print(supplyList.get(ctr).getSupplyName());%></td>
                                            <td><%out.print(supplyList.get(ctr).getCapacity());%></td>
                                            <td><%out.print(supplyList.get(ctr).getAmount());%></td>
                                            <td><a class="waves-light modal-trigger" href="#modal<%out.print(supplyList.get(ctr).getSupplyID());%>">Request More</a></td>
                                        </tr>
                                        <!-- Modal Structure -->
                                        <div id="modal<%out.print(supplyList.get(ctr).getSupplyID());%>" class="modal">
                                            <div class="modal-content orange accent-2">
                                                <div class=" white-text container">
                                                    <h4 class="center">You are about to order</h4>
                                                    <div class="card">
                                                        <div class="card-content black-text">
                                                            <form>
                                                                <div class="container">
                                                                    <div class="row">
                                                                        <div class="col s12 center">
                                                                            <h5><%out.print(supplyList.get(ctr).getSupplyName());%></h5>
                                                                        </div>
                                                                        <div class="col s12 center">
                                                                            <div class="input-field">
                                                                                <input id="quantity" type="text" class="validate center" value="">
                                                                                <label for="quantity" class="active">Quantity</label> 
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>                         
                                                                <button class="btn waves-effect waves-light green" type="submit" name="action"
                                                                        style="width:100%">Submit order
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer grey darken-3">
                                                <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat orange-text">Close</a>
                                            </div>
                                        </div>
                                        <%}%>
                                    </tbody>
                                </table>
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
      		    }
            );
            
      	</script>        
        <script>
          window.sr = new scrollReveal();
        </script>                                
    </body>
</html>