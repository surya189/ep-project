<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>View</title>
<link rel='stylesheet' href='styles.css'>
<style>
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
        <h2>View All Details</h2>
        <table>
        	<tr>
        		<th>View All Elections</th>
        		<td><a href='a_3_1_allElections.jsp'>View</a></td>
        	</tr>
        	<tr>
        		<th>View All Candidates</th>
        		<td><a href='a_3_2_allCandidates.jsp'>View</a></td>
        	</tr>
        	<tr>
        		<th>View All Users</th>
        		<td><a href='a_3_3_allUsers.jsp'>View</a></td>
        	</tr>
        	<tr>
        		<th>View All Votes</th>
        		<td><a href='a_3_4_allVotes.jsp'>View</a></td>
        	</tr>
        </table>
    </div>
</body>
</html>