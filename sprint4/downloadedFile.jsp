

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DbConnection"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <%@include file="style.jsp" %>
    <%@include file="AuditorHeader.jsp" %>
    <body>
         <%!
String title;
String file;
String filepath;
 String name;
            String email;
            String doc;
            String orgs;
            int i=0;
    %>
        <%
       
        Connection con=DbConnection.createConnection();
        String sql="select * from download";
        PreparedStatement pst=con.prepareStatement(sql);
        ResultSet rs=pst.executeQuery();
        %>
        
        <div id="wrapper" class="container">
    <section class="main-content">
        <div class="row">
	<div class="">
            <center>
		<h4 class="title"><span class="text"><strong>Downloaded Files</strong></span></h4>
      <table width="500" border="1">
        <%
        while(rs.next())
                       {
            i++;
             name=rs.getString("name");
            email=rs.getString("email");
            doc=rs.getString("document");
            orgs=rs.getString("orijinald");
            //filepath="file/"+file;
        
        %>
        <tr>
        
            <td width="200"><%=i%></td>
            <td width="200"><%=name%></td>
                     <td width="200"><%=email %></td>
                      <td width="200"><%=doc %></td>
                   <td width="200"><%=orgs%></td>
                     
                           <%
        }%>
                  </tr>
          
                </table>
           <span class="text"></span>
            </center>
                   <br/>
            <br/>
        </div>
        </div></section>
        </div>
        
    </body>
    <%@include file="footer.jsp" %>
</html>
