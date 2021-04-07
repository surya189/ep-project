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
<title>View All Elections</title>
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
        <h2> Choose Election  </h2>
        <form method='post' action='a_3_2_allCandidates_dba.jsp'>
		  <% 
 
		try {
			
		       
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","epproject","project123");
			
			String sql = "select * from election";
			
			
			Statement statement = con.createStatement() ;

			 ResultSet resultset =statement.executeQuery("select * from election") ;

			
		%>
        	<select name="ele_name" id="ele_name">
               <option>Select Election Name - ID</option>
                 <%  while(resultset.next()){ %>
                	<option value="<%= resultset.getString(1)%> - <%= resultset.getString(2)%>"><%= resultset.getString(1)%> - <%= resultset.getString(2)%></option>
                 <% } %>
             </select>
			
			<% 
                		} catch (ClassNotFoundException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		} catch (SQLException e) {
                			// TODO Auto-generated catch block
                			e.printStackTrace();
                		}
                        %>
			<input type="submit" value="Search">
			</form>
    </div>
</body>
</html>