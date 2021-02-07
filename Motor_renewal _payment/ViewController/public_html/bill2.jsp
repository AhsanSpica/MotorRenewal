<!DOCTYPE html>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import ="view.PolicyData"  %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>bill2</title>
   
    <%--<%
    out.println("<script> alert("+request.getParameter("docid")+") </script>  ");  
    
    
    %>--%>
    <%PolicyData pd =new PolicyData();
    String newdocid="";
    String brnm=  session.getAttribute("brnm" ).toString() ;
    // String bremail=  session.getAttribute("bremail" ).toString() ;
   String newpol=session.getAttribute("Newpol").toString() ; 
  boolean ren_exist = Boolean.parseBoolean(session.getAttribute("Ren_exist").toString());

      if (ren_exist==false)
 {   newdocid=     session.getAttribute("New_docid").toString() ;  }
 else 
 {
 newdocid=session.getAttribute("R_docid").toString();
 }
 
//    if (pd.isRen_exist()==false)
// {   newdocid=pd.getNew_docid();}
// else 
// {
// newdocid=pd.getR_docid();
// }
    
    
    %>
   
  </head>
  <body>
  <form name="pay" method="post"      action="register.jsp"   >
  
  <input type="hidden" id="newpol" name="newpol" value="<%=newpol%>"/>
   <input type="hidden" id="docid" name="docid" value="<%=newdocid%>"/>
  <input type="hidden" id="brnm" name="brnm" value="<%=brnm%>"/>
  
<table>	<tr><td>Amount:</td><td><INPUT type="text" value="<%=request.getParameter("premin")%>" name="Amount" readonly="readonly"  id="Amount" ></tr>
	<tr><td>Currency:</td><td><INPUT type="text" value="PKR" name="Currency" id="Currency"  readonly="readonly"></tr>
	<tr><td>Order Name:</td><td><INPUT type="text" value="Eng-no: <%=request.getParameter("eng")%>" name="OrderName" id="OrderName" readonly="readonly"></tr>
	<tr><td>Order Info:</td><td><INPUT type="text" value="Online-Motor-Renewal" name="OrderInfo" id="OrderInfo" readonly="readonly"></tr>
	<tr><td>Order ID:</td><td><INPUT type="text" value="<%=newdocid%>" name="OrderID" id="OrderID" readonly="readonly"></tr>
        <tr><td>Policy No:</td><td><INPUT type="text" value="<%=newpol%>" name="NewPolNo" id="NewPolNo" readonly="readonly"></tr>
	<tr><td></td><td><INPUT type='submit' value="Pay" name='continue' ></tr>
</table>
</form>
  
  
  </body>
</html>