<%-- 
    Document   : addcart2
    Created on : May 23, 2021, 2:47:03 PM
    Author     : User
--%>
<%@page import="autocs.conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


    
<html>
    <head>
        <div id="refresh">
        <jsp:include page="home/jsp/header.jsp" /> 
        <div class="all-page-title page-breadcrumb">
       <div class="container text-center">
        <div class="row">
            <div class="col-lg-12">
                    <h1>Your Cart</h1>
            </div>
       </div>
       </div>
       </div>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
       
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
      
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
       
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
</style>

        <title>JSP Page</title>
    </head>
    <body>
    <div class="container-fluid" id="container-fluid">
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
                                <th scope="col" class="text-right d-none d-md-block" width="200"></th>
                            </tr>
                        </thead>
                        <% 
                            
                            Cookie ck[]=request.getCookies();
                            int sum=0;
                           for(int i=0;i<ck.length;i++)
                         {
                             ResultSet rs=  conn.getResultFromSqlQuery("select * from addcart where custemail='" + ck[i].getValue() + "'"); 
                             
                             while(rs.next()){
                             int result=rs.getInt(2); 
                             ResultSet res=conn.getResultFromSqlQuery("select * from addfood where fid='" + result + "'");
                             while(res.next()){
                         %>
                        <form action="javascript:void(0)" id="savequantity" name="savequantity" class="" method="get">
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
                                    <input type="number" name="qty" value="<%=rs.getString(4)%>" class="wpcf7-form-control wpcf7-number wpcf7-validates-as-number" min="0" max="9999" aria-invalid="false">
                                </td>
                                <td class="value" data-value="<%= res.getString(6)%>"> <%= res.getString(6)%> </td>
                                <td class="subtotal" data-id="total" data-value="0">   <%= Integer.parseInt(rs.getString(4))*Integer.parseInt(res.getString(6))%></td>
                                <td class="value" data-value=""> <%= rs.getString(5)%> </td>
                                <td><button type="submit" class="remove1" <style color="red";> save </button></form>
                                 <button type="button" id="<%=rs.getInt(2) %>" class="remove" <style color="red";> Remove </button></td>
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
                <div class="card-body">
                    <form>
                        <div class="form-group"> <label>Have coupon?</label>
                            <div class="input-group"> <input type="text" class="form-control coupon" name="" placeholder="Coupon code"> <span class="input-group-append"> <button class="btn btn-primary btn-apply coupon">Apply</button> </span> </div>
                        </div>
                    </form>
                </div>
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
                    <hr> <input type="button" value="Check Out" onClick=window.open("checkout.jsp",'ratting',"width=1000,height=800,left=,top=") class="btn btn-out btn-primary btn-square btn-main">  
                    <a href="menu.jsp" class="btn btn-out btn-success btn-square btn-main mt-2" data-abc="true">Continue Shopping</a>
                </div>
            </div>
        </aside>
    </div>
</div>
    </body>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
    <script>
        (function( $ ) {
  $('.calculation-table [id^="calc-"] input').change(
    function(){
      var value = $(this).val();
      var name = $(this).closest("tr").attr('id');
      var subtotal = $("#"+name + '> td.value').attr('data-value');
      var linetotal = (subtotal * value);
      $("#"+name + "> td.subtotal").text(" " + linetotal + ".00").attr('data-value', linetotal);
      
      var grandTotal = 0;
  });
})(jQuery);
    </script>
    <script>
    
$(document).ready(function() {
// crating new click event for save button
$(".remove").click(function() {
if(confirm("are you sure ? This Action Can not be Undone...")==true){
var id = +this.id;
$.ajax({
url: "RemoveFood",
type: "post",
data: {
id : id,
},
success : function(data){
window.location.reload();
},
error: function(jqXHR,textStatus,errorThrown)
   {
       swal("Error!", "Something Went Wrong!", "error");
   }
 
});}
});
});

$('#savequantity').submit(function() {
if(confirm("do you want to save ?")==true){
$.ajax({
type:"POST",
url: "RemoveFood",
data: $(this).serialize(), // get all form field value in 
dataType: 'json',
success : function(data){
window.location.reload();
},
error: function(jqXHR,textStatus,errorThrown)
   {
       swal("Error!", "Something Went Wrong!", "error");
   }
});}
});
</script>
</div>
<jsp:include page="home/jsp/footer.jsp" /> 

 <script>  
  if ( window.history.replaceState ) 
  { 
        window.history.replaceState( null, null, window.location.href ); 
    } 
</script> 
 
</html>
