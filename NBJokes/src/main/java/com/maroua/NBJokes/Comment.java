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




@WebServlet("/Comment")
public class Comment extends HttpServlet {
	
      
    
    public Comment( ) {
        super();
     
    }
    
	
	protected void doGet(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
	
	}

	
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String email = Req.getParameter("email");
		 String comment = Req.getParameter("comment");
		 int post_id = Integer.parseInt(Req.getParameter("post_id"));


	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String db_password="root";
				Connection conn= DriverManager.getConnection(url, user, db_password);
				Statement stm= conn.createStatement();
				/*creating comment Id*/
				ResultSet j=stm.executeQuery("SELECT Max(comment_id) FROM jeeproject_db.post");
				
				int Old_comment_id =Integer.parseInt(j.getString(1));
				int comment_id= Old_comment_id+1;
				
				/*creating datetime string*/
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();  
				String date=dtf.format(now);
				
				/* --- */
				PreparedStatement stmt=conn.prepareStatement("INSERT INTO jeeproject_db.commentaire ()  VALUES (?,?,?,?,?,?)");
				
				stmt.setInt(1,comment_id);
				stmt.setInt(2,0);  /*ceci est le nombre des "love reacts" pour ce commentaire*/
				stmt.setString(3, email); /*l'auteur du commentaire est identifié par son adresse email*/
				stmt.setString(4, comment);
				stmt.setString(5, date);
				stmt.setInt(6,post_id);

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
