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

@WebServlet("/edittask")
public class EditTask extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String status = req.getParameter("status");
		String date = req.getParameter("date");
		  
		  try{

			  Class.forName("com.mysql.cj.jdbc.Driver");
			  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todoapp","root","root");
			  PreparedStatement ps=con.prepareStatement("update task set status=?,date=? where title=?");
			  ps.setString(1,status);
			  ps.setString(2,date);
			  ps.setString(3,title);
			  
			 
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
