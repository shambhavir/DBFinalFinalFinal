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

	<form method="post" action="ManualAuction.jsp">
		<input type="submit" value="Manually Bid" />
	</form>
	<form method="post" action="AutomaticAuction.jsp">
		<input type="submit" value="Automatically Bid" />
	</form>
	<form method="post" action="Search.jsp">
		<input type="submit" value="Filter Auctions" />
	</form>
	<br> Sort:
	<form method="post" action="Sort.jsp">
		<input type="radio" name="command" value="itemName" />Alphabetically
		by name <br> <input type="radio" name="command"
			value="itemCurrentPrice" />Price (low to high) <br> <input
			type="radio" name="command" value="itemType" />Type of item <br>
		<input type="radio" name="command" value="itemEndDateTime" />End date
		and time (closest to farthest) <br> <input type="submit"
			value="submit" />
	</form>
	<br>
	<form method="post" action="BidHistory.jsp">
		<input type="submit" value="View a Bid's History" />
	</form>
	<form method="post" action="UserHistory.jsp">
		<input type="submit" value="View a Buyer's/Seller's History" />
	</form>
	<form method="post" action="CheckSimilarHistory.jsp">
		<input type="submit" value="View Similar Items" />
	</form>
	<form method="post" action="Home.jsp">
		<input type="submit" value="Go to Home" /> <br>
		<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			String userName = (String) session.getAttribute("username");

			String getBids = "SELECT * FROM automaticBid";
			ResultSet result = stmt.executeQuery(getBids);

			List<AutomaticBid> itemsToCheck = new ArrayList<AutomaticBid>();
			while (result.next()) {
				itemsToCheck.add(new AutomaticBid(result.getInt("AID"), result.getFloat("bidIncrement"),
				result.getFloat("upperLimit"), result.getString("username")));
			}
			if (itemsToCheck.size() != 0) {
				float maxInc = 0;
				int person = 0;
				for (int i = 0; i < itemsToCheck.size(); i++) {
			if (itemsToCheck.get(i).getbidIncrement() > maxInc && itemsToCheck.get(i).getUsername().equals(userName)) {
				maxInc = itemsToCheck.get(i).getbidIncrement();
				person = i;
			}
				}

				String getInfo = "SELECT * FROM Events WHERE AID = " + itemsToCheck.get(person).getAID();
				result = stmt.executeQuery(getInfo);
				while (result.next()) {
			float newPrice = result.getFloat("itemCurrentPrice") + maxInc;
			System.out.println(newPrice);
			if (newPrice < itemsToCheck.get(person).getupperLimit()) {
				String updateEvents = "UPDATE Events SET itemCurrentPrice = ?, username = ? WHERE AID = ? AND itemCurrentPrice <= ? AND status <> \"Closed\" AND ownerUsername <> ? AND username <> ?";
				PreparedStatement ps = con.prepareStatement(updateEvents);

				ps.setFloat(1, newPrice);
				ps.setString(2, userName);
				ps.setInt(3, itemsToCheck.get(person).getAID());
				ps.setFloat(4, newPrice);
				ps.setString(5, userName);
				ps.setString(6, userName);
				ps.executeUpdate();
			}

				}
				
				String getAlerts = "SELECT * FROM Events WHERE AID = " + itemsToCheck.get(person).getAID();
				result = stmt.executeQuery(getAlerts);
				List<Alert> listOfAlerts = new ArrayList<Alert>();
				while(result.next()){
					if((result.getFloat("itemCurrentPrice") + maxInc) > itemsToCheck.get(person).getupperLimit() && !result.getString("username").equals(userName)){
						int newMID = 0;
						
						listOfAlerts.add(new Alert(itemsToCheck.get(person).getUsername(), itemsToCheck.get(person).getAID()));
						for (int i = 0; i < listOfAlerts.size(); i++) {
							String str = "SELECT MAX(mID) FROM notif";

							result = stmt.executeQuery(str);
							if (result.next()) {
								newMID = result.getInt(1) + 1;
							} else {
								newMID = 1;
							}
							String message ="You're upper limit has been exceeded for the auction with an ID of " + itemsToCheck.get(person).getAID();
							//Make an insert statement for the notif table:
							String insertNotif = "INSERT INTO notif(mID, messageTime, AID, username, subject, message)"
							+ " VALUE(?,?,?,?,?,?)";
							PreparedStatement ps = con.prepareStatement(insertNotif);

							ps.setInt(1, newMID);
							ps.setTimestamp(2, new java.sql.Timestamp(new java.util.Date().getTime()));
							ps.setInt(3, listOfAlerts.get(i).getAID());
							ps.setString(4, listOfAlerts.get(i).getUserName());
							ps.setString(5, "upperlimitExceeded");
							ps.setString(6, message);
							ps.executeUpdate();
						}
					}
				}

			}

			//Make a SELECT query from Events
			String str = "SELECT * FROM Events";
			//Run the query against the database.
			result = stmt.executeQuery(str);
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
			while (result.next()) {
			%>
			<tr style="padding: 1em">
				<td style="padding: 1em"><%=result.getInt("AID")%></td>
				<td style="padding: 1em"><%=result.getString("itemName")%></td>
				<td style="padding: 1em"><%=result.getString("itemType")%></td>
				<td style="padding: 1em"><%=result.getFloat("itemCurrentPrice")%>
				</td>
				<td style="padding: 1em"><%=result.getTimestamp("itemEndDateTime")%></td>
				<td style="padding: 1em"><%=result.getString("status")%></td>
				<td style="padding: 1em"><%=result.getString("username")%></td>
			</tr>


			<%
			}
			//close the connection.
			db.closeConnection(con);
			%>
		</table>


		<%
		} catch (Exception e) {
		out.print(e);
		}
		%>
	
</body>
</html>