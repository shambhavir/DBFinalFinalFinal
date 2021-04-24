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

	<!--<form method="post" action="ManualAuction.jsp">
		<input type="submit" value="Manually Bid" />
	</form>
	<form method="post" action="AutomaticAuction.jsp">
		<input type="submit" value="Automatically Bid" />
	</form>
	<form method="post" action="Search.jsp">
		<input type="submit" value="Filter Auctions" />
	</form>
	<br>
	Sort:
	<form method="post" action="Sort.jsp">
		  <input type="radio" name="command" value="itemName"/>Alphabetically by name
		  <br>
		  <input type="radio" name="command" value="itemCurrentPrice"/>Price (low to high)
		  <br>
		  <input type="radio" name="command" value="itemType"/>Type of item
		  <br>
		  <input type="radio" name="command" value="itemEndDateTime"/>End date and time (closest to farthest)
		  <br>
		  <input type="submit" value="submit" />
		</form>
	<br> -->
	<h3>Generate Sales Reports for:</h3>
	<form method="post" action="ViewTotalEarnings.jsp">
		<input type="submit" value="Total Earnings" />
	</form>
	<form method="post" action="ViewEarningsPerItem.jsp">
		<input type="submit" value="Earnings per item" />
	</form>
	<form method="post" action="ViewEarningsPerItemType.jsp">
		<input type="submit" value="Earnings per item-type" />
	</form>
	<form method="post" action="ViewEarningsPerEndUser.jsp">
		<input type="submit" value="Earnings per end-user" />
	</form>
	<form method="post" action="ViewBestBuyer.jsp">
		<input type="submit" value="Best Buyers" />
	</form>
	<form method="post" action="ViewBestSellingItems.jsp">
		<input type="submit" value="Best Selling Items" />
	</form>
	<br>
	<%-- <%-- <% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
	
			
			//Make a SELECT query from Events
			String str = "SELECT * FROM Events";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>

	<!--  Make an HTML table to show the results in: -->
	<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">AID</td>
			<td style="padding: 1em">Name</td>
			<td style="padding: 1em">Type</td>
			<td style="padding: 1em">Price</td>
			<td style="padding: 1em">End Date and Time</td>
			<td style="padding: 1em">Status</td>
			<td style="padding: 1em">Highest Bidder</td>
		</tr>
		<%
			//parse out the results
			while (result.next()) { %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= result.getInt("AID") %></td>
			<td style="padding: 1em"><%= result.getString("itemName")%></td>
			<td style="padding: 1em"><%= result.getString("itemType")%></td>
			<td style="padding: 1em"><%= result.getFloat("itemCurrentPrice")%>
			</td>
			<td style="padding: 1em"><%= result.getTimestamp("itemEndDateTime")%></td>
			<td style="padding: 1em"><%= result.getString("status")%></td>
			<td style="padding: 1em"><%= result.getString("username")%></td>
		</tr>


		<% }
			//close the connection.
			db.closeConnection(con);
			%>
	</table>


	<%} catch (Exception e) {
			out.print(e);
		}%>
 --%> 

</body>
</html>