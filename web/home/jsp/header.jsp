<%-- 
    Document   : header
    Created on : Apr 23, 2021, 12:55:14 PM
    Author     : User
--%>
<%@page import="autocs.conn"%>
<%@page import="java.sql.ResultSet"%>
<%
    Cookie ck[]=request.getCookies();
         int sum=0;
             for(int i=0;i<ck.length;i++)
             {
                 
               ResultSet rs=  conn.getResultFromSqlQuery("select * from addcart where custemail='" + ck[i].getValue() + "'"); 
               if(rs.next())
               {
                while(rs.next())
                { 
                    sum=sum + Integer.parseInt(rs.getString(4));
                
                }
               }
             } 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Restaurant Automation System</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    
    <link rel="stylesheet" href="home/css/bootstrap.min.css">    
    <link rel="stylesheet" href="home/css/style.css">    
    <link rel="stylesheet" href="home/css/responsive.css">
    <link rel="stylesheet" href="home/css/custom.css">
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script>
    
    </script>
    </head>
    <body>
        <% 
            String a="nav-item",c="nav-item",d="nav-item",e="nav-item",f="nav-item",g="nav-item",h="nav-item";
            StringBuffer b=request.getRequestURL();
            String main = b.toString();
            if(main.equals("http://localhost:8080/autocans/visitorshome.jsp"))a="nav-item active";
             if(main.equals("http://localhost:8080/autocans/menu.jsp"))c="nav-item active";
              if(main.equals("http://localhost:8080/autocans/addcart.jsp"))d="nav-item active";
               if(main.equals("http://localhost:8080/autocans/visitorshome.jsp"))e="nav-item active";
                if(main.equals("http://localhost:8080/autocans/visitorshome.jsp"))f="nav-item active";
                 if(main.equals("http://localhost:8080/autocans/visitorshome.jsp"))g="nav-item active";
            
        %>
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container" id="contain"> 
				<a class="navbar-brand" href="index.html">
			   	<strong>Restaurant Automation System</strong><img src="images/" alt="" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
						<li class="<%= a %>"><a class="nav-link" href="visitorshome.jsp">Home</a></li>
						<li class="<%= c %>"><a class="nav-link" href="menu.jsp">Menu</a></li>
                                                <li class="<%= d%>"><a class="nav-link" href="addcart.jsp">Cart<sup style="color:black;font-size:20px;"><%=sum%></sup></a></li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Order</a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
								<a class="dropdown-item" href="usercurrentorder.jsp">Current Order</a>
								<a class="dropdown-item" href="stuff.html">Ordered History</a>
								
							</div>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">More</a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
                                                                <a class="dropdown-item" href="blog.html">Combo Offer</a>
								<a class="dropdown-item" href="blog.html">Message</a>
								<a class="dropdown-item" href="blog-details.html">Feedback</a>
							</div>
						</li>
                                                
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">My Name</a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
								<a class="dropdown-item" href="blog.html">Profile</a>
								<a class="dropdown-item" href="blog-details.html">Log Out</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
    </body>
 <script>
$(document).ready(function() { /// Wait till page is loaded
setInterval(timingLoad, 1000);
function timingLoad() {
$('#subho').load(' #subho', function() {
/// can add another function here
});
}
}); 

</script>
</html>
