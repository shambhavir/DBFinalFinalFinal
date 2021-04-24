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


	<form method="post" action="Home.jsp">
		<input type="submit" value="Go to Home" />
	</form>
	<form method="post" action="SearchUser.jsp">
		<input type="submit" value="Go Back to Search User" />
	</form>
	<br>
	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
	
			
			String username = request.getParameter("username");
			
			
			//Make a SELECT query from Events
			String str = "SELECT * FROM login WHERE username = \"" + username + "\"";
			
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
		%>

	<!--  Make an HTML table to show the results in: -->
	<table style="padding: 2em">
		<tr>
			<td style="padding: 1em">Username</td>
			<td style="padding: 1em">Password</td>
			<td style="padding: 1em">User Type</td>
		</tr>
		<%
			//parse out the results
			while (result.next()) { %>
		<tr style="padding: 1em">
			<td style="padding: 1em"><%= result.getString("username")%></td>
			<td style="padding: 1em"><%= result.getString("password")%></td>
			<td style="padding: 1em"><%= result.getString("userType")%>
			</td>
		</tr>


		<% }
		
			//close the connection.
			db.closeConnection(con);
			
			%>
	</table>
		
		
	
	<br>
	<form method="post" action="EditAccountInfo.jsp">
		<input type="submit" value="Edit Account Info" />
	</form>
	<form method="post" action="DeleteAccount.jsp">
		<input type="submit" value="Delete Account" />
	</form>


	<%} catch (Exception e) {
			out.print(e);
		}%>


</body>
</html>