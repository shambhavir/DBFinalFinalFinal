<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="ShowAuction.jsp">
		<input type="submit" value="Back to All Auctions" />
	</form>

	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			Timestamp currentDayTime = new java.sql.Timestamp(new java.util.Date().getTime());
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, -2);
			Date firstDateOfPreviousMonth = cal.getTime();

			cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE)); // changed calendar to cal

			Date lastDateOfPreviousMonth = cal.getTime();
			
			Timestamp lastMonth = new java.sql.Timestamp(lastDateOfPreviousMonth.getTime());
	
			
			//Make a SELECT query from Events
			String str = "SELECT * FROM Events WHERE itemEndDateTime <= \"" + currentDayTime + "\" AND itemEndDateTime >= \"" 
			+ lastMonth + "\"";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>

	<!--  Make an HTML table to show the results in: -->
	<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">Auction Id</td>
			<td style="padding: 1em">Name</td>
			<td style="padding: 1em">Item type</td>
			<td style="padding: 1em">Initial Price</td>
			<td style="padding: 1em">Current/Sold Price</td>
			<td style="padding: 1em">Status</td>
		</tr>
		<%
			//parse out the results
			while (result.next()) { %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= result.getInt("AID")%></td>
			<td style="padding: 1em"><%= result.getString("itemName")%></td>
			<td style="padding: 1em"><%= result.getString("itemType")%></td>
			<td style="padding: 1em"><%= result.getFloat("itemStartingPrice")%></td>
			<td style="padding: 1em"><%= result.getString("itemCurrentPrice")%></td>
			<td style="padding: 1em"><%= result.getString("status")%></td>
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