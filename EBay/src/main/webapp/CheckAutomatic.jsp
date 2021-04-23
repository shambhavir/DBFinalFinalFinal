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
		int AID = Integer.parseInt(request.getParameter("AID"));
		float upperLimit = Float.valueOf(request.getParameter("upperLimit"));
		float bidIncrement = Float.valueOf(request.getParameter("bidIncrement"));
		String userName = (String) session.getAttribute("username");
		
		if(bidIncrement < upperLimit){
		//System.out.println("Name: " + userName);
		String insertBid = "INSERT INTO automaticBid(username, AID, bidIncrement, upperLimit)" + " VALUE(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(insertBid);
		
		ps.setString(1, userName);
		ps.setInt(2, AID);
		ps.setFloat(3, bidIncrement);
		ps.setFloat(4, upperLimit);
		ps.executeUpdate();
		
		
		String updateEvents = "UPDATE Events SET username = ? WHERE AID = ? AND status <> \"Closed\" AND ownerUsername <> ?";
		ps = con.prepareStatement(updateEvents);

		ps.setString(1, userName);
		ps.setInt(2, AID);
		ps.setString(3, userName);
		ps.executeUpdate();
		
		String selectBid = "SELECT * FROM automaticBid";
		ResultSet result = stmt.executeQuery(selectBid);
		int aucID = 0;

		%>

		<!--  Make an HTML table to show the results in: -->
		<h3>Auction Alerts</h3>
		<table style="padding: 2em">
			<tr>
				<td style="padding: 1em">AID</td>
				<td style="padding: 1em">Username</td>
				<td style="padding: 1em">BidInc</td>
				<td style="padding: 1em">UpperLim</td>
			</tr>
			<%
			//parse out the results
			while (result.next()) {
				aucID = result.getInt("AID");
			%>
			<tr style="padding: 1em">
				<td style="padding: 1em"><%=result.getInt("AID")%></td>
				<td style="padding: 1em"><%=result.getString("username")%></td>
				<td style="padding: 1em"><%=result.getFloat("bidIncrement")%></td>
				<td style="padding: 1em"><%=result.getFloat("upperLimit")%></td>
			</tr>

			<br>
			<%
			}
			%>
		</table><%
		String getEvents = "SELECT * FROM Events WHERE AID = " + aucID;
		result = stmt.executeQuery(getEvents);
		float currPrice = 0;
		
		while(result.next()){
			currPrice = result.getInt("itemCurrentPrice");
		}
		
		String checkOtherBuyers = "INSERT INTO bid(AID, username, itemCurrentPrice)" + 
		"VALUE(?,?,?)";
		ps = con.prepareStatement(checkOtherBuyers);

		ps.setInt(1, aucID);
		ps.setString(2, userName);
		ps.setFloat(3, currPrice);
		ps.executeUpdate();
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		//Redirect to show auction afterwards
		String site = "http://localhost:8080/cs336/ShowAuction.jsp";
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);

	}} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
	%>
</body>
</html>