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
<title>Add Candidate</title>
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
        <h2>Add Candidate</h2>
        <form method="post"  action='a_2_AddCandidate_dba.jsp'>
<hr>

                    <label for="cnname"> Candidate Name </label>
                    <div>
                        <input type="text" name="cnname" id="cnname" value=""
                            placeholder="Enter Candidate Name">
                    </div>
                    
                    <label for="cnid"> Candidate ID </label>
                    <div>
                        <input type="text" name="cnid" id="cnid" value=""
                            placeholder="Enter Student id">
                    </div>
                    
                     <label for="cnparty"> Candidate Party Name </label>
                    <div>
                        <input type="text" name="cnparty" id="cnparty" value=""
                            placeholder="Enter Candidate Party">
                    </div>               
                    
                      <label for="ele_name"> Select Election  </label>
                    <div>
                        <%
                        try {
                			
                			Class.forName("oracle.jdbc.driver.OracleDriver");
                			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
                					"epproject","project123");
                			System.out.println("Connected to database");

                			 Statement statement = con.createStatement() ;

                			 ResultSet resultset =statement.executeQuery("select * from election") ;
                			 %>
                			 <select name="ele_name" id="ele_name">
                		        <%  while(resultset.next()){ %>
                		            <option value="<%= resultset.getString(1)%> - <%=resultset.getString(2)%>"><%= resultset.getString(1)%> - <%=resultset.getString(2)%></option>
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
                    </div>

					 <label for="cnadate"> Candidate Adding Date </label>
                    <div>
                        <input type="date" name="cnadate" id="cnadate" value="" >
                    </div>
                    
                    <input type="submit" value="Add Candidate">

                </form>
    </div>
</body>
</html>