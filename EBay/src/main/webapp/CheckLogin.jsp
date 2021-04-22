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
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get the combobox from the index.jsp
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		String userType = request.getParameter("userType");

		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT * FROM login WHERE username = \"" + userName + "\" AND password = \"" + passWord
		+ "\" AND userType = \"" + userType + "\"";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);

		//parse out the results
		if (!result.next()) {
			String site = "http://localhost:8080/cs336/LoginFailed.jsp";
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
		} else {
			session.setAttribute("username", userName);
			String site = "http://localhost:8080/cs336/Home.jsp";
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
		}
		out.print("</table>");

		//close the connection.
		con.close();

	} catch (Exception e) {
	}
	%>

</body>
</html>