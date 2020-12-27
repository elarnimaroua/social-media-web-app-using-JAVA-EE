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




@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	
      
    
    public EditProfile( ) {
        super();
     
    }
    
	
	protected void doGet(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
	
	}

	
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstname = Req.getParameter("First name");
		String lastname = Req.getParameter("Last name");
		String birthday = Req.getParameter("birthday");
		String address = Req.getParameter("adress");
		String city = Req.getParameter("city");
		String new_email = Req.getParameter("email");
		String entered_password = Req.getParameter("password");
		String zip = Req.getParameter("zip");
		String new_pass = Req.getParameter("new_password");
		String new_pass2 = Req.getParameter("new_password2");
		
		
		HttpSession session = Req.getSession();
     	String old_email =  session.getAttribute("email").toString();

	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String password="Najatelfrougui789";
				Connection conn= DriverManager.getConnection(url, user, password);
				Statement stm= conn.createStatement();
				
				Boolean Valide =true;
				
				ResultSet res=stm.executeQuery("SELECT password FROM jeeproject_db.user WHERE email='" +old_email+"'");
				String Password=res.getString(1);
				
				if (!Password.equals(entered_password)) {
					Valide= false;
				}

				/*s'assurer que le nouveau email n'est pas déja pris par un autre utilisateur*/
				if(!new_email.equals("")) {
					res=stm.executeQuery("SELECT password FROM jeeproject_db.user WHERE email='" +new_email+"'");
					if (res.next()) {
						Valide = false;
					}
				} 
				if(  !new_pass.equals(new_pass2)) {
					Valide = false;
				}
				
				if (!Valide) {
					/*ERREUR, L OPERATION NE PEUT PAS S'EFFECTUER CAR CET EMAIL EST DEJA UTILISE OU LES MDPs ENTREES NE SONT PAS IDENTIQUES*/

					/* l'opération n'est pas effectuée , l'utilisateur est redérigé vers son profile:*/
		        	session.setAttribute("message", "your informations have not been updated successfully due to an error.");
					Req.getRequestDispatcher("/profile.jsp").forward(Req,Res);
					
				}else {
					/*changement du nom*/
					if (!firstname.equals("")) {
						PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.user SET firstname ='?' WHERE email='?' ");
						stmt.setString(1,firstname);
						stmt.setString(2,old_email); 
						int i=stmt.executeUpdate();  }
					/*changement du lastname*/
					if (!lastname.equals("")) {
						PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.user SET lastname ='?' WHERE email='?' ");
						stmt.setString(1,lastname);
						stmt.setString(2,old_email); 
						int i=stmt.executeUpdate();  }
					/*changement du birthday*/
					if (!birthday.equals("")) {
						PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.user SET birthday ='?' WHERE email='?' ");
						stmt.setString(1,birthday);
						stmt.setString(2,old_email); 
						int i=stmt.executeUpdate();  }
					/*changement d' addresse*/
					if (!address.equals("")) {
						PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.user SET address ='?' WHERE email='?' ");
						stmt.setString(1,address);
						stmt.setString(2,old_email); 
						int i=stmt.executeUpdate();  }
					/*changement du city*/
					if (!city.equals("")) {
						PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.user SET city ='?' WHERE email='?' ");
						stmt.setString(1,city);
						stmt.setString(2,old_email); 
						int i=stmt.executeUpdate();  }
					/*changement du Mot de passe*/
					if (!new_pass.equals("")) {
						PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.user SET password ='?' WHERE email='?' ");
						stmt.setString(1,new_pass);
						stmt.setString(2,old_email); 
						int i=stmt.executeUpdate();  }
					
					/*changement d'email */
					if (!new_email.equals("")) {
						PreparedStatement stmt=conn.prepareStatement("UPDATE jeeproject_db.user SET password ='?' WHERE email='?' ");
						stmt.setString(1,new_email);
						stmt.setString(2,old_email); 
						int i=stmt.executeUpdate();  }
					
					
					
					/* l'opération est effectuée avec succes, l'utilisateur est redérigé vers son profile:*/
					session = Req.getSession();
		        	session.setAttribute("message", "your informations have been updated successfully!");
					Req.getRequestDispatcher("/profile.jsp").forward(Req,Res);

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
