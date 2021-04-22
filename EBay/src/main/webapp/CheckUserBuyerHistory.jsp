<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="BidHistory.jsp">
		<input type="submit" value="Back to User History" />
	</form>
	<form method="post" action="ShowAuction.jsp">
		<input type="submit" value="Back to All Auctions" />
	</form>

	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			String userName = request.getParameter("username");
	
			
			//Make a SELECT query from Events
			String str = "SELECT * FROM bid WHERE username = \"" + userName + "\"";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>

	<!--  Make an HTML table to show the results in: -->
	<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">Auction Id</td>
			<td style="padding: 1em">Bid placed</td>
		</tr>
		<%
			//parse out the results
			while (result.next()) { %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= result.getString("AID")%></td>
			<td style="padding: 1em"><%= result.getString("itemCurrentPrice")%></td>
		</tr>


		<% }
			//close the connection.
			db.closeConnection(con);
			%>
	</table>


	<%} catch (Exception e) {
			out.print(e);
		}%>
</body>
</html>