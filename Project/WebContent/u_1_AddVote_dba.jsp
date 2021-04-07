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
        		 
     			String std_id = (String)session.getAttribute("un");    
     		    String cn_id = request.getParameter("voted");
     		    String electionInput = (String)session.getAttribute("ElectionInput");
     		    System.out.println(electionInput);
     			Class.forName("oracle.jdbc.driver.OracleDriver");
     			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
     					"epproject","project123");
     			System.out.println("Connected to database");

     			 String sql = "insert into votes values (?,?,?)";
     			 PreparedStatement pst = con.prepareStatement(sql);

     			    pst.setString(1, std_id);
     			    pst.setString(2, cn_id);
     			   pst.setString(3, electionInput);
     			  
     			    ResultSet resultSet = pst.executeQuery();
     			    System.out.println("Vote added");
     			    if(resultSet.next()) {
     			    	out.print("<h3 class='logouthead3'>Vote Added successfull</h3>");
     			    	
     			    }else {
     			    	out.print("<h3 class='logouthead3'>Vote Added Unsuccessfully.</h3>");
     			    	out.print("<h3 class='logouthead3'> Add Again <a href='Add_Vote.jsp'>Here</a></h3>");
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