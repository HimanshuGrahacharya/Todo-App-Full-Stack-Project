<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    			<li><a href="" style="color:white">Service</a></li>
    			<li><a href="">About us</a></li>
    			<li><a href="login.jsp">log out</a></li>
    		</ul>
    	</div>
	</div>
	<h1>Service PAGE</h1>
	<div class="service-page">
		<div class="my-service-btn">
			<button id="add-btn" type="button" class="btn btn-success btn-lg">ADD</button>
			<a href="service.jsp"><button type="button" class="btn btn-info btn-lg"> SHOW LIST </button></a>
		</div>
		<div class="reg-form">
		
		
			
			<table class="table table-striped-columns table-success table-bordered">
	        	<tr class="table-dark">
	            	<th>Title</th>
	            	<th>Description</th>
	            	<th>Status</th>
	            	<th>date</th>
	            	<th colspan="2" class="text-center">update</th>
	        	</tr>
	    	
			  <%
			  try{

				  Class.forName("com.mysql.cj.jdbc.Driver");
				  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todoapp","root","root");
				  Statement st = con.createStatement();
				  ResultSet rs = st.executeQuery("select * from task");
				  int count = 0;
				  while(rs.next()){
					  
					String title = rs.getString(1);
					String desc = rs.getString(2);
					String status = rs.getString(3);
					String date = rs.getString(4);
				  %>
				  <tr>
				  	<td><%= title %></td>
				  	<td><%= desc %></td>
				  	<td><%= status %></td>
				  	<td><%= date %></td>
				 	
				 	<td>
				 		<input type = "hidden" class="t" value = "<%= title %>">
	            		<button style="margin-left:8px" onclick="updateFunction(<%= count++ %>)" class="btn btn-warning" type ="submit">edit</button>
					</td>
	            	<td>
	            		<form action="removetask" method="post">
	            			<input type = "hidden" name ="t" value = "<%= title %>">
	            			<button style="margin-left:-1px" class="btn btn-danger" type ="submit">remove</button> 
				  		</form>
					</td>
	              </tr>
				  <% 
				  
				  }
				 
			      con.close();
			      
			  }
			  catch (Exception e) {
					e.printStackTrace();
					System.out.println("Exception");
				}
			  

			%>
			</table>
		</div>
		
	</div>
	
	
	<script>
	document.getElementById("add-btn").onclick = function() {addFunction()};
	function addFunction() {
		  document.getElementsByClassName("reg-form")[0].innerHTML = 
			  '<form action="addtaskservlet" method="post">'+
			  	'<input type="text" placeholder="enter title" name="title">'+
			   	'<input type="text" placeholder="description" name="desc">'+
			   		'<select name="status">'+
		    			'<option value="">status(select an option)</option>'+
		       			'<option value="ongoing">ongoing</option>'+
		       			'<option value="to be copleted">to be completed</option>'+			       			
		       			'<option value="completed">completed</option>'+
			       	'</select>'+
		       	'<input type="date" placeholder="enter date" name="date">'+
	    		'<button type="submit" class="btn btn-info btn-lg mt-3">add task</button>'+
	    	'</form>';
	    }
		
		function updateFunction(count) {
			var title = document.getElementsByClassName("t")[count].value;
		  document.getElementsByClassName("reg-form")[0].innerHTML = 
			  '<form action="edittask" method="post">'+
			  	'<input type="text" value="enter title" name="title">'+
			   		'<select name="status">'+
		    			'<option value="">status(select an option)</option>'+
		       			'<option value="ongoing">ongoing</option>'+
		       			'<option value="to be copleted">to be completed</option>'+			       			
		       			'<option value="completed">completed</option>'+
			       	'</select>'+
		       	'<input type="date" placeholder="enter date" name="date">'+
	    		'<button type="submit" class="btn btn-info btn-lg mt-3">update</button>'+
	    	'</form>';
	    	document.getElementsByName("title")[0].value = title;
	    }
		
	</script>
	
</body>
</html>