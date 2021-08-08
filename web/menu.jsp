<%@page import="autocs.conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="home/jsp/header.jsp" /> 
</head>
<body>
<div class="all-page-title page-breadcrumb">
<div class="container text-center">
    <div class="row">
            <div class="col-lg-12">
                    <h1>Special Menu</h1>
            </div>
    </div>
</div>
</div>
<!-- End All Pages -->

<!-- Start Menu -->
<div class="menu-box">
<div class="container">
    <div class="row">
            <div class="col-lg-12">
                    <div class="heading-title text-center">
                            <h2>Special Menu</h2>
                            <p></p>
                    </div>
            </div>
    </div>

    <div class="row inner-menu-box">
            <div class="col-3">
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">All</a>
                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Starter</a>
                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false"> Main Course</</a>
                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Dessert</a>
                    </div>
            </div>

            <div class="col-9">
                    <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                    <div class="row">
                                         <%  ResultSet rs1=  conn.getResultFromSqlQuery("select * from addfood"); 
                                              while(rs1.next())
                                              {
                                  %>
                                            <div class="col-lg-4 col-md-6 special-grid drinks">
                                                    <div class="gallery-single fix">
                                                            <img  src="food_pics/<%= rs1.getString(5)%>" class="img-fluid" style=" width:auto; height:220px;" alt="Image">
                                                            <div class="why-text">
                                                                    <h4><%=rs1.getString(2)%></h4>
                                                                    <p><%=rs1.getString(4)%></p>
                                                                    <h5> Rs <%=rs1.getString(3)%></h5>
                                                                    <br>
                                                                    
                                                                    <a href="RemoveFood?food_id=<%= rs1.getInt(1)%>" ><span class="fa fa-cart-plus  text-light" style="color:white; font-size:20px;">Add to Cart </span></a>
                                                                    <a href="#!"> <span class="fa fa-archive   mt-1 text-light" style="color:white; font-size:18px; float:right ">Order Now</span></a>
                                                            </div>
                                                    </div>
                                               </div>              
                                                
                                         <%
                                             }
                                        %>
                                       
                                    </div>

                            </div>
                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                    <div class="row">
                                        <%
                                            ResultSet rs3=  conn.getResultFromSqlQuery("select * from addfood where category ='starter'"); 
                                            while(rs3.next())
                                            {
                                                
                                            %>
                                            <div class="col-lg-4 col-md-6 special-grid drinks">
                                                    <div class="gallery-single fix">
                                                            <img src="food_pics/<%= rs3.getString(5)%>" class="img-fluid" style=" width:auto; height:220px;" alt="Image">
                                                            <div class="why-text">
                                                                    <h4><%=rs3.getString(2)%></h4>
                                                                    <p><%=rs3.getString(4)%></p>
                                                                    <h5>Rs <%=rs3.getString(3)%></h5>
                                                                     <br>
                                                                    
                                                                    <a href="RemoveFood?food_id=<%= rs3.getInt(1)%>"><span class="fa fa-cart-plus  text-light" style="color:white; font-size:20px;">Add to Cart</span></a>
                                                                    <a href="#!"> <span class="fa fa-archive   mt-1 text-light" style="color:white; font-size:18px; float:right ">Order Now</span></a>
                                                            
                                                            
                                                            </div>
                                                    
                                                          
                                            
                                                    </div>
                                               </div>             
                                                            <%
                                                                }
                                                          %>
                                         
                                    </div>

                            </div>
                            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                    <div class="row">
                                        <%
                                            ResultSet rs4=  conn.getResultFromSqlQuery("select * from addfood where category ='main course'"); 
                                            while(rs4.next())
                                            {
                                                
                                            %>
                                            <div class="col-lg-4 col-md-6 special-grid lunch">
                                                    <div class="gallery-single fix">
                                                            <img src="food_pics/<%= rs4.getString(5)%>" class="img-fluid" style=" width:auto; height:220px;" alt="Image">
                                                            <div class="why-text">
                                                                    <h4><%=rs4.getString(2)%></h4>
                                                                    <p><%=rs4.getString(4)%></p>
                                                                    <h5> Rs <%=rs4.getString(3)%></h5>
                                                                      <br>
                                                                    
                                                                    <a href="RemoveFood?food_id=<%= rs4.getInt(1)%>"><span class="fa fa-cart-plus  text-light" style="color:white; font-size:20px;">Add to Cart</span></a>
                                                                    <a href="#!"> <span class="fa fa-archive   mt-1 text-light" style="color:white; font-size:18px; float:right ">Order Now</span></a>
                                                            
                                                            </div>
                                                    </div>
                                            </div>
                                                             <%
                                                                }
                                                          %>
                                        
                                           
                                    </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <div class="row">
                                        <%
                                            ResultSet rs5=  conn.getResultFromSqlQuery("select * from addfood where category ='dessert'"); 
                                            while(rs5.next())
                                            {
                                                
                                            %>
                                            <div class="col-lg-4 col-md-6 special-grid dinner">
                                                    <div class="gallery-single fix">
                                                            <img src="food_pics/<%= rs5.getString(5)%>" class="img-fluid" style=" width: auto; height:220px;" alt="Image">
                                                            <div class="why-text">
                                                                    <h4><%=rs5.getString(2)%></h4>
                                                                    <p><%=rs5.getString(4)%></p>
                                                                    <h5> Rs.<%=rs5.getString(3)%> </h5>
                                                                      <br>
                                                                    
                                                                    <a href="RemoveFood?food_id=<%= rs5.getInt(1)%>"><span class="fa fa-cart-plus  text-light" style="color:white; font-size:20px;">Add to Cart</span></a>
                                                                    <a href="#!"> <span class="fa fa-archive   mt-1 text-light" style="color:white; font-size:18px; float:right ">Order Now</span></a>
                                                            
                                                            </div>
                                                    </div>
                                            </div>
                                        
                                          <%
                                                     }
                                                %>      

                                        
                                    </div>
                            </div>
                    </div>
            </div>
    </div>
</div>
</div>
<!-- End Menu --> 
</body>
<jsp:include page="home/jsp/footer.jsp" />  
</html>