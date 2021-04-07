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
<title>Add Vote</title>
<link rel='stylesheet' href='styles.css'>
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
        
        <%
        try {
			String election_input = request.getParameter("ele_name");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"epproject","project123");
			

			 String sql = "SELECT stu_id FROM votes WHERE ele_id_name = ? AND stu_id = ?";
			 PreparedStatement pst = con.prepareStatement(sql);
			 String st_id  = (String)session.getAttribute("un");
				pst.setString(1, election_input);
				pst.setString(2, st_id);
				ResultSet rs = pst.executeQuery();
				
				if(rs.next()){
					Boolean res = st_id.equals(rs.getString(1));
					if(res == true){
						out.print("<h3>Your vote has been added !!</h3>");
						
					}}else{
						%>
						<h2>Add Vote</h2>
				        <form method='post' action='u_1_AddVote_dba.jsp'>
				        <table>
							<tr>
							<th>ELECTION NAME </th>
							<th>CANDIDATE NAME</th>
							<th>CANDIDATE ID</th>
							<th>CANDIDATE PARTY</th>
							<th>VOTE CANDIDATE</th>
							</tr>
				                        <%
				                        try {
				                			String election_input1 = request.getParameter("ele_name");
				                			Class.forName("oracle.jdbc.driver.OracleDriver");
				                			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
				                					"epproject","project123");
				                			
						
				                			 String sql1 = "SELECT * FROM candidates WHERE c_ele_name = ?";
				                			 PreparedStatement pst1 = con.prepareStatement(sql1);
												pst1.setString(1, election_input1);
												ResultSet rs1 = pst1.executeQuery();
												session.setAttribute("ElectionInput",election_input1);
												while(rs1.next()){
				                			 %>
				                			 <tr>
				                			 <td><%= rs1.getString(4)  %></td>
											<td><%= rs1.getString(1) %></td>
											<td><%= rs1.getString(2) %></td>
											<td><%= rs1.getString(3) %></td>
											<td>
									            <label for="voted"> Vote </label>
									            <input type="radio" name="voted" value=" <%= rs1.getString(2) %>" id="voted">
									        </td>
											</tr>
				   						<% 
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
				          	<input type='submit' value='Vote'>
				          </form>
				          <% 
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