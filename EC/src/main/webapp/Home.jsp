<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBay G19</title>
</head>
<body style="text-align: center">
	<h1>Welcome!</h1>
	<br> You can...
	<form method="post" action="CreateAuction.jsp">
		<input type="submit" value="Create an auction" />
	</form>Or
	<form method="post" action="ShowAuction.jsp">
		<input type="submit" value="Participate in an auction" />
	</form> Or
	<form method="post" action="ShowAlert.jsp">
		<input type="submit" value="See your alerts" />
	</form>Or if you are an Admin
	<form method="post" action="CreateAccount.jsp">
		<input type="submit" value="Create a Customer Representative Account" />
	</form>Or
	<form method="post" action="CreateSalesReport.jsp">
		<input type="submit" value="Generate Sales Report" />
	</form>
	<br>
	<form method="post" action="Login.jsp">
		<input type="submit" value="Logout" />
	</form>
	
	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			PreparedStatement ps = null;
			
			Timestamp currentDayTime = new java.sql.Timestamp(new java.util.Date().getTime());
			//Make a SELECT query from Events to remove closed auctions
			String checkClose = "SELECT * FROM Events WHERE itemEndDateTime <= \"" + currentDayTime + "\" AND status = \"Open\"";
			ResultSet result = stmt.executeQuery(checkClose);
			
			List<Winner> listOfClosedAuctions = new ArrayList<Winner>();
			
			while(result.next()){
				listOfClosedAuctions.add(new Winner(result.getString("username"), result.getInt("AID"), result.getFloat("itemReserveAmount"), result.getFloat("itemCurrentPrice")));
			}
			
			for(int i = 0; i<listOfClosedAuctions.size(); i++){
				//Make an UPDATE statement for the status in Events:
				String updateEvents  = "UPDATE Events SET status = ? WHERE AID = ?";
				ps = con.prepareStatement(updateEvents);

				ps.setString(1, "Closed");
				ps.setInt(2, listOfClosedAuctions.get(i).getAID());
				ps.executeUpdate();
				
				String subject = "";
				if(listOfClosedAuctions.get(i).getWinner()){
					subject = "Congrats!";
				}else{
					subject = "none";
				}
				//Make an INSERT statement for buy:
				String insertBuy  = "INSERT INTO buy(username, AID, isWinner) VALUES(?,?,?)";
				ps = con.prepareStatement(insertBuy);
				
				ps.setString(1, listOfClosedAuctions.get(i).getUserName());
				ps.setInt(2, listOfClosedAuctions.get(i).getAID());
				ps.setString(3, subject);
				ps.executeUpdate();
				
				int newMID = 0;
				
				String str = "SELECT MAX(mID) FROM notif";

				result = stmt.executeQuery(str);
				if (result.next()) {
					newMID = result.getInt(1) + 1;
				} else {
					newMID = 1;
				}
				
				String message = "Congratulations! You won the item with Auction ID " + listOfClosedAuctions.get(i).getAID();
				String insertAlert  = "INSERT INTO notif(mid, messageTime, AID, username, subject, message) VALUES(?,?,?,?,?,?)";
				ps = con.prepareStatement(insertAlert);
				
				ps.setInt(1, newMID);
				ps.setTimestamp(2, new java.sql.Timestamp(new java.util.Date().getTime()));
				ps.setInt(3, listOfClosedAuctions.get(i).getAID());
				ps.setString(4, listOfClosedAuctions.get(i).getUserName());
				ps.setString(5, subject);
				ps.setString(6, message);
				ps.executeUpdate();
			}
			//parse out the results
			
			
			//close the connection.
			db.closeConnection(con);
			%>
	</table>


	<%} catch (Exception e) {
			out.print(e);
		}%>
</body>
</html>