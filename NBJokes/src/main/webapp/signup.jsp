<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
	<title>sign-up</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>

<body style="background-image:url(pinkback.jpg);background-size: cover;">

	<nav class="navbar navbar-expand-lg navbar-light bg-white">
		<a class="navbar-brand" href="http://localhost:8080/NBJokes/signup.jsp">
	    	<img src="logo.jpeg" width="50" height="70" class="d-inline-block align-top" alt="logo" loading="lazy">
	  	</a>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>

	  	<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    	<ul class="navbar-nav mr-auto">
	      		<li class="nav-item active" >
	        	<a class="nav-link" href="http://localhost:8080/NBJokes/signup.jsp" 
	        	style="font-family: Montserrat, sans-serif; font-size: 1.5em;margin-top: -0.3em;font-weight: 800;
	        	color: rgba(0, 0, 0, 1);text-transform: none;font-style: normal;text-decoration: none;line-height: 1.4em;
	        	letter-spacing: 0px;text-shadow: 0px 0px 0px rgba(0, 0, 0, 1);}">
	        		NBJokes
	        		<span class="sr-only">(current)</span>
				</a>
	      		</li>
	    	</ul> 
	  	</div>
	</nav>

	<div class="container">
		<div class="jumbotron" style=" margin-top: 7em" >
			<h1>Sign Up</h1><br>
			<h6>Please fill in this form to create an account !</h6><br><hr>
			<form  method="post" action="SignUp" >
			  	<div class="form-row">
			    	<div class="col-md-6 mb-3">
			      		<label for="validationDefault01">First name</label>
			      		<input name="First name" type="text" class="form-control" id="validationDefault01" value="" required>
			    	</div>
			    	<div class="col-md-6 mb-3">
			      		<label for="validationDefault02">Last name</label>
			      		<input name ="Last name" type="text" class="form-control" id="validationDefault02" value="" required>
			    	</div>
			  	</div>
	  			<div class="form-group">
					<label for="validationDefault03">Select birth date</label>
					<input type="date" name="birthday" max="2020-12-31" min="1900-01-01" class="form-control" id="validationDefault03" required>
				</div>
	  			<br>
			  	<div class="form-row">
			    	<div class="col-md-6 mb-3">
				      	<label for="validationDefault04">Adress</label>
				      	<input name="adress" type="text" class="form-control" id="validationDefault03" required>
			    	</div>
				    <div class="col-md-3 mb-3">
				      	<label for="validationDefault05">City</label>
				      	<select name="city" class="custom-select" id="validationDefault04" required>
					        <option selected disabled value="">Choose...</option>
					        <option>Casablanca</option>
					        <option>Fez</option>
					        <option>Tangier</option>
					        <option>Marrakesh</option>
					        <option>Sale</option>
					        <option>Meknes</option>
					        <option>Rabat</option>
					        <option>Oujda</option>
					        <option>Kenitra</option>
					        <option>Agadir</option>
					        <option>Tetouan</option>
					        <option>Temara</option>
				      	</select>
				    </div>
				    <div class="col-md-3 mb-3">
				      	<label for="validationDefault06">Zip</label>
				      	<input name ="zip" type="text" class="form-control" id="validationDefault05" required>
				    </div>
			  	</div>

			  	<div class="form-row">
			    	<div class="col-md-6 mb-3">
			     	 	<label for="validationDefault07">Email Adress</label>
			     	 	<input name="email" type="email" class="form-control" id="validationDefault01" value="" required>
			     	 	<small id="emailHelp" class="form-text text-muted">
			     	 		We'll never share your email with anyone else.
			     	 	</small>
			   	 	</div>
			 	</div>

			  	<p>
			  	<label for="password1">Password</label>
			    <input type=password name="password1" id="password" class="form-control" minlength="8" maxlength="20" required >
			    
			    <small id="passwordHelpInline" class="text-muted">
			      	Must be 8-20 characters long.
			    </small>
				<p>
			  	<label for="password2">Confirm password</label>
			 	<input type=password id="confirm_password" class="form-control" minlength="8" maxlength="20" ><br>
			 	<div class="text-center">
		            <input type=submit class="btn btn-success " style="width: 200px"  value="Create account">
		        </div>

	        	<script type="text/javascript">
					var password = document.getElementById("password"), confirm_password = document.getElementById("confirm_password");
					function validatePassword(){
					  if(password.value != confirm_password.value) {
					    confirm_password.setCustomValidity("Passwords Don't Match");
					  } else {
					    confirm_password.setCustomValidity('');
					  }
					}
					password.onchange = validatePassword;
					confirm_password.onkeyup = validatePassword;
				</script>

				
			</form>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>