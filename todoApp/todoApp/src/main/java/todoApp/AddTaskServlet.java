package todoApp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addtaskservlet")
public class AddTaskServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String desc = req.getParameter("desc");
		String status = req.getParameter("status");
		String date = req.getParameter("date");
		
		if(title.equals(null)) {
			resp.setContentType("text/html");
			PrintWriter p = resp.getWriter();
			p.print("please enter title");
			RequestDispatcher r = req.getRequestDispatcher("service.jsp");
			r.include(req, resp);
		}else {
			  
			  try{

				  Class.forName("com.mysql.cj.jdbc.Driver");
				  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todoapp","root","root");
				  PreparedStatement ps=con.prepareStatement("insert into task values(?,?,?,?)");
				  ps.setString(1,title);
				  ps.setString(2, desc);
				  ps.setString(3, status);
				  ps.setString(4, date);
				 
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
}
