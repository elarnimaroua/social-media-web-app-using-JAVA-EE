import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.ParseInfo;

/**
 * Servlet implementation class Record_Comment
 */
@WebServlet("/Record_Comment")
public class Record_Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Record_Comment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest Req, HttpServletResponse Res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = Req.getSession();
		 String name =(String) session.getAttribute("email");
		 int post_id = (Integer)session.getAttribute("post_id");
		 String contenu = Req.getParameter("contenu");
		 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
		   LocalDateTime now = LocalDateTime.now();  
		    String date=dtf.format(now);  
		
	     

	     try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
				String user="root";
				String password="azerty";
				Connection conn= DriverManager.getConnection(url, user, password);
				Statement stm= conn.createStatement();
				ResultSet j=stm.executeQuery("SELECT Max(comment_id) FROM jeeproject_db.commentaire \r\n" + 
						"");
				
				int Old_comment=Integer.parseInt(j.getString(1));
				int comment_id= Old_comment+1;
				

				int i=stm.executeUpdate("INSERT INTO jeeproject_db.commentaire ()  VALUES ('"+comment_id+"',0,'"+name+"','"+contenu+"','"+date+"','"+post_id+"')");
			    

				
	     }catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
			
	     
	  

		 

		
	}

}
