

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
					<!--	<div class="span12">
                                            <div class="row">
					<div class="span12">				-->								
				
							<div class="">
                                                            <center>
								<h4 class="title">
									<span class="text"> <strong>UPLOAD FILE</strong></span></span></h4>
                                                                        <br/>
<%
          String name=(String)session.getAttribute("owner");
        String emil=(String)session.getAttribute("usname");
        if(emil==null || emil=="")
                       {
            //out.print("please login first");
            RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
            
        }else
        {
        %>     
       
                                                            <center>
<h1>Upload File</h1>
<form action="ownerUpload" method="post" enctype="multipart/form-data">
<table>
<tr><td>Enter Title</td>
<td><input type="text" name="title"></td>
</tr>

<tr><td>Upload Document</td>
<td><input type="file" name="document"></td>
</tr>

<tr><td></td>
<td><input type="submit" value="Upload"></td>
</tr>


</table>
</form>
        
       </center>
                                                            						
								</div>
							</div>						
						</div>
                                </div>
                </section>
						<!--
						
						<div class="row feature_box">						
							<div class="span4">
								<div class="service">
									<div class="responsive">	
										<img src="themes/images/feature_img_2.png" alt="" />
										<h4>MODERN <strong>DESIGN</strong></h4>
										<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>									
									</div>
								</div>
							</div>
							<div class="span4">	
								<div class="service">
									<div class="customize">			
										<img src="themes/images/feature_img_1.png" alt="" />
										<h4>DATA <strong>FILE UPLOAD</strong></h4>
										<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
									</div>
								</div>
							</div>
							<div class="span4">
								<div class="service">
									<div class="support">	
										<img src="themes/images/feature_img_3.png" alt="" />
										<h4>24/7 LIVE <strong>SUPPORT</strong></h4>
										<p>Lorem Ipsum is simply dummy text of the printing and printing industry unknown printer.</p>
									</div>
								</div>
							</div>	
						</div>	
        
          </div>	
      -->
       <%@include file="footer.jsp" %>
       <%
        }
        %>
    </body>
    
    
</html>
