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
<title>Viewing Results</title>
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
 
                		String sql = "SELECT can_id, COUNT(can_id) FROM votes  GROUP BY can_id HAVING COUNT"
                			 +" (can_id)=( SELECT MAX(votes_count) FROM  ( SELECT can_id, COUNT(can_id) votes_count FROM votes  GROUP BY can_id))";
                			 PreparedStatement pst = con.prepareStatement(sql);
								
								ResultSet rs = pst.executeQuery();
							while(rs.next()){
									String c_id = rs.getString(1);
									String q = "SELECT * FROM candidates WHERE c_id = ? AND c_ele_name = ?";
									 PreparedStatement pst1 = con.prepareStatement(q);
										pst1.setString(1, c_id);
										pst1.setString(2, election_input);
										ResultSet rs1 = pst1.executeQuery();
									if(rs1.next()){
										out.println("<h3>Winner Canididate is</h3>"+ rs1.getString(1));
										out.println("<h3>Winner Canididate Party is</h3>"+ rs1.getString(3));
										break;
									}else{
										out.println("<h3 id='nothing'>Here's Nothing to Display</h3>");
									}
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