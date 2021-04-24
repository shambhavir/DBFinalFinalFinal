<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<form method="post" action="Home.jsp">
		<input type="submit" value="Go to Home" />
	</form>
	<form method="post" action="RemoveAuction.jsp">
		<input type="submit" value="Go Back to Remove Auction" />
	</form>
	<br>
	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
	
			
			String AID = request.getParameter("AID");
			
			
			//Make a SELECT query from Events
			String str = "DELETE FROM Events WHERE AID = \"" + AID + "\"";
			PreparedStatement ps = con.prepareStatement(str);
			
			ps.executeUpdate();
			
			
			//Run the query against the database.
			//boolean result = stmt.execute(str);
			
			/*    if(ps.getString("userType").equals("admin") || result.getString("userType").equals("rep")){
				db.closeConnection(con);
				String site = "http://localhost:8080/cs336/LoginFailed.jsp";
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", site);
			}   */
			 
			
		%>
		


		
			<!-- //close the connection. -->
			
			
		<h3>auction deleted!</h3>

		
	


	<%} catch (Exception e) {
			out.print(e);
		}%>


</body>
</html>