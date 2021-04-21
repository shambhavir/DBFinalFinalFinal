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
<form method="post" action="CreateAlert.jsp">
	<input type="submit" value="Create Alert">
</form>
		<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Make a SELECT query from the notif table
			String userName = (String) session.getAttribute("username");
			String str = "SELECT * FROM notif WHERE username = \"" + userName + "\" AND subject <> \"none\"";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>

		<!--  Make an HTML table to show the results in: -->
		<h3>Auction Alerts</h3>
		<table style="padding: 2em">
			<tr>
				<td style="padding: 1em">Date and Time</td>
				<td style="padding: 1em">Subject</td>
				<td style="padding: 1em">Message</td>
			</tr>
			<%
			//parse out the results
			while (result.next()) {
			%>
			<tr style="padding: 1em">
				<td style="padding: 1em"><%=result.getString("subject")%></td>
				<td style="padding: 1em"><%=result.getString("message")%></td>
				<td style="padding: 1em"><%=result.getTimestamp("messageTime")%></td>
			</tr>

			<br>
			<%
			}
			%>
		</table>

		<h3>Your Alerts</h3>
		<%
		
		String displayMusicals = "SELECT * FROM Musicals WHERE username = \"" + userName + "\"";
		result = stmt.executeQuery(displayMusicals);
		%>

		<!--  Make an HTML table to show the results in: -->
		<table style="padding: 2em">
			<tr>
				<td style="padding: 1em">Name</td>
				<td style="padding: 1em">Type</td>
				<td style="padding: 1em">Availability</td>
			</tr>
			<%
			//parse out the results
			while (result.next()) {
			%>
			<tr style="padding: 1em">
				<td style="padding: 1em"><%=result.getString("itemName")%></td>
				<td style="padding: 1em"><%=result.getString("itemType")%></td>
				<td style="padding: 1em"><%=result.getString("isAvaliable")%></td>
			</tr>

			<br>
			<%
			}
			%>
		</table>
		<%
		//close the connection.
		db.closeConnection(con);
		} catch (Exception e) {
		out.print(e);
		}
		%>
	
</body>
</html>