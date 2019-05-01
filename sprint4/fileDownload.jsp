

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@include file="style.jsp" %>
    <%@include file="consumerHeader.jsp" %>
    
    <body>
        
        
           <center>
       <%!
String fullName;
String email;
String title;
String document;
String image;
String imagepath;
String origfile;
       %>
    <%
     // String name=(String)session.getAttribute("consumer");
         email=(String)session.getAttribute("consumer");
        if(email==null || email=="")
                       {
         //  out.print("please login first");
            RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
            
        }
        %>
        <%
                       
        
   // List<register> registers=new ArrayList();
    Connection con=DbConnection.createConnection();
    String sql="select * from download where email=?";
    PreparedStatement pst=con.prepareStatement(sql);
    pst.setString(1, email);
    
    ResultSet rs=pst.executeQuery();
    %>
    <div id="wrapper" class="container">
    <section class="main-content">
        <div class="row">
	<div class="">
            <center>
		<h4 class="title"><span class="text"><strong>File Download</strong></span></h4>
                
      <table width="885" border="1">
           <tr>
               <th><h1>Name</h1></th>
    <th><h3>Download</h3></th>
    
  </tr>
    <% 
    while(rs.next())
    {
    	//fullName=rs.getString("name");
         document=rs.getString("document");
    	// Email=rs.getString("Email");
    	//userName=rs.getString("userName");
      
         origfile=rs.getString("orijinald");
  
                                
                       
         
               
         
    	
    %>
      <tr>
         
                    
       
          
          
          
          
          
          
          
          
                   <td width="200"><%=document%></td>
                     <td width="86"><label>
                          
        
                             <a href="fileDownload?title=<%=rs.getString("document")%>&name=<%=origfile%>"><h4>Download</h4></a>

                           </label></td>
                    <%
                                       
        }%>
                  </tr>
                </table>
    </section>
                    </div>
                    
    
                    
    </center>
</div>       
    </body>
    <%@include file="footer.jsp" %>
</html>
