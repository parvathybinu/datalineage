

<%@page import="dao.requestAccess"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.register"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
    </head>
    <%@include file="style.jsp" %>
    <%@include file="ownerHeader.jsp" %>
    <body>
       
        
        <div id="wrapper" class="container">
  <section class="main-content">
<div class="row">
<div class="span12">													
    <center>
        <div class="span12">
                                            <div class="row">
					<div class="span12">
		<h4 class="title">
<span class="text"><strong>ALL CONSUMER REQUESTS</strong></span></h4>
    <br/>
           
       <%!
String fullName;
String email;
String userName;
String document;
String image;
String imagepath;
 String name;

 int rid;
    %>
    <%
           name=(String)session.getAttribute("owner");
       // String emil=(String)session.getAttribute("usname");
        if(name==null || name=="")
                       {
            out.print("please login first");
            RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
            rd.include(request, response);
            
        }
        %>
    <%
       
    //String oemail=(String)session.getAttribute("name");
   // List<register> registers=new ArrayList();
    Connection con=DbConnection.createConnection();
    String sql="select * from request where ONemail=?";
    PreparedStatement pst=con.prepareStatement(sql);
    pst.setString(1, name);
   // out.print(pst);
    ResultSet rs=pst.executeQuery();
    %>
      <table  width="885" border="1">
    <% 
    while(rs.next())
    {
         rid=rs.getInt("id");
    	 userName=rs.getString("email");
         document=rs.getString("document");
    	// Email=rs.getString("Email");
    	//userName=rs.getString("userName");
         Connection connection=DbConnection.createConnection();
         String sqls="select * from register where userName=?";
         
         PreparedStatement psts=connection.prepareStatement(sqls);
         psts.setString(1, userName);
        //out.print(psts);
         ResultSet rs1=psts.executeQuery();
         while(rs1.next())
                                 {
             fullName=rs1.getString("fullName");
             email=rs1.getString("email");
           // userName=rs.getString("userName");
         
               
         
    	
    %>
      <tr>
                    <td width="106" height="30"><%=fullName%></td>
                    <td width="200"><%=email%></td>
                <td width="200"><%=document%></td>
   <%
                    Connection con1=DbConnection.createConnection();
    String sql1="select * from download where email=? and rid=?";
    PreparedStatement ps=con1.prepareStatement(sql1);
    ps.setString(1,userName);
    ps.setInt(2, rid);
    ResultSet r=ps.executeQuery();
    
    if(r.next())
    {
                    %>

                    <td width="86"><label>
                             <a href="#">Accepted</a>
                    </label></td>
                    <%
}
    else
{
%>                  
                                  
                    <td width="86"><label>
                            <a href="ownerResponse?file=<%=document%>&uname=<%=userName%>&rid=<%=rid%>">Accept</a>
                    </label></td>
                    <%
                    
}                         }
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
