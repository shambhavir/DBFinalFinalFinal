<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Create Alert</h1>
	<form method="post" action="CheckCreateAlert.jsp">
		<table>
		<tr>
				<td>Name</td>
				<td><input type="text" name="itemName"></td>
			</tr>
			<tr>
				<td>Category (LP/INST/CD)</td>
				<td><input type="text" name="itemType"></td>
			</tr>			
		</table>
		<input type="submit" value="Search">
	</form>
</body>
</html>