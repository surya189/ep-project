package user;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUser() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		

			try {
				String userid = request.getParameter("username");    
			    String pwd = request.getParameter("password");
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
						"system","surya123");
				System.out.println("Connected to database");
				 Statement st = con.createStatement();
				 
				 String sql = "select * from registeruser where username = ? and password = ?";
				 PreparedStatement pst = con.prepareStatement(sql);
				   
				    pst.setString(1, userid);
				    pst.setString(2, pwd);
				    ResultSet resultSet = pst.executeQuery();
				    if(resultSet.next()) {
				    	
				    	HttpSession  session = request.getSession(true);
						
						session.setAttribute("un", userid);
						session.setAttribute("pw", pwd);
				    	
				    	System.out.println("User Logged in");
				    	
				    	response.sendRedirect("profile.jsp");
				    }else {
				    	response.sendRedirect("login.html");
				    }
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
	}

	private PreparedStatement prepareStatement(String string) {
		// TODO Auto-generated method stub
		return null;
	}

}
