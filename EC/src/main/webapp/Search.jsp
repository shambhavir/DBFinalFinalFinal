<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Search</h1>
	<form method="post" action="CheckSearch.jsp">
		<table>
			<tr>
				<td>Category (LP/INST/CD)</td>
				<td><input type="text" name="itemType"></td>
			</tr>
			<tr>
				<td>Price (enter 0 is no price constraint)</td>
				<td><input type="text" name="itemCurrentPrice"></td>
			</tr>
			<tr>
				<td>Status (Open/Closed)</td>
				<td><input type="text" name=status></td>
			</tr>
			
		</table>
		<input type="submit" value="Search">
	</form>
</body>
</html>