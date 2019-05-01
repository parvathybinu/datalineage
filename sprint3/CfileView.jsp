

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ownerUpload"%>
<%@page import="java.util.List"%>
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
         <%
             
             
          //String name=(String)session.getAttribute("owner");
        String emil=(String)session.getAttribute("consumer");
        if(emil==null || emil=="")
                       {
            out.print("please login first");
            RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
            rd.include(request, response);
            
        }
        %>
       <center>
       <%!
String title;
String file;
String filepath;
String OwnerEmail;
String pdf;
int oid;
    %>
    
    <%
        String ConEmail=(String)session.getAttribute("consumer");
  //  String email=(String)session.getAttribute("name");
    List<ownerUpload> oploadFile=new ArrayList();
    Connection con=DbConnection.createConnection();
    String sql="select * from ownerupload";
    PreparedStatement pst=con.prepareStatement(sql);
    ResultSet rs=pst.executeQuery();
    %>
      <div id="wrapper" class="container">
    <section class="main-content">
        <div class="row">
	<div class="">
            <center>
		<h4 class="title"><span class="text"><strong>FILE VIEW</strong></span></h4>
      <table width="500" border="1">
    <% 
    while(rs.next())
    {
        oid=rs.getInt("uid");
    	 title=rs.getString("title");
    	 file=rs.getString("document");
         OwnerEmail=rs.getString("owner");
    	filepath="file/"+file;
        pdf="file/"+"Pdflogogt.png";
        
    %>
      <tr>
         <td width="200" height="10"><img width="100" height="20" src="<%=pdf%>"></td>
                   <!-- <td width="200" height="10"><img width="100" height="20" src="<%=filepath%>"><%=file%></td>-->
                    <td width="200"><%=title %></td>
                    <%
                    Connection con1=DbConnection.createConnection();
    String sql1="select * from request where email=? and oid=?";
    PreparedStatement ps=con1.prepareStatement(sql1);
    ps.setString(1, ConEmail);
    ps.setInt(2, oid);
    ResultSet r=ps.executeQuery();
    
    if(r.next())
    {
                    %>

                    <td width="86"><label>
                             <a href="#">Requested</a>
                    </label></td>
                    <%
}
    else
{
%>                  
                    
                     <td width="86"><label>
                             <a href="ConsumerRequest?emails=<%=session.getAttribute("consumer")%>&file=<%=file%>&oemail=<%=OwnerEmail%>&oid=<%=oid%>">Request</a>
                    </label></td>
                    <%
        }%>
        <%
    }
    %>
                  </tr>
                </table>
            
    </center>
        </div>
        </div></section>
      </div>
       
    </body>
    <%@include file="footer.jsp" %>
</html>
