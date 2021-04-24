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
	<form method="post" action="RemoveBid.jsp">
		<input type="submit" value="Go Back to Remove Bid" />
	</form>
	<br>
	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
	
			
			int AID = Integer.parseInt(request.getParameter("AID"));
			
			String selectStr = "SELECT * from Events WHERE AID = \"" + AID + "\"";
			
			ResultSet result = stmt.executeQuery(selectStr);
			
			//System.out.println("selectStr is working");
			
			result.next();
			String userName = result.getString("username");
			float startingPrice = result.getFloat("itemStartingPrice");
			float itemCurrentPrice = result.getFloat("itemCurrentPrice");
			
			float calculatedPrice1 = (itemCurrentPrice - startingPrice);
			float calculatedPrice2 = itemCurrentPrice - calculatedPrice1;
			
			//System.out.println(calculatedPrice2);
			//Make a SELECT query from Events
			String str = "DELETE FROM bid WHERE AID = \"" + AID + "\"";
			PreparedStatement ps = con.prepareStatement(str);
			
			ps.executeUpdate();
			
			//System.out.println("deleteStr is working");
			String newUsername = "no bidder";
			
			String update = "UPDATE Events SET username = ?, itemCurrentPrice = ? WHERE AID = ?";
			ps = con.prepareStatement(update);

			ps.setString(1, userName);
			ps.setFloat(2, calculatedPrice2);
			ps.setInt(3, AID);
			ps.executeUpdate();
			//System.out.println("updateStr is working");
			
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
			
			
		<h3>bid deleted!</h3>

		
	


	<%} catch (Exception e) {
			out.print(e);
		}%>


</body>
</html>