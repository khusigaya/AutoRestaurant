<%@ page import="autocs.*"%>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.nio.file.*"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="autocs.conn"%>
 <%@ page import="com.oreilly.servlet.MultipartRequest" %>  
 <%@ page import = "javax.servlet.http.*" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <jsp:include page="home/jsp/header1.jsp" />
  <head>
<div class="all-page-title page-breadcrumb">
<div class="container text-center">
    <div class="row">
            <div class="col-lg-12">
                    <h1>Add Menu</h1>
            </div>
    </div>
</div>
</div>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Add Items</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<style>
    
    
<%
    
   
   MultipartRequest mreq=null;
   String NEW_UPLOAD_DIRECTORY=null;
   String UPLOAD_DIRECTORY=null;
    if (ServletFileUpload.isMultipartContent(request))
    {
          UPLOAD_DIRECTORY=getServletContext().getRealPath("food_pics");
          int maxFileSize = 500000 * 1024;
          int maxMemSize = maxFileSize;
           mreq = new MultipartRequest(request, UPLOAD_DIRECTORY, maxFileSize);
           NEW_UPLOAD_DIRECTORY = UPLOAD_DIRECTORY;
          
   }
%>
    
body {
	
}
.table-responsive {
    margin: 80px 0;
}
.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {        
	padding-bottom: 15px;
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;    
}
.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}
.table-title .btn-group {
	float: right;
}
.table-title .btn {
	color: #fff;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}
.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}
.table-title .btn span {
	float: left;
	margin-top: 2px;
}
table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}
table.table tr th:first-child {
	width: 60px;
}
table.table tr th:last-child {
	width: 100px;
}
table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}
table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}
table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}	
table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}
table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}
table.table td a:hover {
	color: #2196F3;
}
table.table td a.edit {
	color: #FFC107;
}
table.table td a.delete {
	color: #F44336;
}
table.table td i {
	font-size: 19px;
}
table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}
.pagination {
	float: right;
	margin: 0 0 5px;
}
.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}
.pagination li a:hover {
	color: #666;
}	
.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}
.pagination li.active a:hover {        
	background: #0397d6;
}
.pagination li.disabled i {
	color: #ccc;
}
.pagination li i {
	font-size: 16px;
	padding-top: 6px
}
.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}    
/* Custom checkbox */
.custom-checkbox {
	position: relative;
}
.custom-checkbox input[type="checkbox"] {    
	opacity: 0;
	position: absolute;
	margin: 5px 0 0 3px;
	z-index: 9;
}
.custom-checkbox label:before{
	width: 18px;
	height: 18px;
}
.custom-checkbox label:before {
	content: '';
	margin-right: 10px;
	display: inline-block;
	vertical-align: text-top;
	background: white;
	border: 1px solid #bbb;
	border-radius: 2px;
	box-sizing: border-box;
	z-index: 2;
}
.custom-checkbox input[type="checkbox"]:checked + label:after {
	content: '';
	position: absolute;
	left: 6px;
	top: 3px;
	width: 6px;
	height: 11px;
	border: solid #000;
	border-width: 0 3px 3px 0;
	transform: inherit;
	z-index: 3;
	transform: rotateZ(45deg);
}
.custom-checkbox input[type="checkbox"]:checked + label:before {
	border-color: #03A9F4;
	background: #03A9F4;
}
.custom-checkbox input[type="checkbox"]:checked + label:after {
	border-color: #fff;
}
.custom-checkbox input[type="checkbox"]:disabled + label:before {
	color: #b8b8b8;
	cursor: auto;
	box-shadow: none;
	background: #ddd;
}
/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
}
.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}
.modal .modal-content {
	border-radius: 3px;
	font-size: 14px;
}
.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}
.modal .modal-title {
	display: inline-block;
}
.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}
.modal textarea.form-control {
	resize: vertical;
}
.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}	
.modal form label {
	font-weight: normal;
}	
</style>
<script>
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});
</script>
</head>
    <body>
        
         <% 
             
             if(UPLOAD_DIRECTORY!=null)
             {
                 
                String name=mreq.getParameter("fname");
             if(name!=null)
             {
                 String uploadedfilename = mreq.getFilesystemName("fimg");
             File newfileloc = new File(NEW_UPLOAD_DIRECTORY + "/" + uploadedfilename);
             Boolean uploadresult = mreq.getFile("fimg").renameTo(newfileloc);
             String price=mreq.getParameter("price");
             String description=mreq.getParameter("description");
             String currentprice= mreq.getParameter("currentprice");
             String category= mreq.getParameter("category");
             if(name!=null&&price!=null&&description!=null&&uploadedfilename!=null&&currentprice!=null&&category!=null)
             {   
                 String query = ("insert into addfood(fname,price,description,fimg,currentprice,category) values('"
							+ name + "','" + price + "','" + description + "','" + uploadedfilename + "','" + currentprice + "','" + category + "')");
        
                 conn.insertUpdateFromSqlQuery(query);
                 
             }
        
           }
             }
             
            
        %>
       
        <% 
            
                  String uploadedimagename=null;
                  int i=0;
                  if(UPLOAD_DIRECTORY!=null){
                  String ename=mreq.getParameter("ename");
                  if(ename!=null)
                  {
                      i=Integer.parseInt(mreq.getParameter("eid"));
                  try
                  {
                     uploadedimagename=mreq.getFilesystemName("eimage");
                  File newloc=new File(NEW_UPLOAD_DIRECTORY + "/" + uploadedimagename);
                  Boolean uploadres=mreq.getFile("eimage").renameTo(newloc);
                  }
                  catch(Exception e)
                  {
                         ResultSet rs3=  conn.getResultFromSqlQuery("select * from addfood where fid='" + i + "'"); 
                         while(rs3.next())
                         {
                             uploadedimagename=rs3.getString(5);
                         }
                  }
                     String eprice=mreq.getParameter("eprice"); 
                     String edescription=mreq.getParameter("edescription");  
                     String ecurrent=mreq.getParameter("ecurrent"); 
                     String ecategory=mreq.getParameter("ecategory"); 
                     if(ename!=null&&eprice!=null&&edescription!=null&&uploadedimagename!=null&&ecurrent!=null&&ecategory!=null)
                     {   
                        
                         String query1 = ("update addfood set fname='"+ ename + "',price='" + eprice + "',description='" + edescription + "',fimg='" + uploadedimagename + "',"
                                 + "currentprice='" + ecurrent + "',category='" + ecategory + "' where fid='" + i + "'");

                         conn.insertUpdateFromSqlQuery(query1);
                     }
                  }
                  }
                                           
                                  
        %>
        
        <%
            String del=request.getParameter("delfood");
            if(del!=null)
            {  
               int j=Integer.parseInt(request.getParameter("delid"));
               String query2=("delete from addfood where fname='" + del + "'");  
               conn.insertUpdateFromSqlQuery(query2);
               String query4=("UPDATE `addfood` set fid=fid-1 WHERE fid>" + j +"");
               conn.insertUpdateFromSqlQuery(query4);
               ResultSet rs2=conn.getResultFromSqlQuery("SELECT fid FROM `addfood` ORDER BY fid DESC LIMIT 1"); 
               if(rs2.next()){int k=rs2.getInt(1);
               String query3=("ALTER TABLE `addfood` AUTO_INCREMENT=" + k + "");
               conn.insertUpdateFromSqlQuery(query3);}
               else
               {
                   String query5=("ALTER TABLE `addfood` AUTO_INCREMENT=1");
                   conn.insertUpdateFromSqlQuery(query5);
               }
               
            }
              
        %>
