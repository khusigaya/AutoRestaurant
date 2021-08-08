<%-- 
    Document   : checkout
    Created on : May 27, 2021, 3:52:38 PM
    Author     : User
--%>
<%@page import="autocs.conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
        Cookie ck[]=request.getCookies();
   %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
     <link rel="stylesheet" href="home/css/bootstrap.min.css">    
    <link rel="stylesheet" href="home/css/style.css">    
    <link rel="stylesheet" href="home/css/responsive.css">
    <link rel="stylesheet" href="home/css/custom.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
      
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

    
        
    <style>
        @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

body {

}

.container-fluid {
    margin-top: 70px
}

.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.40rem
}

.img-sm {
    width: 80px;
    height: 80px
}

.itemside .info {
    padding-left: 15px;
    padding-right: 7px
}

.table-shopping-cart .price-wrap {
    line-height: 1.2
}

.table-shopping-cart .price {
    font-weight: bold;
    margin-right: 5px;
    display: block
}

.text-muted {
    color: #969696 !important
}

a {
    text-decoration: none !important
}

.card {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0, 0, 0, .125);
    border-radius: 0px
}

.itemside {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    width: 100%
}

.dlist-align {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex
}

[class*="dlist-"] {
    margin-bottom: 5px
}

.coupon {
    border-radius: 1px
}

.price {
    font-weight: 600;
    color: #212529
}

.btn.btn-out {
    outline: 1px solid #fff;
    outline-offset: -5px
}

.btn-main {
    border-radius: 2px;
    text-transform: capitalize;
    font-size: 15px;
    padding: 10px 19px;
    cursor: pointer;
    color: #fff;
    width: 100%
}

.btn-light {
    color: #ffffff;
    background-color: #F44336;
    border-color: #f8f9fa;
    font-size: 12px
}

.btn-light:hover {
    color: #ffffff;
    background-color: #F44336;
    border-color: #F44336
}

.btn-apply {
    font-size: 11px
}
.remove {
  padding: 5px 10px;
  font-size: 14px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: whitesmoke;
  background-color: blueviolet;
  border: none;
  border-radius: 5px;
  box-shadow: 0 4px #999;
}

.remove:hover {background-color: greenyellow;}

.remove:active {
  background-color: #3e8e41;
  box-shadow: 0 2px #666;
  transform: translateY(4px);
}
.remove1 {
  padding: 5px 10px;
  font-size: 14px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: whitesmoke;
  background-color: blueviolet;
  border: none;
  border-radius: 5px;
  box-shadow: 0 4px #999;
}

.remove1:hover {background-color: greenyellow;}

.remove1:active {
  background-color: #3e8e41;
  box-shadow: 0 2px #666;
  transform: translateY(4px);
  
  
}

.form-group input {
  margin-bottom: 5px;
}
</style>

        <title>JSP Page</title>
 </head>
<body>

<div class="container mt-2">   
    
    <div class="card mt-2" id="card4" >
      <div class="card-body">
        <a href="#" class="fa fa-plus fa-1x" id="address"> Add a new address</a>
      </div>
    </div>
    
  <div class="card mt-2" id="formcard" style="display: none;" >
  <div class="card-body">
    <h5 class="card-title">ADD A NEW ADDRESS</h5>
    
    <form id="addressform" action="SaveAddress" method="post">
        <div class="form-row" style="display: flex;">
            <div class="form-group">
                <input name="cname" type="text" placeholder="Name" class="form-control" style="display: inline-block;"/>

            </div>

             <div class="form-group">
              <input name="cmob" type="text" placeholder="10-digit mobile number" class="form-control" style="display:inline-block;  margin-left:10px;"/>

             </div>
        </div>
        <div class="form-row" style="display: flex;">
          <div class="form-group ">
            
             <input type="text" name="cpin" placeholder="Pincode" class="form-control " style="display: inline-block;"/>
          </div>
            <div class="form-group ">
            
             <input type="text" name="cemail" placeholder="Email" class="form-control " style="display: inline-block; margin-left:10px;"/>
          </div>
       </div>
        <div class="form-group">
          <textarea  name="caddress" class="form-control w-50" style="height:100px;" placeholder="Address(Area and Street)"></textarea>
        </div>
        <div class="form-row" style="display: flex;">
            <div class="form-group">
                <input name="ccity" type="text" placeholder="City/District/Town" class="form-control" style="display: inline-block;"/>

            </div>

             <div class="form-group">
              <input name="cstate" type="text" placeholder="State" class="form-control" style="display:inline-block;  margin-left:10px;"/>

             </div>
        </div>
        
        <div class="container " data-closable>
           <button type="submit" class="btn-btn-primary">SAVE</button>
           
        </div>   
    </form>
  </div>
