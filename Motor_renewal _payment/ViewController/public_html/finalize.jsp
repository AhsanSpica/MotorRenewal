<%@ page import="ae.co.comtrust.payment.IPG.SPIj.Transaction" %>
  <%@ page import="java.util.*" %>
 <%@page import="java.util.logging.*" %>
 <%@page  import= "java.sql.ResultSet,java.sql.Connection" %>
 <%@page import= "java.sql.SQLException,java.sql.DriverManager,java.sql.Statement" %>
 <%@page import= "view.DBCoding" %>
  <%@page import= "java.sql.CallableStatement" %>
    <HTML>
      <HEAD>
    <script  src="resources/js/poster.js" type="text/javascript"></script>
    <%
         Logger logger=Logger.getLogger(this.getClass().getName());
        // This page will be called after the payer have done the payment on the payment portal
    String propFile = null; // This will contain the path of your SPI.properties file.
     
        propFile = new String(
        System.getProperty("java.home")
        + System.getProperty("file.separator")
        + "lib"
        + System.getProperty("file.separator")
        + "SPI.properties");
        
        try {
		  if(propFile!=null && propFile!=""){
			  String configFilePath = propFile.substring( 0 , propFile.indexOf( "SPI.properties" ))+"SPIWebFinal.log";
			 
			  Handler[] handlerFile = logger.getHandlers();
			  for(int i=0;i<handlerFile.length;i++){
				  handlerFile[i].close();			  
			  }
				
	        FileHandler handler = new FileHandler(configFilePath, true);
	        handler.setFormatter( new java.util.logging.SimpleFormatter() );
	        logger.setUseParentHandlers(true);
	        logger.addHandler(handler);
		  }
	    } catch (Exception e) {
	        //throw new IllegalStateException("Could not add file handler.", e);
	    	e.printStackTrace();
	    }
	     
              Connection connection = null;
              Statement statement=null;
             Statement statement2=null;
           
             String newdocid="";     
         String brnm=  request.getParameter ("brnm" ).toString() ;
         String newpol=request.getParameter ("Newpol").toString() ; 
   
         boolean ren_exist = Boolean.parseBoolean(request.getParameter ("Ren_exist").toString());
              if (ren_exist==false)
         {   newdocid=     request.getParameter ("New_docid").toString() ;  }
         else 
         {
         newdocid=request.getParameter ("R_docid").toString();
         }
        String clname=  request.getParameter ("CLIENT_NM").toString();
       String cellno = request.getParameter ("cell" ).toString();
        String email =   request.getParameter ("email" ).toString();
        String add  =  request.getParameter ("add" ).toString();
        String reg_no  =   request.getParameter  ("reg" ).toString();
        String make =   request.getParameter  ("Car_make" ).toString();
        String  ENGINE_NO=   request.getParameter  ("ENGINE_NO" ).toString();
        String CHASIS_NO =   request.getParameter  ("CHASIS_NO" ).toString();
        String  new_sum=   request.getParameter  ("New_sum" ).toString();
        String  Net_amt=   request.getParameter  ("Net_amt" ).toString();
         
         
	    logger.info("Property File Path = "+propFile);
        Transaction transaction = new Transaction(propFile); // This will create the transaction object by passing the properties file location.
        transaction.initialize("Finalization", "1.0"); // This will initiate the transaction object with Finalization call.
        logger.info("Finalization call Initialized");
        transaction.setProperty("TransactionID",request.getParameter("TransactionID"));
         logger.info("TransactionID"+transaction.getProperty("TransactionID"));
        logger.info("Executing the Finalization call");
        transaction.execute(); // At this point the Finalization request will be sent to payment gateway with the above configrations.
        logger.info("After Executing the Finalization call, responseCode = "+transaction.getResponseCode());
        int iStatus = 0;
        String strErrMesg = "";
        String strErrDesc = "";
        int strErrCode = 0;
        if (transaction.getResponseCode() != 0){ //If finalization call was not successful get the error code and description.
        iStatus = 2;
        strErrDesc = transaction.getResponseDescription();
        strErrCode = transaction.getResponseCode();
        logger.info("Successfull Finalization call");
        logger.info("iStatus = "+iStatus);
        logger.info("Error Description = "+strErrDesc);
        logger.info("Error Code = "+strErrCode);
       
       //Ahsan code ammendments
         String sql = "", sql3="";
               try{           
                      connection=    
                      //DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test", "efu_gis", "test");
                     
                       DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
                     statement = connection.createStatement();
                       sql3= " Update uw_main set policy_type='D' where uw_doc_id="+newdocid;
                      statement.execute(sql3);
               } catch (Exception exp) { out.println("<script>alert('Error insert Exception : "+exp.getMessage()+"');</script>");}
                
              
                
                  sql =     "insert into WEB_MOTOR_RENEWAL_ERROR (ERROR_CODE,ERROR_DESC,ISTATUS,UW_DOC_ID,APPROVAL_CODE,PAYMENT_DATE,PAYMENT_AMT) " ;
     sql=sql+  "values ('"+strErrCode+"','"+strErrDesc+"','"+iStatus+"','"+newdocid+"' ,'"+transaction.getProperty("ApprovalCode")+"',sysdate,'"+Net_amt+"'  )  ";
           //removed ,NEWPOL,NEWDOC,BRNM  on 12 oct 2018
            //  changed encapsulator object to session on 12 oct 2-18 for net amt  above
            
            try{    connection=  DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");
                     statement2 = connection.createStatement();   
                     statement2.execute(sql);
               
                  // statement.execute(sql3);
                  
                 } catch (Exception exp) { out.println("<script>alert('Error insert Exception : "+exp.getMessage()+"');</script>");}
         
        }
        if (iStatus == 0)  { %> <!-- finalization transaction is successful display the approval code -->
        <P>
          <B>Transaction is successfull</B>
          <BR>
            <B>
              Approval Code: <%=transaction.getProperty("ApprovalCode")%> </B>
          </P>
           <%
           String sql2="",sql4="";
          // String newpol=  pd.getNewpol(); removed on 12 oct 2-18
                            try{ 
                            
                              connection= 
                              //DriverManager.getConnection("jdbc:oracle:thin:@test.efuinsurance.com:1521:test", "efu_gis", "test");
                               DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");       
                               statement = connection.createStatement();
                                 sql2= " Update uw_main set policy_type='P',policy_no='"+newpol+"' where uw_doc_id="+newdocid;
                 statement.execute(sql2);
                  } catch (Exception exp) {
                  out.println("<script>alert('"+exp.getMessage()+"');</script");
                 }
                 
                 sql4 = "insert into WEB_MOTOR_RENEWAL_ERROR (ERROR_CODE,ERROR_DESC,ISTATUS,UW_DOC_ID  ) " ;
                 sql4=sql4+"values ('"+strErrCode+"','"+strErrDesc+"','"+iStatus+"','"+newdocid+"'   )  ";
     
              try{      DriverManager.getConnection("jdbc:oracle:thin:@oda01-scan.efuinsurance.com:1521/efuprd.efuinsurance.com", "efu_gis", "PRODgis");       
                               statement2 = connection.createStatement();
                               statement2.execute(sql4);  
                  
                 } catch (Exception exp) {
                  out.println("<script>alert('"+exp.getMessage()+"');</script");
                 }
               //  changed encapsulator object to session on 12 oct 2-18 here 
                                  try{       CallableStatement cStmt3 = connection.prepareCall("{call WEB_RENEWAL_SMS(?,?,?,?,?,?,?,?,?,?,?)}");
                          
                                cStmt3.setString(1, clname  );
                                cStmt3.setString(2,   newpol  );
                                cStmt3.setString(3,make    );
                                cStmt3.setString(4, reg_no );
                                cStmt3.setString(5,  ENGINE_NO );
                                cStmt3.setString(6,  CHASIS_NO  );
                                cStmt3.setString(7,  add );
                                cStmt3.setString(8,  new_sum  ); 
                                cStmt3.setString(9,  Net_amt);
                                cStmt3.setString(10,  cellno );
                                cStmt3.setString(11, brnm);
                                
                                cStmt3.execute();    
                               }
                 
                  catch (Exception exp) { 
                out.println("<script>alert('"+exp.getMessage()+"');</script");
                 }
                DBCoding db1=new DBCoding();
             
                if (email.length()>0) 
                {  
                //once false for customer once true for branch
               db1.email(clname, email, make, reg_no, ENGINE_NO, CHASIS_NO, cellno, add, new_sum, Net_amt, newpol, false, brnm);
               
                db1.email(clname, email, make, reg_no, ENGINE_NO, CHASIS_NO, cellno, add, new_sum, Net_amt, newpol, true, brnm);  }
                 //email(String email,String make,String reg_no,String ENGINE_NO,String CHASIS_NO,String cellno,String add,String new_sum,String Net_amt)
           
           } else{
        %>  <!-- Transaction is failed display the error code and message -->
          <P>
            Transaction Failed:<BR>  
              Error Code: <%=transaction.getResponseCode()%><BR>
                Error Description: <%=transaction.getResponseDescription()%><BR>
	</P>
          <%}%> 
        
        </HTML>
        
        
