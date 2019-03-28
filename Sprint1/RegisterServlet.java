package servlets;

import bean.register;
import connection.DbConnection;
import dao.RegisterDao;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig(maxFileSize = 16177215)
public class RegisterServlet extends HttpServlet {
    private final String upload_directory="E:\\project";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        
        
        
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String finalimage="";
		
    /*        String name=request.getParameter("fullname");
        String email=request.getParameter("email");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String role=request.getParameter("role");
        
        InputStream inputStream=null;
        
        Part filepart=request.getPart("image");
        
        if(filepart!=null)
        {
            inputStream=filepart.getInputStream();
        }
        register bean=new register();
        bean.setFullName(name);
        bean.setEmail(email);
        bean.setUserName(username);
        bean.setPassword(password);
        bean.setRole(role);
        bean.setImages(filepart);
	
	
RegisterDao dao=new RegisterDao();
	
		String userRegistered=dao.registerUser(bean);
		
		System.out.println(userRegistered);
		if(userRegistered.equals("success"))   //On success, you can display a message to user on Home page
		{
			System.out.println("hai");
		RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
		rd.forward(request, response);
		
		}
		else   //On Failure, display a meaningful message to the User.
		{
		request.setAttribute("errMessage", userRegistered);
		request.getRequestDispatcher("register.jsp").forward(request, response);
		}	  
	  
	*/
         Connection con=DbConnection.createConnection();
      String[]names=new String[6];
		 int i=0;
        //register bean=new register();
        
       // RegisterDao regs=new RegisterDao();
        
        int n=0;
      
             if(ServletFileUpload.isMultipartContent(request))
      {
          List<FileItem> multiparts;
         try{
              multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
              
                 for(FileItem item:multiparts)
          {
                             names[i]=item.getString();
  i++;
   
              if(!item.isFormField())
              {
   
                  String doc=new File(item.getName()).getName();
                  item.write(new File(upload_directory+File.separator+doc));
           
                    Random generator = new Random();
            int r = generator.nextInt(999999);
            String ran=new Integer(r).toString();
                  String query="insert into register(fullName,email,userName,password,role,image,rid) values (?,?,?,?,?,?,?)";
                  PreparedStatement p=con.prepareStatement(query);
                 p.setString(1, names[0]);
                  p.setString(2, names[1]);
                  p.setString(3,names[2]);
                   p.setString(4,names[3]);
                    p.setString(5,names[4]);
               p.setString(6,doc);
               p.setString(7, ran);
           n= p.executeUpdate();
                  
              }
              
              
          }
              
          }  catch (Exception ex) { 
                 Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
             } 
        }
           if(n>0)
          {
			//System.out.println("hai");
                   
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
		
		}
		else   //On Failure, display a meaningful message to the User.
		{
		
		request.getRequestDispatcher("register.jsp").forward(request, response);
		}	  
          
         
       
        
         
      }
            
		
		
        }
	 
	  
	  
	  
	  
		
		
		
		
		
		
		
	  
		
		  
	     
		
		
		
		
		
	

	
		
	


	
		
	

