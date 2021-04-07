<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
    response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires","0");
	if(session == null || session.getAttribute("un") == null || session.getAttribute("pw") == null){
		response.sendRedirect("error.html");	
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Profile</title>
<link rel='stylesheet' href='styles.css'>
<style>
	h2{
		color:green;
		font-family: monospace;
	}
	table{
		width: 100%;
		height: 100%;
	}
	table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	}
	th, td {
	padding: 5px;
	text-align: left;
	}
	a{
		text-decoration:none;
	}
</style>
</head>
<body>
<div class="sidebar">
          <a class='active' >Menu</a>
        <a  href="admindash.jsp">Admin Dashboard</a>
      <a  href="a_1_addElection.jsp">Add Election</a>
        <a  href="a_2_addCandidate.jsp">Add Candidate</a>
        <a  href="a_3_view.jsp">View</a>
        <a href='AdminLogOut'>Logout</a>
    </div>
    
    <div class='content'>
        <div id='topnav'>
            <p style='text-align: center; color:white; font-family: monospace; font-size: x-large;'>College Election System</p>
        </div>
        <% 
 
		try {
			String  username = request.getParameter("uname");
		     String password = request.getParameter("pword");
		     String email = request.getParameter("email");
		     String phnum = request.getParameter("phnum");
		     String branch = request.getParameter("branch");
		     String gender = request.getParameter("gender");
		       
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","epproject","project123");
			
			String sql = "update registeruser set email = ?, phonenumber = ?, branch = ?, gender = ?, password = ? where username = ?";
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, phnum);
			pstmt.setString(3, branch);
			pstmt.setString(4, gender);
			pstmt.setString(5, password);
			pstmt.setString(6, username);
	
			int count = pstmt.executeUpdate();
				
				if(count>0){
					out.println("<h3>Successfully updated Profile</h3>");
					out.println("<h3><a href='a_3_3_allUsers.jsp'>View Profile Here</a></h3>");
					
				} else {
					out.println("<h3>update failed</h3>");
				}	
	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		%>
    </div>
</body>
</html>