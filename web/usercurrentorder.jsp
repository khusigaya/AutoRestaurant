
<%@page import="autocs.conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="home/jsp/header.jsp" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
      
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<div class="all-page-title page-breadcrumb">
<div class="container text-center">
    <div class="row">
            <div class="col-lg-12">
                    <h1>Current Order</h1>
            </div>
    </div>
</div>
</div><br>
<body>
<style>
body {
    
    background: linear-gradient(140deg, #fff, 50%, #BA68C8)
}
.container-fluid {
    margin-top: 200px
}

p {
    font-size: 14px;
    margin-bottom: 7px
}

.small {
    letter-spacing: 0.5px !important
}

.card-1 {
    box-shadow: 2px 2px 10px 0px rgb(190, 108, 170)
}

hr {
    background-color: rgba(248, 248, 248, 0.667)
}

.bold {
    font-weight: 500
}

.change-color {
    color: #AB47BC !important
}

.card-2 {
    box-shadow: 1px 1px 3px 0px rgb(112, 115, 139)
}

.fa-circle.active {
    font-size: 8px;
    color: #AB47BC
}

.fa-circle {
    font-size: 8px;
    color: #aaa
}

.rounded {
    border-radius: 2.25rem !important
}

.progress-bar {
    background-color: #AB47BC !important
}

.progress {
    height: 5px !important;
    margin-bottom: 0
}

.invoice {
    position: relative;
    top: -70px
}

.Glasses {
    position: relative;
    top: -12px !important
}

.card-footer {
    background-color: #AB47BC;
    color: #fff
}

h2 {
    color: rgb(78, 0, 92);
    letter-spacing: 2px !important
}

.display-3 {
    font-weight: 500 !important
}

@media (max-width: 479px) {
    .invoice {
        position: relative;
        top: 7px
    }

    .border-line {
        border-right: 0px solid rgb(226, 206, 226) !important
    }
}

@media (max-width: 700px) {
    h2 {
        color: rgb(78, 0, 92);
        font-size: 17px
    }

    .display-3 {
        font-size: 28px;
        font-weight: 500 !important
    }
}

.card-footer small {
    letter-spacing: 7px !important;
    font-size: 12px
}

.border-line {
    border-right: 1px solid rgb(226, 206, 226)
}</style>
                               
                                <script type='text/javascript'></script>
                            </head>
                            <% int sum=0; int b=0,d=0; String c=null; String b1,b2,b3,b4,b5,b6,b7="yes",b8,b9;%>
                            <div class=""id="subho" style="width:1050px;margin: 0 auto;">
    <div class="card card-1">
        <div class="card-header bg-white">
            <div class="media flex-sm-row flex-column-reverse justify-content-between ">
                <div class="col my-auto">
                    <h4 class="mb-0">Thanks for your Order,<span class="change-color">Khushboo</span> !</h4>
                </div>
                <div class="col-auto text-center my-auto pl-0 pt-sm-4"> <img class="img-fluid my-auto align-items-center mb-0 pt-3" src="homepage/images/Capture7.jpg"width="200" height="100" style="border-radius:100%;">
                     <p class="mb-4 pt-0 Glasses"></p>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row justify-content-between mb-3">
                <div class="col-auto">
                    <h6 class="color-1 mb-0 change-color">Receipt</h6>
                </div>
                <div class="col-auto "> <small>Receipt Voucher</small> </div>
            </div>
            <% 
                             ResultSet rs=  conn.getResultFromSqlQuery("select * from currentorder where delivered!='yes'"); int track1=0,track2=0,track=0;
                             while(rs.next()){ c=rs.getString(11);b=rs.getInt(2); d=rs.getInt(3);track=rs.getInt(7); track1=rs.getInt(12);track1++;
                             if(track-track1>=0){
                             String s5=("update currentorder set timetwo=" + track1 +" where fid=" + d + "");
                             conn.insertUpdateFromSqlQuery(s5);} if(rs.getInt(7)>0)track2=(rs.getInt(12)*100)/rs.getInt(7);else track2=0;
                             b8=rs.getString(6); b9=rs.getString(8);
                             if(b8.equals(b7))b1="fa fa-circle active";else b1="fa fa-circle";   if(b9.equals(b7))b2="fa fa-circle active";else b2="fa fa-circle";
                             int result=rs.getInt(3); ResultSet res=conn.getResultFromSqlQuery("select * from addfood where fid=" + result + "");
                             while(res.next()){
             %>
            <div class="row mt-4">
                <div class="col">
                    <div class="card card-2">
                        <div class="card-body">
                            <div class="media">
                                <div class="sq align-self-center "> <img class="img-fluid my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src="food_pics/<%= res.getString(5)%>" style="border-radius:50%;width:150px;height:150px;" /> </div>
                                <div class="media-body my-auto text-right">
                                    <div class="row my-auto flex-column flex-md-row">
                                        <div class="col my-auto">
                                            <h6 class="mb-0"> <%= rs.getString(11) %></h6>
                                        </div>
                                        <div class="col-auto my-auto"> <small><%= res.getString(2) %> </small></div>
                                        <div class="col my-auto"> <small>Each Price : <%= res.getString(6) %></small></div>
                                        <div class="col my-auto"> <small>Quantity : <%= rs.getInt(4) %></small></div>
                                        <div class="col my-auto">
                                            <h6 class="mb-0">&#8377;<%=rs.getInt(4)*Integer.parseInt(res.getString(6))%></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="my-3 ">
                            <div class="row">
                                <div class="col-md-3 mb-3"> <small><span><i class=" " aria-hidden="true"></i></span></small> </div>
                                <div class="col mt-auto">
                                    <div class="media row justify-content-between ">
                                        <div class="col-auto text-right"><span> <small class="text-right mr-sm-2">Confirmed</small> <i class="fa fa-circle active"></i> </span></div>
                                        <div class="flex-col"> <span> <small class="text-right mr-sm-2">Processing</small><i class="<%=b1%>"></i></span></div>
                                        <div class="col-auto flex-col-auto"><small class="text-right mr-sm-2">Served</small><span> <i class="<%=b2%>"></i></span></div>
                                    </div><br>
                                    <div class="progress my-auto">
                                        <div class="progress-bar progress-bar rounded" style="width: <%=track2%>%" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <div class="flex-col"> <span> <small class="text-right mr-sm-2">Processing Countdown - <%=track2%>% </small><i class="fa fa-circle active"></i></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% sum=sum + rs.getInt(4)*Integer.parseInt(res.getString(6));%>
            <%}}%>
            <div class="row mt-4">
                <div class="col">
                    <div class="row justify-content-between">
                        <div class="col-auto">
                            <p class="mb-1 text-dark"><b>Order Details</b></p>
                        </div>
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Total</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">&#8377;<%=sum%></p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"> <b>Discount</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">&#8377;00</p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>GST 18%</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">&#8377;00</p>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="row invoice ">
                <div class="col">
                    <p class="mb-1">Order Id : <%= b %></p>
                    <p class="mb-1">Order Date : <%= c%> </p>
                    
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="jumbotron-fluid">
                <div class="row justify-content-between ">
                    <div class="col-sm-auto col-auto my-auto"><img class="img-fluid my-auto align-self-center " src="https://i.imgur.com/7q7gIzR.png" width="115" height="115"></div>
                    <div class="col-auto my-auto ">
                        <h2 class="mb-0 font-weight-bold">TOTAL PAID</h2>
                    </div>
                    <div class="col-auto my-auto ml-auto">
                        <h1 class="display-3 ">&#8377;<%=sum%> </h1>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>
</body>
 <script>
$(document).ready(function() { /// Wait till page is loaded
setInterval(timingLoad, 1000);
function timingLoad() {
$('#subho').load('usercurrentorder.jsp #subho', function() {
/// can add another function here
});
}
}); 

</script>                       
 <jsp:include page="home/jsp/footer.jsp" />  
 <script> 
if ( window.history.replaceState ) { 
        window.history.replaceState( null, null, window.location.href ); 
    } 
</script> 
</html>