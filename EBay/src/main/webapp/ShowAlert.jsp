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
	<form method="post" action="Home.jsp">
		<input type="submit" value="Go Home">
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

		String getAlert = "SELECT * FROM Musicals WHERE username = \"" + userName + "\"";
		ResultSet result = stmt.executeQuery(getAlert);

		List<UserAlert> itemsToCheck = new ArrayList<UserAlert>();
		while (result.next()) {
			itemsToCheck.add(new UserAlert(result.getString("itemName"), result.getString("itemType")));
		}
		for (int i = 0; i < itemsToCheck.size(); i++) {
			String getAuction = "SELECT * FROM Events WHERE itemName = \"" + itemsToCheck.get(i).getitemName() + "\" AND itemType = \"" + 
					itemsToCheck.get(i).getitemType() + "\" AND status <> \"Closed\"";
			result = stmt.executeQuery(getAuction);

			while (result.next()) {
				int AID = result.getInt("AID");
				String itemname = result.getString("itemName");

				int newMID = 0;

				String getMID = "SELECT MAX(mID) FROM notif";
				result = stmt.executeQuery(getMID);
				
				if (result.next()) {
					newMID = result.getInt(1) + 1;
				} else {
					newMID = 1;
				}
				
				String message = itemname + " is now available with Auction ID " + AID;
				//Make an insert statement for the notif table:
				String insertNotif = "INSERT INTO notif(mID, messageTime, AID, username, subject, message)"
				+ " VALUE(?,?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(insertNotif);

				ps.setInt(1, newMID);
				ps.setTimestamp(2, new java.sql.Timestamp(new java.util.Date().getTime()));
				ps.setInt(3, AID);
				ps.setString(4, userName);
				ps.setString(5, "ItemAvailable");
				ps.setString(6, message);
				ps.executeUpdate();

				String updateMusical = "UPDATE Musicals SET isAvaliable = ? WHERE username = ? AND itemName = ?";
				ps = con.prepareStatement(updateMusical);

				ps.setString(1, "Yes");
				ps.setString(2, userName);
				ps.setString(3, itemname);
				ps.executeUpdate();
			}
		}

		String str = "SELECT * FROM notif WHERE username = \"" + userName + "\" AND subject <> \"none\"";
		//Run the query against the database.
		result = stmt.executeQuery(str);
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
	//String itemToCheck = result.getString("itemName");

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