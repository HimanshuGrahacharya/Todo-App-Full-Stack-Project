<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.	css" >
<link rel="stylesheet" href="bootstrap/bootstrap.css">
</head>
<body>
	<div class="navbar">
		<div class="logo"><a href="">ToDo</a></div>
    	<div class="nav">
    		<ul>
    			<li><a href="index.jsp">home</a></li>
    			<li><a href="">Service</a></li>
    			<li><a href="">About us</a></li>
    			<li><a href="register.jsp"style="color:white">Sign up</a>/  <a href="login.jsp">Sign in</a></li>
    		</ul>
    	</div>
	</div>
	<div class="main-c">
        <div class="reg-form">
            <h1>Register here</h1>
            <form action="registerservlet" method="post">
                <input type="text" placeholder="enter name" name="name">
                <input type="tel" placeholder="enter mobile numbber" name="mob">
                <input type="email" placeholder="enter email" name="email">
                <input type="password" placeholder="enter password" name="pass">
                <button type="submit" class="btn btn-info btn-lg mt-3">sign up</button>
            </form>
        </div>
        <div class="lg-container">
            <div class="in-lgc">
                <h1>Welcome Back</h1>
                <p>To keep connected with us please login <br> with your personal details</p>
                <a href="login.jsp">sign in</a>
            </div>
        </div>
    </div>
</body>
</html>