<div class="container">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Add<b> Food Items</b></h2>
					</div>
					<div    class="col-sm-6">
						<a href="#addFoodModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Food</span></a>
						<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
					</div>
				</div>
			</div>
<! add food >
<div id="addFoodModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
                    <form action="additems.jsp" method="post" enctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">Add Food</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
				    <div class="form-group">
                                        <label>Name</label>
						<input type="text" class="form-control" name="fname" required>
					</div>					
					<div class="form-group">
						<label>Price</label>
						<input type="text" class="form-control" name="price" required>
					</div>
					<div class="form-group">
						<label>Description</label>
						<input type="text" class="form-control" name="description" required>
					</div>
					<div class="form-group">
						<label>Image</label>
                                                
						<input type="file" class="form-control" name="fimg">
					</div>
					<div class="form-group">
						<label>Current Price</label>
						<input type="text" class="form-control" name="currentprice" required>
					</div>	
					<div class="form-group">
                                            
                                            <select class="form-control" name="category"> 
                                                <option selected disabled>...select category...</option>
                                                <option>starter</option> 
                                                <option> main course</option> 
                                                <option> dessert</option> 
                                            </select>
						
					</div>					
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-success" value="Add" name="add">
				</div>
			</form>
		</div>
	</div>
</div>

			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
						</th>
                                                <th>ID</th>
						<th>Name</th>
						<th>Price</th>
						<th>Description</th>
						<th>Image</th>
						<th>Current Price</th>
						<th>Category</th>
						<th>Actions</th>
					</tr>
				</thead>
                                <%  ResultSet rs1=  conn.getResultFromSqlQuery("select * from addfood"); 
                                 while(rs1.next()){
                                %>
                                <!-- Edit Model HTML -->
<div id="e<%=rs1.getInt(1)%>" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
                    <form action="additems.jsp" method="post" enctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">Edit Food</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>
				</div>
				<div class="modal-body">
                                        <div class="form-group">
						<label>ID</label>
						<input type="text" class="form-control" value="<%=rs1.getInt(1)%>" name="eid"required>
					</div>
					<div class="form-group">
						<label>Name</label>
						<input type="text" class="form-control" value="<%=rs1.getString(2)%>" name="ename"required>
					</div>
					<div class="form-group">
						<label>Price</label>
						<input type="text" class="form-control" value="<%=rs1.getString(3)%>" name="eprice" required>
					</div>
					<div class="form-group">
						<label>Description</label>
					<input type="text" class="form-control"  value="<%=rs1.getString(4)%>" name="edescription" required>
					</div>
					<div class="form-group">
						
                                                <img src="food_pics/<%= rs1.getString(5)%>" class="image-fluid " style="border-radius:30%; max-width:60px;">
                                                
                                                <input type="file" class="form-control" value="<%=rs1.getString(5)%>" name="eimage"/>
					        
                                        </div>
					<div class="form-group">
						<label>Current Price</label>
						<input type="text" class="form-control"  value="<%=rs1.getString(6)%>" name="ecurrent"required>
					</div>	
					<div class="form-group">
                                            
                                            <select class="form-control" name="ecategory">
                                               
                                                <option>starter</option> 
                                                <option> main course</option> 
                                                <option> dessert</option>
                                               
                                            </select>
					</div>						
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="Save">
				</div>
			</form>
		</div>
	</div>
</div>

<!-- Delete Modal HTML -->
<div id="d<%=rs1.getInt(1)%>" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
                    <form action="additems.jsp" method="post" >
				<div class="modal-header">						
					<h4 class="modal-title">Delete Food</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>Are you sure you want to delete these Records?</p>
                                        <div class="form-group">
					<label>Food ID</label>
					<input type="text" class="form-control" value="<%=rs1.getInt(1)%>" name="delid"required>
					</div>
                                        <div class="form-group">
					<label>Name</label>
					<input type="text" class="form-control" value="<%=rs1.getString(2)%>" name="delfood"required>
					</div>
					<p class="text-warning"><small>This action cannot be undone.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Delete">
				</div>
			</form>
		</div>
	</div>
</div>
				<tbody>
					<tr>
						<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1">
								<label for="checkbox1"></label>
							</span>
						</td>
                                                <td><%=rs1.getInt(1)%></td>
                                                <td><%=rs1.getString(2)%></td>
						<td><%=rs1.getString(3)%></td>
						<td><%=rs1.getString(4)%></td>
						<td><img src="food_pics/<%= rs1.getString(5)%>" class="image-fluid "  style="border-radius:50%;width:150px;height:150px;"></td>
						<td><%=rs1.getString(6)%></td>
						<td><%=rs1.getString(7)%></td>
						<td>
							<a href="#e<%=rs1.getInt(1)%>" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#d<%=rs1.getInt(1)%>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
						</td>
					</tr>
					</tbody>
                                       <% } %>
                                     
                        </table>
			
		</div>
	</div>        
</div>
             
</body>
 <jsp:include page="home/jsp/footer.jsp" />  
 <script>  
if ( window.history.replaceState ) { 
        window.history.replaceState( null, null, window.location.href ); 
    } 
</script> 
</html>