<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>comments</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body style="background-color: pink ; background-position: cover ">
	<nav class="navbar navbar-expand-lg navbar-light bg-white">
	    <a class="navbar-brand" href="#">
	    	<img src="logo.jpeg" width="50" height="70" class="d-inline-block align-top" alt="" loading="lazy">
	    </a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    	<div class="navbar-nav">
				<div class="nav-item active" >
		        	<a class="nav-link" href="#" style="font-family: Montserrat, sans-serif; font-size: 1.5em;margin-top: -0.3em;font-weight: 800;color: rgba(0, 0, 0, 1);text-transform: none;font-style: normal;text-decoration: none;line-height: 1.4em;letter-spacing: 0px;text-shadow: 0px 0px 0px rgba(0, 0, 0, 1);}">NBJokes<span class="sr-only">(current)</span>
					</a>
	      		</div>
	      		<div>
		      		<form class="form-inline my-2 my-lg-0 ml-auto">
				      	<input class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search">
				      	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
				      		<i class="fas fa-search"></i>
				      	</button>
				    </form>
				</div>	
	  		</div>
	    	<div class="navbar-nav ml-auto">
	     		<div class="dropdown">
			  		<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    					<i class="fas fa-user"></i>
  					</button>
	  				<ul class="dropdown-menu dropdown-menu-right">
		  				<a class="dropdown-item" href="#"><i class="fas fa-user-circle"></i> Profile</a>
		    			<a class="dropdown-item" href="#"><i class="fas fa-cog"></i> Settings</a>
		    			<a class="dropdown-item" href="#"><i class="fas fa-address-card"></i> About us</a>
		    			<a class="dropdown-item" href="#"><i class="fas fa-question-circle"></i> Help</a>
		    			<a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Log out</a>
	  				</ul>
				</div>
			</div>
	  	</div>
	</nav>
	<br>
	
			<%@page  import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.SQLException,java.sql.Statement,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse"
%>
<%

int post_id=Integer.parseInt(request.getParameter("id"));
System.out.println(post_id);



;
%>
<%
try {
	   Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
		String user="root";
		String password="azerty";
		Connection conn= DriverManager.getConnection(url, user, password);
		Statement stm= conn.createStatement();
		
		

		ResultSet res1=stm.executeQuery("SELECT firstname,contenu,post_title,nbr_like,nbr_dislike,nbr_share,nbr_comments FROM jeeproject_db.post , jeeproject_db.user\r\n" + 
				"where post_id='"+post_id+"' and auteur=email order by date;\r\n");
		while(res1.next()) {String name=res1.getString(1);
		String contenu=res1.getString(2);
		String title=res1.getString(3);
		int voteUp=Integer.parseInt(res1.getString(4));
		int voteDown=Integer.parseInt(res1.getString(5));
		int nbr_share=Integer.parseInt(res1.getString(6));
		int nbr_comments=Integer.parseInt(res1.getString(7));
		%>
		<div class="container">
		<div class="jumbotron" >
			<div>
				<i class="fas fa-user fa-7x"></i><p><%= name%></p>
			</div>
			
			<div style="background:#e5989b !important" class="jumbotron">
				<div class="row">
					<h1><%= title%></h1>
				</div>
				<p><%= contenu%>
				</p>

				<div>
				  	<div class="row">
				    	<button type="button" class="btn btn-secondary mr-1">
				    		vote <i class="fas fa-arrow-alt-circle-up"><%= voteUp%></i> 
				    	</button>
						<button type="button" class="btn btn-secondary mr-1">
							vote <i class="fas fa-arrow-alt-circle-down"><%= voteDown%></i>
						</button>
						<button type="button" class="btn btn-secondary mr-1">
							share <i class="fas fa-share-alt"><%= nbr_share%></i>
						</button>
						<button type="button" class="btn btn-secondary">
							comments <i class="fas fa-comments"><%= nbr_comments%></i>
						</button>
				  	</div>
				</div>
			</div>
			<br>
			<div class="form-group">
	    		<label for="exampleFormControlTextarea1">  </label>
	    		<textarea class="form-control" placeholder="Write your comment here !!" id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-outline-success">Comment</button>
			</div>
			<br>
			<%		}


		
  }catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
%>
			
<%
try {
	   Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://127.0.0.1:3306/jeeproject_db?autoReconnect=true&serverTimezone=UTC&useSSL=False&allowPublicKeyRetrieval=true";
		String user="root";
		String password="azerty";
		Connection conn= DriverManager.getConnection(url, user, password);
		Statement stm= conn.createStatement();
		
		

		ResultSet res=stm.executeQuery("SELECT  C.contenu,nbr_love FROM jeeproject_db.commentaire C,jeeproject_db.post P where C.post_id=P.post_id='"+post_id+"'" + 
				"");
		while(res.next()) {String contenu_comment=res.getString(1);
		System.out.println(contenu_comment);
		String nbr_love=res.getString(2);
		
		%>
			<div class="card">
			  	<div class="card-body">
			    	<%= contenu_comment%>
			  	</div>
			</div>

			<div class="row mr-1">
		    	<button type="button" class="btn btn-secondary mr-1" style=" margin: auto; ">
		    		love <i class="far fa-heart"> <%= nbr_love%> </i>  
		    	</button>
				
				
				<button type="button" class="btn btn-secondary">
					comments <i class="fas fa-comments"> 0 </i>
				</button>
		  	</div>
		  	<%		}


		
  }catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
%>
		  	
		  	
		</div>
	</div>
	







	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>
