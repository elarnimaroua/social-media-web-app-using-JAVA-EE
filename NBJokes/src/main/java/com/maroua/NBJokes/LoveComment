package com.maroua.NBJokes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/LoveComment")
public class LoveComment extends HttpServlet {
	
      
    
    public LoveComment( ) {
        super();
     
    }
    
	
	protected void doGet(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
	
	}

	
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 int comment_id = Integer.parseInt(Req.getParameter("comment_id"));


	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String db_password="root";
				Connection conn= DriverManager.getConnection(url, user, db_password);
				Statement stm= conn.createStatement();
				
				
				ResultSet j=stm.executeQuery("SELECT nbr_love FROM jeeproject_db.comment WHERE comment_id ='"+comment_id+"'");
				
				int old_nbr_love= Integer.parseInt(j.getString(1));				

				/* --- */
				PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.comment SET nbr_love ='?' WHERE comment_id='?' ");
				
				stmt.setInt(1,old_nbr_love +1);
				stmt.setInt(2,comment_id); 


				int i=stmt.executeUpdate();  

	     }catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     
	  

		 

		
	}

}
