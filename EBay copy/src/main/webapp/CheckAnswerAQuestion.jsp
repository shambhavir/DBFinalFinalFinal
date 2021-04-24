<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the ManualAuction.jsp
		int QID = Integer.parseInt(request.getParameter("QID"));
		String answer = request.getParameter("answer");
		String customerRepUserName = (String) session.getAttribute("username");

		//Make an update statement for the Events table:
		String insertAnswer = "UPDATE Messages SET answer = ?, customerRepUsername = ? WHERE QID = ?";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insertAnswer);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, answer);
		ps.setString(2, customerRepUserName);
		ps.setInt(3, QID);
		ps.executeUpdate();

		//Make an insert statement for the bids table:
		/* String insertBid = "INSERT INTO bid(AID, username, itemCurrentPrice)" + " VALUE(?,?,?)";
		ps = con.prepareStatement(insertBid);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setInt(1, AID);
		ps.setString(2, userName);
		ps.setFloat(3, itemCurrentPrice);
		ps.executeUpdate();

		//Make a SELECT query from Bid to see who to send alerts to
		String checkOtherBuyers = "SELECT * FROM bid WHERE itemCurrentPrice < + " + itemCurrentPrice + " AND AID = " + AID;
		ResultSet result = stmt.executeQuery(checkOtherBuyers);
		List<Alert> listOfAlerts = new ArrayList<Alert>();

		while (result.next()) {
			listOfAlerts.add(new Alert(result.getString("username"), result.getInt("AID")));
		}

		int newMID = 0;

		for (int i = 0; i < listOfAlerts.size(); i++) {
			String str = "SELECT MAX(mID) FROM notif";

			result = stmt.executeQuery(str);
			if (result.next()) {
				newMID = result.getInt(1) + 1;
			} else {
				newMID = 1;
			}
			String message = userName + " has placed a higher bid for the item with the auction ID "
			+ listOfAlerts.get(i).getAID();
			//Make an insert statement for the notif table:
			String insertNotif = "INSERT INTO notif(mID, messageTime, AID, username, subject, message)"
			+ " VALUE(?,?,?,?,?,?)";
			ps = con.prepareStatement(insertNotif);

			ps.setInt(1, newMID);
			ps.setTimestamp(2, new java.sql.Timestamp(new java.util.Date().getTime()));
			ps.setInt(3, listOfAlerts.get(i).getAID());
			ps.setString(4, listOfAlerts.get(i).getUserName());
			ps.setString(5, "outbid");
			ps.setString(6, message);
			ps.executeUpdate();
		}
 */
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		//Redirect to show auction afterwards
		String site = "http://localhost:8080/cs336/MessagePortal.jsp";
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);

	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
	%>
</body>
</html>