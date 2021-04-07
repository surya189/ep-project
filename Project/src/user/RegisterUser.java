package user;
import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
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
			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"system","surya123");
			System.out.println("Connected to database");
			
			PreparedStatement pst = con.prepareStatement("INSERT INTO registeruser VALUES(?,?,?,?,?,?)");
			
			pst.setString(1, (request.getParameter("username"))); 
			
			pst.setString(2, (request.getParameter("email"))); 
			
			pst.setString(3, (request.getParameter("phone"))); 
			
			pst.setString(4, (request.getParameter("branch"))); 
			
			pst.setString(5, (request.getParameter("gender")));
			
			pst.setString(6, (request.getParameter("password"))); 
			
			int count = pst.executeUpdate();
			
			System.out.println("User Registered");
			
			if(count > 0) {
				RequestDispatcher rd = request.getRequestDispatcher("login.html");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd =request.getRequestDispatcher("register.html");
				rd.forward(request, response);		
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
