

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
          <%@include file="style.jsp" %>
          <%@include file="adminHeader.jsp" %>
    </head>
    <body>
        <%!
        String email;
        String orginal;
        String owner;
        String title;
        %>
        <%
  //  String email=(String)session.getAttribute("name");
    
    Connection con=DbConnection.createConnection();
    String sql="SELECT d.email,d.orijinald,u.owner,u.title FROM download AS d,ownerupload AS u WHERE u.uid=d.uid;";
    PreparedStatement pst=con.prepareStatement(sql);
    ResultSet rs=pst.executeQuery();
    %>
      <div id="wrapper" class="container">
    <section class="main-content">
        <div class="row">
	<div class="">
            <center>
		<h4 class="title"><span class="text"><strong>Downloaded files</strong></span></h4>
      <table width="885" border="1">
    <% 
    while(rs.next())
    {
    	 email=rs.getString("email");
    	 orginal=rs.getString("orijinald");
         owner=rs.getString("owner");
         title=rs.getString("title");
   
         //pdf="file/"+"Pdflogogt.png";
    %>
      <tr>
       
                  
                    <td width="200" height="46"><%=email %></td>
                  
                    <td width="200" height="46"><%=orginal%></td>
                     <td width="200" height="46"><%=owner%></td>
                      <td width="200" height="46"><%=title%></td>
                    <%
        }%>
                  </tr>
                </table>
            
    </center>
        </div>
        </div></section>
      </div>
       
    </body>
     <%@include file="footer.jsp" %>
</html>
