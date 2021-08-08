<%-- 
    Document   : header1
    Created on : May 10, 2021, 11:27:02 AM
    Author     : kkkkkk
--%>
<%@page import="autocs.conn"%>
<%@page import="java.sql.ResultSet"%>
<% 
int sum=0;
ResultSet rs=  conn.getResultFromSqlQuery("select * from currentorder where cookid<=0"); 
                             while(rs.next()){ sum=sum+1;}
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
    </head>
    <body>
      
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="index.html">
			   	<strong>Restaurant Automation System</strong><img src="images/" alt="" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="additems.jsp">Add Items</a></li>
						
                                                <li class="nav-item"><a class="nav-link" href="queueorder.jsp">Queue<sup style="color:blue;font-size:20px;"><%=sum%></sup></a></li>
                                                <li class="nav-item"><a class="nav-link" href="about.html">Token<sup style="color:green;font-size:20px;">0</sup></a></li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Order</a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
								<a class="dropdown-item" href="admincurrentorder.jsp">Current Order</a>
								<a class="dropdown-item" href="adminorderhistory.jsp">Ordered History</a>
							
							</div>
						</li>
                                                
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">More</a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
                                                                <a class="dropdown-item" href="blog.html">Add Combo Offer</a>
								<a class="dropdown-item" href="blog-details.html">See Feedback</a>
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
</html>
