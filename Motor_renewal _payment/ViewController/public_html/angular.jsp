<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@page import="java.util.ArrayList,view.DBCoding" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
  
    <link type="text/css" rel="stylesheet" href="resources/css/w3.css"/>
  
    <script type="text/javascript" src="resources/js/jquery-3.1.1.js"></script>
   
    <script src="resources/js/jquery-ui.js"></script>
<link type="text/css" rel="stylesheet" href="resources/css/jquery-ui.css"/>
        <!--<script type="text/javascript" src="resources/js/jquery.tablesorter.pager.js"></script>-->
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.6.7/angular.min.js"></script>
        <link type="text/css" rel="stylesheet" href="resources/css/locstyle.css"/>
  
  <script>



</script>
  <style type="text/css">
  body
 { 
 /*background-image: url("pakistani_industry_chrom.jpg");*/
  
  background-repeat: no-repeat;
  background-size: 108.0%;
     transition: background-color .5s;
}
datalist  {    height: 50px;    background-color: lavender;}
.sidenav {
    height: 320px;
    width: 100px;
    position: fixed;
    z-index: 1;
    top: 20%;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
     overflow-y: hidden;
    transition: 0.5s;
    padding-top: 60px;
    margin-left:0.5%;
    /*opacity: 0.5;*/
}

.sidenav  input[type='button'] {
 background-color: #111;
  margin-left: 200px;
	border:none;
    margin:0;
    padding:0;
	color: #818181;
	cursor: pointer;
	min-width:3%;max-width:45%;
        
	padding: .000001em;
   /* padding: 8px 8px 8px 32px;*/
    text-decoration: none;
    font-size: 25px;
   /* color: #818181;*/
   
    display: block;
    transition: 0.3s;
}


.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	-webkit-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #3d94f6), color-stop(1, #1e62d0));
	background:-moz-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:-webkit-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:-o-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:-ms-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:linear-gradient(to bottom, #3d94f6 5%, #1e62d0 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6', endColorstr='#1e62d0',GradientType=0);
	background-color:#3d94f6;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #337fed;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:26px 28px;
	text-decoration:none;
	text-shadow:0px 1px 0px #1570cd;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #1e62d0), color-stop(1, #3d94f6));
	background:-moz-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:-webkit-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:-o-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:-ms-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6',GradientType=0);
	background-color:#1e62d0;
}
.myButton:active {
	position:relative;
	top:1px;
}

.sidenav input[type='button']:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    
    position:absolute;
    font-size: 12px;
  
    
}

input:focus,select:focus{
   border-color: Blue  ;
}

#infotb6 tr:hover {
    background-color: #ccc;
}

#infotb6 td:hover {
    cursor: pointer;
}
#infotb2 tr:hover {
    background-color: #ccc;
}

#infotb2 td:hover {
    cursor: pointer;
}

#main {
    transition: margin-left .5s;
    padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
  .sidenav input[type='button']  {font-size: 18px;}
}
.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 20px;
    color: #818181;
    display: block;
    transition: 0.3s;
}
label{
  font-family: Verdana;
   font-size: 11pt;
    font-weight: 500;
     color: Black;
}
.sidenav label:hover, .offcanvas label:focus{
    color: #f1f1f1;
}
.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}
#provlist :-webkit-calendar-picker-indicator {
  display: none;
}
#main{
    height: 700px;
    background: #464763; /* For browsers that do not support gradients */    
    background: -webkit-linear-gradient(left top,  #aed8f2,#0991e5); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient(bottom right ,  #aed8f2,#0991e5); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient(bottom right,#aed8f2,#0991e5); /* For Firefox 3.6 to 15 */
    background: linear-gradient(to bottom right, #aed8f2,#0991e5); /* Standard syntax (must be last) */
    
}
#body { background-image: url("../resources/blue_dot.gif");
 background-repeat:repeat; }

 </style>
 <script>

 </script>
 </head>
   <!-- style="  background-color:#8ce4ff;background-image: url('../resources/texture_silver_aluminum.jpg');"-->
  
              <body id="body"  onload="closeNav()">
            
        <table style="width:95%;"><tr style="width:100%;"><td style="width:13%;"><img id="headimg" name="headimg" height="76" width="68" src="resources/logo_efu.png" style="margin-top:23%;margin-left:23%;"/>
      </td><td style="width:100%">
