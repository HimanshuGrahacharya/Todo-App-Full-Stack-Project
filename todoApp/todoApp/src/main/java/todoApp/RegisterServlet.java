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

@WebServlet("/registerservlet")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String mob = req.getParameter("mob");
		String email =  req.getParameter("email");
		String password = req.getParameter("pass");
		long phone = Long.valueOf(mob);
		
		if(email.equals(null) || password.equals(null)) {
			resp.setContentType("text/html");
			PrintWriter p = resp.getWriter();
			p.print("invalid email or password");
			RequestDispatcher r = req.getRequestDispatcher("register.jsp");
			r.include(req, resp);
		}else {
			  
			  try{

				  Class.forName("com.mysql.cj.jdbc.Driver");
				  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todoapp","root","root");
				  PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?)");
				  ps.setString(1,name);
				  ps.setLong(2, phone);
				  ps.setString(3, email);
				  ps.setString(4, password);
				 
				  ps.executeUpdate();
			      con.close();
			  }
			  catch (Exception e) {
					e.printStackTrace();
					System.out.println("Exception");
				}
			 
			resp.sendRedirect("login.jsp");
		}
	}

}
