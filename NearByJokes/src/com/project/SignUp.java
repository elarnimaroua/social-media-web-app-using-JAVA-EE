package com.project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SignUp( ) {
        super();
     
    }
    
	
	protected void doGet(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
	
	}

	
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String name = Req.getParameter("First name");
		 String lastname = Req.getParameter("Last name");
		 String birthday = Req.getParameter("birthday");
		 String adress = Req.getParameter("adress");
		 String city = Req.getParameter("city");
		 String email = Req.getParameter("email");
		 String pass1 = Req.getParameter("password1");
		 String pass2 = Req.getParameter("password2");
	     
	     /* TEST TEST*/
		
	}

}
