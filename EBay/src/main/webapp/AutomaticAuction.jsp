<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="CheckAutomatic.jsp">
		<table>
			<tr>
				<td>Auction ID (AID)</td>
				<td><input type="text" name="AID"></td>
			</tr>
			<tr>
				<td>Upper Limit</td>
				<td><input type="text" name="upperLimit"></td>
			</tr>
			<tr>
				<td>Bid Increment</td>
				<td><input type="text" name="bidIncrement"></td>
			</tr>
		</table>
		<input type="submit" value="Bid">
	</form>
</body>
</html>