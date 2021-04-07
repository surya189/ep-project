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
<title>Admin Dashboard</title>
<link rel='stylesheet' href='styles.css'>
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
        <h2>Admin Dashboard</h2>
    </div>
</body>
</html>