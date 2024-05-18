<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
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
    			<li><a href="register.jsp">Sign up</a>/  <a href="login.jsp" style="color:white">Sign in</a></li>
    		</ul>
    	</div>
	</div>
	<div class="main-c">
    <div class="lg-container">
        <div class="in-lgc">
            <h1>Create account</h1>
            <p>Enter your personal details and start journey with us</p>
            <a href="register.jsp">sign up</a>
        </div>
    </div>
    <div class="reg-form">
        <h1>Sign in</h1>
        <form action="loginservlet" method="post">
            <input type="email" placeholder="enter email" name="email">
            <input type="password" placeholder="enter password" name="pass">
            <button type="submit" class="btn btn-info btn-lg mt-3">log in</button>
        </form>
    </div>
</div>
</body>
</html>