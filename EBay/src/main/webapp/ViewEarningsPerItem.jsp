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

	
	
	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
	
			
			//Make a SELECT query from Events
			String str = "SELECT itemName, SUM(itemCurrentPrice) AS itemCurrentPrice FROM Events GROUP BY itemName";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
		%>

	<!--  Make an HTML table to show the results in: -->
	<table style="padding: 2em">
		<tr>
			<!-- <td style="padding: 1em">AID</td> -->
			<td style="padding: 1em">Item</td>
		<!-- 	<td style="padding: 1em">Type</td> -->
			<td style="padding: 1em">Total Earning</td>
			<!-- <td style="padding: 1em">End Date and Time</td> -->
			<!-- <td style="padding: 1em">Status</td> -->
			<!-- <td style="padding: 1em">Highest Bidder</td> -->
		</tr>
		<%
			//parse out the results
			while (result.next()) {
				/* if(result.getString("status").equals("Closed")){ */%>
		<tr style="padding: 1em">
			<%-- <td style="padding: 1em"><%= result.getInt("AID") %></td> --%>
			<td style="padding: 1em"><%= result.getString("itemName")%></td>
			<%-- <td style="padding: 1em"><%= result.getString("itemType")%></td> --%>
			<td style="padding: 1em"><%= result.getFloat("itemCurrentPrice")%>
			</td>
			<%-- <td style="padding: 1em"><%= result.getTimestamp("itemEndDateTime")%></td> --%>
		<%-- 	<td style="padding: 1em"><%= result.getString("status")%></td> --%>
			<%-- <td style="padding: 1em"><%= result.getString("username")%></td> --%>
		</tr>
		


		<% } /* } */
			//close the connection.
			db.closeConnection(con);
			%>
	</table>


	<%} catch (Exception e) {
			out.print(e);
		}%>


</body>
</html>