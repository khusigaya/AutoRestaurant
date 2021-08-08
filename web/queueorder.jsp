

<%@page import="autocs.conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <jsp:include page="home/jsp/header1.jsp" /><br>
 
<link rel='stylesheet' href=''>
<link rel='stylesheet' href=''>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>

<div class="all-page-title page-breadcrumb">
<div class="container text-center">
    <div class="row">
            <div class="col-lg-12">
                    <h1>Current Order</h1>
            </div>
    </div>
</div>
</div>
</head>
<body>
    
    <div class="card mb-4">
                <div class="card-body">
                    <!-- Grid row -->
                    <div class="row">
                        <!-- Grid column -->
                        <div class="col-md-12">
                            <h2 class="pt-3 pb-4 text-center font-bold font-up deep-purple-text"></h2>
                            <div class="input-group md-form form-sm form-2 pl-0">
                                <input class="form-control my-0 py-1 pl-3 purple-border" type="text" placeholder="Search By Food Name..." aria-label="Search">
                             
                            </div>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                    <!--Table-->
                    <table class="table table-striped">
                        <!--Table head-->
                        <thead>
                            
                            <tr>
                                <th style="text-align:center">Order Id</th>
                                <th style="text-align:center">Image</th>
                                <th style="text-align:center">Food Name</th>
                                <th style="text-align:center">Quantity</th>
                                <th style="text-align:center">Time</th>
                                <th style="text-align:center">Set Cook Id</th>
                                <th style="text-align:center">Set Time</th>
                                <th style="text-align:center">Action</th>
                                
                            </tr>
                        </thead>
                        <!--Table head-->
                        <!--Table body-->
                        <tbody>
                            <% 
                             
                             ResultSet rs=  conn.getResultFromSqlQuery("select * from currentorder where process='no'"); 
                             while(rs.next()){ 
                             int result=rs.getInt(3); ResultSet res=conn.getResultFromSqlQuery("select * from addfood where fid=" + result + "");
                             while(res.next()){
                           %>
                            <form action="javascript:void(0)" id="saveee" name="saveee" class="" method="get">
                            <tr>
                                <td style="text-align:center"><%= rs.getInt(2) %></td>
                                <td style="text-align:center"><img src="food_pics/<%= res.getString(5)%>" style="border-radius:50%;width:150px;height:150px;" /></td>
                                <td style="text-align:center"><%= res.getString(2) %></td>
                                <td style="text-align:center"><%= rs.getInt(4) %></td>
                                <td style="text-align:center"><%= rs.getString(11) %></td>
                                <input type="hidden" name="fid" value="<%=rs.getInt(3)%>" id="id">
                                <td style="text-align:center">
                                    <select id="" name="cookid">
                                    <option value=""> Select Id </option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                     </select>
                                </td>
                                <td style="text-align:center">
                                    <select id="" name="time">
                                    <option value=""> Select Times </option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
                                    <option value="25">30</option>
                                    <option value="30">45</option>
                                     </select>
                                </td>
                                <td style="text-align:center"><button type="submit" id="" class="remove" <style color="red";> Done </button></td>
                                
                            </tr>
                            </form>
                          <% }} %>
                        </tbody>
                        <!--Table body-->
                    </table>
                    <!--Table-->
                </div>
            </div>
</body>
    
<script>
$('#saveee').submit(function() {
if(confirm("do you want to save ?")==true){
$.ajax({
type:"POST",
url: "Processing",
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
    
<style>
    .hm-gradient {
    
}
.darken-grey-text {
    color: #2E2E2E;
}
.input-group.md-form.form-sm.form-2 input {
    border: 1px solid #bdbdbd;
    border-top-left-radius: 0.25rem;
    border-bottom-left-radius: 0.25rem;
}
.input-group.md-form.form-sm.form-2 input.purple-border {
    border: 1px solid #9e9e9e;
}
.input-group.md-form.form-sm.form-2 input[type=text]:focus:not([readonly]).purple-border {
    border: 1px solid #ba68c8;
    box-shadow: none;
}
.form-2 .input-group-addon {
    border: 1px solid #ba68c8;
}
.danger-text {
    color: #ff3547; 
}  
.success-text {
    color: #00C851; 
}
.table-bordered.red-border, .table-bordered.red-border th, .table-bordered.red-border td {
    border: 1px solid #ff3547!important;
}        
.table.table-bordered th {
    text-align: center;
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
</style>

 <jsp:include page="home/jsp/footer.jsp" />  
 <script> 
if ( window.history.replaceState ) { 
        window.history.replaceState( null, null, window.location.href ); 
    } 
</script> 
</html>