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
<title>Add Election</title>
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
        <%
        try {
			String e_name = request.getParameter("elname");    
		    String e_id = request.getParameter("elid");
		    String ele_sdate = request.getParameter("elsdate");    
		    String ele_edate = request.getParameter("eledate");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"epproject","project123");

			 String sql = "insert into election values (?,?,?,?)";
			 PreparedStatement pst = con.prepareStatement(sql);

			    pst.setString(1, e_name);
			    pst.setString(2, e_id);
			    pst.setString(3, ele_sdate);
			    pst.setString(4, ele_edate);
			    ResultSet resultSet = pst.executeQuery();
			    System.out.println("Election added");
			    if(resultSet.next()) {
			    	out.print("<h3 class='logouthead3'>Election Added successfull</h3>");
			    	out.print("<h3 class='logouthead3'> Add Candidate <a href='a_2_addCandidate.jsp'>Here</a></h3>");
			    }else {
			    	out.print("<h3 class='logouthead3'>Election Added Unsuccessfully.</h3>");
			    	out.print("<h3 class='logouthead3'> Add Again <a href='a_1_addElection.jsp'>Here</a></h3>");
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