</div>
    
 <%   
  
             for(int k=0;k<ck.length;k++)
             {
                ResultSet rst=  conn.getResultFromSqlQuery("select * from custaddress where cemail='"+ck[k].getValue()+"'"); 
                    
                 while(rst.next())
                 {
                  
   %>
<div class="card mt-2 " id="card1" >
  <div class="card-header">
     <div class="row">
    <div class="col-md-10">
      <h3 class="w-75 p-3">DELIVERY ADDRESS</h3>
      <p><%= rst.getString(1)%>  <%= rst.getString(5)%>, <%= rst.getString(6)%>, <%= rst.getString(7)%>-<%= rst.getString(3)%></p>
    </div>
    <div class="col-md-2 float-right">
      <button class="btn btn-primary" id="change">CHANGE</button>
      
     </div>
  </div>
  </div>
  </div>
 <div class="card mt-2" id="card2" style="display: none;">
  <h5 class="card-header" >DELIVERY ADDRESS</h5>
  <div class="card-body">
   <div class="row">
    <div class="col-md-10">
        <h5 class="card-title " style="white-space: pre; font-family: monospace; font-size:17px; font-weight:bold "><%= rst.getString(1)%>      <%=rst.getString(2)%></h5>
    <p class="card-text" style="font-size:15px; font-weight:bold">  <%= rst.getString(5)%>, <%= rst.getString(6)%>, <%= rst.getString(7)%>-<%= rst.getString(3)%></p>
    </div>
       <div class="col-md-2 float-right">
         <button class="btn btn-primary" id="edit">EDIT</button>
      
     </div>
   </div>
   
    <a href="#" class="btn btn-primary mt-4">DELIVER HERE</a>
  </div>
</div>
    
    <%
       }
    }
       %>
</div>
 

     <!-- <button type="button" id="addressbtn">Toggle Form!</button>  -->
        
    <div class="container-fluid" id="container-fluid ">
    <div class="row">
        <aside class="col-lg-9">
            <div class="card">
                <div class="table-responsive">
                    <table class="table table-borderless table-shopping-cart calculation-table">
                        <thead class="text-muted">
                            <tr class="small text-uppercase">
                                <th scope="col">Image</th>
                                <th scope="col">Name</th>
                                <th scope="col" width="120">Quantity</th>
                                <th scope="col" width="120">Each Price</th>
                                <th scope="col" width="120">Ext. Price</th>
                                <th scope="col" width="120">Time</th>
                               
                            </tr>
                        </thead>
                        <% 
                            int sum =0;
                            for(int i=0;i<ck.length;i++)
                          {
                
                             ResultSet rs=  conn.getResultFromSqlQuery("select * from addcart where custemail='"+ck[i].getValue()+"'"); 
                             
                             while(rs.next()){
                             int result=rs.getInt(2); ResultSet res=conn.getResultFromSqlQuery("select * from addfood where fid=" + result + "");
                             while(res.next()){
                         %>
                        
                        <tbody>
                            <tr id="calc-<%=rs.getInt(2) %>">
                                <td>
                                    <figure class="itemside align-items-center">
                                        <div class="aside"><img src="food_pics/<%= res.getString(5)%>" style="border-radius:50%;width:100px;height:100px;" class="img-sm"></div></td>
                                    <td>  <figcaption class="info"> <a href="#" class="title text-dark" data-abc="true"> <%= res.getString(2)%> </a>
                                           
                                        </figcaption>
                                    </figure>
                                </td>
                                <td> 
                                    <input type="hidden" name="fid" value="<%=rs.getInt(2)%>" id="id">
                                    <%=rs.getString(3)%>
                                </td>
                                <td class="value" data-value="<%= res.getString(6)%>"> <%= res.getString(6)%> </td>
                                <td class="subtotal" data-id="total" data-value="0">   <%= Integer.parseInt(rs.getString(4))*Integer.parseInt(res.getString(6))%></td>
                                <td class="value" data-value=""> <%= rs.getString(4)%> </td>
                               
                            </tr>
                            <% sum=sum + Integer.parseInt(rs.getString(4))*Integer.parseInt(res.getString(6));%>
                            <%}}}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </aside>
        <aside class="col-lg-3">
            <div class="card mb-3">
                
            </div>
            <div class="card">
                <div class="card-body">
                    <dl class="dlist-align">
                        <dt>Current Total price:<p><%=+sum %></p></dt>
                        <dd class="text-right ml-3"><p class="grandTotal"></p></dd>
                    </dl>
                    <dl class="dlist-align">
                        <dt></dt>
                        <dd class="text-right text-danger ml-3"></dd>
                    </dl>
                    <dl class="dlist-align">
                        <dt></dt>
                        <dd class="text-right text-dark b ml-3"><strong></strong></dd>
                    </dl>
                        
                    <hr> <input  class="btn btn-out btn-primary btn-square btn-main" type=button onClick="win();" value="Order Confirmed">
                </div>
            </div>
        </aside>
    </div>
</div>
</body>
<SCRIPT language=JavaScript>
function win(){
window.opener.location.href="Orderconfirmed";
self.close();

}
</SCRIPT>

<script>
    $(document).ready(function(){
        
      $("#change").click(function(){
          
          $("#card1").hide();
          $("#card2").show();
        
      })  ;
      
      $("#card4").click(function() {
         $("#formcard").toggle();
         $("#card2").hide();
         $("#card1").show();
  });
      
    });
</script>
</html>
