package com.maroua.NBJokes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/Login")
public class Login extends HttpServlet {
	
      
    
    public Login( ) {
        super();
     
    }
    
	
	protected void doGet(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
	
	}

	
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String email = Req.getParameter("Email");
		 String entered_password = Req.getParameter("Password");
	     

	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String db_password="root";
				Connection conn= DriverManager.getConnection(url, user, db_password);
				Statement stm= conn.createStatement();
				ResultSet res=stm.executeQuery("SELECT * FROM jeeproject_db.user WHERE `email` = "+email+" LIMIT 1;");
				while (res.next()) {
			        String password = res.getString("password");
			        /*puisque l'email est unique, il suffit de vérifier que le mot de pass est corect*/
			        if (password.equals(entered_password)){
						
			        	/*what happens in the login infos are correct*/
					}
			      }
				
	     }catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     
	  

		 

		
	}

}
