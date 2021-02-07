 
  <%@ page import="java.util.*" %>
 <%@page import="java.util.logging.*" %>
 <%@page  import= "java.sql.ResultSet,java.sql.Connection" %>
 <%@page import= "java.sql.SQLException,java.sql.DriverManager,java.sql.Statement" %>
 <%@page import= "view.PolicyData,view.DBCoding" %>
  <%@page import= "java.sql.CallableStatement" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>final</title>
  </head>
<% PolicyData pd=new PolicyData();
              Connection connection = null;
              Statement statement=null;
             
          //    String newdocid=request.getParameter("OrderID");
         //      String newpol=request.getParameter("NewPolNo");
             
              //  String newdocidhid = request.getParameter("docid");
             //  String newpolhid = request.getParameter("newpol");
            String newdocid="";     
         String brnm=  session.getAttribute("brnm" ).toString() ;
   String newpol=session.getAttribute("Newpol").toString() ; 
   
  boolean ren_exist = Boolean.parseBoolean(session.getAttribute("Ren_exist").toString());
              if (ren_exist==false)
         {   newdocid=     session.getAttribute("New_docid").toString() ;  }
         else 
         {
         newdocid=session.getAttribute("R_docid").toString();
         }
            
  boolean success=false; String msg="";
           String sql2="",sql4="";
          
                            try{ 
                            //successful
                            
                              connection= 
                               DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test", "efu_gis", "test");
                             //  DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
                               
                     statement = connection.createStatement();
                     
             //                    sql2= " Update uw_main  set policy_type='P',policy_no="+newpol+" where TRIM(uw_doc_id)="+newdocid+"  ";
             //    sql4 = "insert into WEB_MOTOR_RENEWAL_ERROR (ERROR_CODE,ERROR_DESC,ISTATUS,UW_DOC_ID  ) " ;
             //    sql4=sql4+"values ('0','successful','0','"+newdocid+"'   )  ";
             
                          sql2= " Update uw_main  set policy_type='P', policy_no = "+newpol+" where TRIM(uw_doc_id) = "+newdocid+"  ";
                 sql4 = "insert into WEB_MOTOR_RENEWAL_ERROR (ERROR_CODE,ERROR_DESC,ISTATUS,UW_DOC_ID  ) " ;
                 sql4=sql4+"values ('0','successful','0','"+newdocid+"'   )  ";
     
                  statement.execute(sql2);
                   statement.execute(sql4);  
                  success=true;
                 } catch (Exception exp) {
                   success=false;
                   msg=exp.getMessage()+" and cause : "+exp.getCause();
                //  out.println("<script>alert('"+exp.getMessage()+"');</script");
                 }
                 
//                          try{       CallableStatement cStmt3 = connection.prepareCall("{call WEB_RENEWAL_SMS(?,?,?,?,?,?,?,?,?,?,?)}");
//                          
//                          cStmt3.setString(1, session.getAttribute("CLIENT_NM").toString()  );
//                          cStmt3.setString(2,    session.getAttribute("policy_no" ).toString()   );
//                                   cStmt3.setString(3,session.getAttribute("Car_make" ).toString()    );
//                                   cStmt3.setString(4, session.getAttribute("policy_no" ).toString() );
//                                   cStmt3.setString(5,  session.getAttribute("policy_no" ).toString() );
//                                   cStmt3.setString(6,  session.getAttribute("policy_no" ).toString()  );
//                                   cStmt3.setString(7,  session.getAttribute("policy_no" ).toString() );
//                                      cStmt3.setString(8,  session.getAttribute("policy_no" ).toString()  ); 
//                                   cStmt3.setString(9,  session.getAttribute("policy_no" ).toString());
//                                   cStmt3.setString(10,  session.getAttribute("policy_no" ).toString() );
//                                   cStmt3.setString(11, session.getAttribute("policy_no" ).toString());
//                  
//                              cStmt3.execute();    
//                               }
//                 
//                  catch (Exception exp) { 
//                out.println("<script>alert('"+exp.getMessage()+"');</script");
//                 }
                 
                 
                 if (success)
                 {
                 %>
  
  <P>
          <B>Transaction is successfull on docid <%=newdocid%> new polno <%=newpol%> and branch name is <%=brnm%></B>
          <BR>
            
          </P>
           <%
                 }
                  if (success==false)
                 {
                 %>
  
  <P>
          <B>Transaction was successful but record conversion failed on docid <%=newdocid%> new polno <%=newpol%> with error : <%=msg%></B>
          <BR>
               </P>
           <%
                 } 
                  
                 %>
                  
</html>




