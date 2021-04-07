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
<title>Profile</title>
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
	th{
		color : darkcyan;
	}
	a{
		text-decoration:none;
	}
</style>
</head>
<body>
<div class="sidebar">
         <a class='active' >Menu</a>
        <a href='profile.jsp'>Profile</a>
        <a href='u_1_addVote.jsp'>Add Vote</a>
         <a href='u_2_ViewResults.jsp'>View Results</a>
         <a href='UserLogOut'>Log Out</a>
    </div>
    
    <div class='content'>
        <div id='topnav'>
            <p style='text-align: center; color:white; font-family: monospace; font-size: x-large;'>College Election System</p>
        </div>
        <h2> Profile</h2>
        <table>
        <% 
 
		try {
			String  username = (String)session.getAttribute("un");
		     String password = (String)session.getAttribute("pw");
		       
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","epproject","project123");
			
			String sql = "select * from registeruser where username = ?";
			
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, (String)session.getAttribute("un"));
			
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()){
		%>
        	<tr>
				<th>UserName</th>
				<td><%= rs.getString(1) %></td>
			</tr>
			<tr>
					<th>Email</th>
					<td><%= rs.getString(2) %></td>
			</tr>
			<tr>
					<th>Phone Number</th>
					<td><%= rs.getString(3) %></td>
			</tr>
			<tr>
					<th>Branch</th>
					<td><%= rs.getString(4) %></td>
			</tr>
			<tr>
					<th>Gender</th>
					<td><%= rs.getString(5) %></td>
			</tr>
			<tr>
					<th>Password</th>
					<td><%= rs.getString(6) %></td>
			</tr>
			
		<%	
			break;
			}	
	
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		%>
	</table>
		<a href='u_0_updateProfile.jsp'>Update Profile</a>
    </div>
</body>
</html>