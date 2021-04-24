<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*, java.sql.Timestamp, java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
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

		//int newAID = 0;
		//String str = "SELECT MAX(AID) FROM Events";

		//ResultSet result = stmt.executeQuery(str);
		//if(result.next()){
		//	newAID = result.getInt(1)+1;
		//}
		//else{
		//	newAID = 1;
		//}

		//Get parameters from the HTML form at the CreateAuction.jsp
		String itemName = request.getParameter("itemName");
		String itemType = request.getParameter("itemType");
		String userName = (String)session.getAttribute("username");
		String isAvaliable = "No";


		//Make an insert statement for the Events table:
		String insert = "INSERT INTO Musicals(itemName, itemType, username, isAvaliable)"
		+ "VALUES (?,?,?,?)";
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, itemName);
		ps.setString(2, itemType);
		ps.setString(3, userName);
		ps.setString(4, isAvaliable);
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		String site = "http://localhost:8080/cs336/ShowAlert.jsp";
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);

	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
	%>
</body>
</html>