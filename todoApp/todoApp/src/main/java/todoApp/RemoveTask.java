package todoApp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/removetask")
public class RemoveTask extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("t");
			  
			  try{

				  Class.forName("com.mysql.cj.jdbc.Driver");
				  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todoapp","root","root");
				  PreparedStatement ps=con.prepareStatement("delete from task where title=?");
				  ps.setString(1,title);
				  
				 
				  ps.executeUpdate();
			      con.close();
			  }
			  catch (Exception e) {
					e.printStackTrace();
					System.out.println("Exception");
				}
			 
			  resp.sendRedirect("service.jsp");
		
	}
}
