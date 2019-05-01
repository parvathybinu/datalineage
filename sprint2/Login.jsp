
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
           </head>
   <%@include file="style.jsp" %>
    <%@include file="header.jsp" %> 
    <body>
       
        <div id="wrapper" class="container">
       <section class="main-content">				
	<div class="row">
	<div class="span5">
 
</div>
          <center>
                        
                <h4 class="title"><span class="text"><strong>Login</strong> Form</span></h4>
                <form action="ownerLogin" >
			
				<fieldset>
		<div class="control-group">
                    <label class="control-label"><h4>UserName</h4></label>
			<div class="controls">
                            <input type="text" name="name" placeholder="Enter your username" id="username" class="input-xlarge">
					</div>
			</div>
			<div class="control-group">
                            <label class="control-label"><h4>Password</h4></label>
		<div class="controls">
                    <input type="password" name="password" placeholder="Enter your password" id="password" class="input-xlarge">
		</div>
		</div>
                                    <div class="control-group">
			<input tabindex="3" class="btn btn-inverse large" type="submit" value="Sign into your account">
									<hr>
									<p class="reset">Recover your <a tabindex="4" href="#" title="Recover your username or password">username or password</a></p>
								</div>
							</fieldset>
                    
						</form>	
            </center>
					</div>
								
				</div>
			</section>			
        </div
        
    </body>
    <%@include file="footer.jsp" %>
</html>
