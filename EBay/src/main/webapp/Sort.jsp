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
	<form method="post" action="ShowAuction.jsp">
		<input type="submit" value="Back to Original Auctions" />
	</form>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String entity = request.getParameter("command");

		if (entity.equals("itemName")) {
			String str = "SELECT * FROM Events ORDER BY itemName";
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
		} else if (entity.equals("itemCurrentPrice")) {
		String str = "SELECT * FROM Events ORDER BY itemCurrentPrice";
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
			} else if (entity.equals("itemEndDateTime")) {
			String str = "SELECT * FROM Events ORDER BY 1 ASC";
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
				}else if(entity.equals("itemType")){
					String str = "SELECT * FROM Events ORDER BY itemType";
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
				}else{
					String site = "http://localhost:8080/cs336/ShowAuction.jsp";
					response.setStatus(response.SC_MOVED_TEMPORARILY);
					response.setHeader("Location", site);
				}
				//close the connection.
				db.closeConnection(con);
				} catch (Exception e) {
				out.print(e);
				}
				%>
			
</body>
</html>