<h2 style=" border-bottom: 0.1px; color: #0991e5;margin-left: 5.2%; margin-right: 10%;  margin-top: 8%;  font-family: Verdana; font-size:13.0pt;">
EFU General Insurance LTD 
<label style="margin-left:14%; color: #0991e5; font-family: Verdana; font-size:13.0pt;">Client Name :  </label>
<label style="margin-left:14%; color: #0991e5; font-family: Verdana; font-size:13.0pt;">Vehicle Registration : </label></h2>
                        </td></tr></table>  
                       
              
    <form  id="main"  class="form-style-9" style=" margin-left:4%;
  margin-top:2.6%; height: 650.0px; max-width: 91.5%;">
     <input type ="hidden" id="lochid" name="lochid"/>
   <input type="hidden" id="idstore" name="idstore" value="" />
   
            
    
  
     <div><label style=" color: red; font-size: 12.0pt; margin-left: 15.0%; font-family: Verdana;" id="msgdisp"> </label> </div>
    
    
        <!--updated at 10:17 on the 5 22-->  
       <h2 style=" border-bottom: 0.1px;  color: #0991e5;  margin-right: 65%; font-family: Verdana; font-size:15.0pt;">Motor Renewal</h2>
   
    <!--<legend>Location</legend>-->
   <div  ng-app = "mainApp" ng-controller = "RenewalVal" style="width:1350px;color: navy;"> 
    <table style=" float: left;  min-width:12%;"  width="720"><tr><td width="150">
    <label width="150" style=" font-family: Verdana; font-size:10.0pt;">Reg. No</label> </td>
    <td width="150">
    <label width="150" style=" font-family: Verdana; font-size:10.0pt;">Engine No. </label> </td>
    <td width="150">
    <label width="150" style=" font-family: Verdana; font-size:10.0pt;">Chassis no. </label> </td>
    </tr> 
    <tr><td width="150">
    <input  tabindex="1"  type="text" style="  width: 100%;min-width:5%;" class="field-style2"  name="regin" id="regin"   ng-model = "RegNo"   aria-label="RegNo"  />  </td>
    <td width="150">
     <input  tabindex="2"  type="text" style="  width: 100%;min-width:5%;" class="field-style2"  name="engin" id="engin" ng-model = "EngineNo"     />  </td>
    <td width="150">
     <input  tabindex="3"  type="text" style="  width: 100%;min-width:5%;" class="field-style2"  name="chassin" id="chassin" ng-model = "ChassisNo"    />  </td>
   
   
    </tr>
   <tr >
                <th>Policy </th>  
                 <th>Client Name  </th>
                 <th>EFU Branch </th>
                 <th>Reg No.</th>
               <th>Engine No.</th>
               <th>Chassis No.</th>
                <th>Make </th>
                 <th>Model Year </th>
                <th>End Date of Risk </th>
            </tr>
         
            <!--<tr ng-repeat = "record in policy">
              <td>{{ student.POLICY_NO }}</td> 
              <td>{{ student.CLIENT_NM }}</td>
              <td>{{ student.BRANCH_NM }}</td>
              <td>{{ policy.REG_NO }}</td>
               <td>{{ student.ENGINE_NO }}</td>
               <td>{{ student.CHASIS_NO }}</td>
               <td>{{ student.MAKE }}</td>
               <td>{{ student.MODEL_YEAR }}</td>
               <td>{{ student.RISK_END_DATE }}</td>
              
               
            </tr>-->
            <tr> <td><input type="button" value="Validate" ng-click="reset(RegNo)"/></td></tr>
  </table>
 </div>




      </form>
    </body>
</html>