
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DbConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.register"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
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
        <div id="wrapper" class="container">
  <section class="main-content">
<div class="row">
											

<div class="">
    <center>
		<h4 class="title">
                   
                        <span class="title"><span class="text" ><strong>All User details</strong></span></span>
    <br/>
   
                      
       <%!
String fullName;
String Email;
String userName;
String password;
String image;
String imagepath;
String role;
    %>
    <%
    List<register> registers=new ArrayList();
    Connection con=DbConnection.createConnection();
    String sql="select * from register";
    PreparedStatement pst=con.prepareStatement(sql);
    ResultSet rs=pst.executeQuery();
    %>
      <table width="885" border="1">
    <% 
    while(rs.next())
    {
    	 fullName=rs.getString("fullName");
    	 Email=rs.getString("Email");
    	userName=rs.getString("userName");
    	//image=rs.getString("image");
        role=rs.getString("role");
    	imagepath="images/"+image;
    %>
      <tr>
     <!--  <td width="269" height="46"><img width="200" height="150" src="<%=imagepath%>"></td>-->
          <td width="106"><%=fullName%></td>
                    <td width="106"><%=userName%></td>
                    <td width="106"><%=role%></td>
                    <%
        }%>
                  </tr>
                </table>
    </center>	
                                 	</div>
							</div>						
						</div>
                                </div>
                </section>
   
    </body>
    <%@include file="footer.jsp" %>
</html>
