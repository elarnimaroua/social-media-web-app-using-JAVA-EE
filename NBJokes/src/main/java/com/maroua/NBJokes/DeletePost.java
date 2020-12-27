package com.maroua.NBJokes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/DeletePost")
public class DeletePost extends HttpServlet {
	
      
    
    public DeletePost( ) {
        super();
     
    }
    
	
	protected void doGet(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
	
	}

	
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int post_id = Integer.parseInt(Req.getParameter("post_id"));
		
		HttpSession session = Req.getSession();
     	String old_email =  session.getAttribute("email").toString();

		/*le traitement pour préciser si ce membre a droit de supprimer le poste sera fait au niveau du fichier jsp, ceux qui n'ont pas le droit n'aurons pas le boutton pour le supprimer*/
		/*par prudence, on va vérifier que l'utiisateur est l'auteur du poste*/
     	HttpSession session = Req.getSession();
     	String user_email =  session.getAttribute("email").toString();
     	
	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String password="Najatelfrougui789";
				Connection conn= DriverManager.getConnection(url, user, password);
				Statement stm= conn.createStatement();

				ResultSet res=stm.executeQuery("SELECT email FROM jeeproject_db.post WHERE post_id='" +post_id+"'");
				String owner_email=res.getString(1);
				
				if(owner_email.equals(user_email)) {
				
					PreparedStatement stmt=conn.prepareStatement("DELETE FROM jeeproject_db.post WHERE post_id='?' ");
					stmt.setInt(1,post_id); 
					
					int i=stmt.executeUpdate(); 
					
		        	session.setAttribute("message", "Your post was successfully deleted");
					Req.getRequestDispatcher("/jokes.jsp").forward(Req,Res);

				}else {

		        	session.setAttribute("message", "The post was not successfully edited due to an error, you do not have the right to execute this operation");
					Req.getRequestDispatcher("/jokes.jsp").forward(Req,Res);
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
