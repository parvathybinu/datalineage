

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script> 
function validate()
{ 

       // alert("hai");
var fullname = document.form.fullname.value;
alert(fullname);
var email = document.form.email.value;
var username = document.form.username.value; 
var password = document.form.password.value;
var role=document.form.role.value;
var atpos=email.indexOf("@");

var dotpos=email.lastIndexOf(".");
 var rpass=document.getElementById('re_password').value;
if (fullname==null || fullname=="")
{ 
alert("Full Name can't be blank"); 
return false; 
}

else if (username==null || username=="")
{ 
alert("Username can't be blank"); 
return false; 
}
 else if ((username.length<=3)||(username.length>=25))
    {
        alert("Enter a valid username"); 
       return false;
    }
    else if (!isNaN(username))
    {
        alert("Enter a valid username"); 
       return false;
    }
else if (email==null || email=="")
{ 
alert("Email can't be blank"); 
return false; 
}
else if(atpos<1||dotpos<atpos+3||dotpos+2>=email.length)
{
alert("Enter a valid email address");
return false;
}

else if(password.length<6)
{ 
alert("Password must be at least 6 characters long."); 
return false; 
} 
  else  if(rpass==''){
        
       alert("Re-enter password"); 
       return false;
    }
 else  if (password!= rpass) {
        
    
        alert("password is not matching"); 
        return false;
    }
else if(role=="please select" || role=="")
    {
      alert("please select box"); 
return false;  
    }
} 
</script> 

    </head>
    <%@include file="style.jsp" %>
    <%@include file="header.jsp" %> 
    <body>
       
        <div id="wrapper" class="container">
       <section class="main-content">				
	<div class="row">
	<div class="span5">					
	
						
						
                                            
                                            
                                            <center>
                                            <h4 class="title"><span class="text"><strong>Register</strong> Form</span></h4>
                                <form name="form" action="RegisterServlet"  onsubmit="return validate();" method="post" class="form-stacked"  enctype="multipart/form-data">
				<fieldset>
                                   <div class="control-group">
									<label class="control-label">FullName</label>
									<div class="controls">
                                                                            <input type="text" name="fullname" placeholder="Enter your FullName" class="input-xlarge">
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">Email address:</label>
									<div class="controls">
                                                                            <input type="email" name="email" placeholder="Enter your email" class="input-xlarge">
									</div>
								</div>
                                    
                                    <div class="control-group">
									<label class="control-label">Username</label>
									<div class="controls">
                                                                            <input type="text" name="username" placeholder="Enter your username" class="input-xlarge">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Password:</label>
									<div class="controls">
                                                                            <input type="password" name="password" placeholder="Enter your password" class="input-xlarge">
									</div>
								</div>	
                               <!--     <div class="control-group">
									<label class="control-label">Repeat Password:</label>
									<div class="controls">
                                                                            <input type="password" name="re_password" placeholder="Retype your password" class="input-xlarge">
									</div>
								</div>	-->
                                                            <div class="control-group">
									<label class="control-label">Role:</label>
									<div class="controls">
                                                                            <select name="role" >
                                                                                <option>please select</option>
                                                                                <option >Consumer</option>
                                                                                <option >Owner</option>
                                                                            </select>
                                                                            
									</div>
								</div>	
                                                            <div class="control-group">
									<label class="control-label">Image:</label>
									<div class="controls">
                                                                            <input type="file" name="image" placeholder="Upload Image" class="input-xlarge">
									</div>
								</div>		
								<div class="control-group">
									
								</div>
								<hr>
								<div class="actions"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Create your account"></div>
							</fieldset>
						</form>	
                                            </center>
                 </div>				
      </div>
	</section>			
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
