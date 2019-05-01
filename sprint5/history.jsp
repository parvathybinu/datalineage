

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@include file="style.jsp" %>
    <%@include file="adminHeader.jsp" %>
    <body>
        
<!-- <h4 class="title"><span class="text"><strong>Admin Home</strong></span></h4>-->
                    
                 
      <%!
String username;
String orginalfile;
String file;
String date;
String pdf;
    %>
    
    <%
  
    Connection con=DbConnection.createConnection();
    String sql="select * from dhistory";
    PreparedStatement pst=con.prepareStatement(sql);
    ResultSet rs=pst.executeQuery();
    %>
  
      <div id="wrapper" class="container" >
    <section class="main-content">
        <div class="row">
	<div class="" >
            
            <center>
		<h4 class="title"><span class="text"><strong>Download History</strong></span></h4>
               
                
      <table  width="885" border="1" align="center">
    <% 
    while(rs.next())
    {
    	 username=rs.getString("userName");
    	 orginalfile=rs.getString("orginalFile");
         file=rs.getString("fileName");
    	date=rs.getString("date");
       
        
    %>
    
      <tr>
         <td width="200" height="46"><%=username%></td>
                 
                    <td width="200"><%=orginalfile%></td>
     <td width="200"><%=file%></td>
                   <td width="200"><%=date%></td>
                    <%
        }%>
                  </tr>
    
                </table>
                
                
    </center>
    

   
      </div>
  
    
        </div>
    </section>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
