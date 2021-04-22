<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Auction</h1>
	<form method="post" action="CheckAuction.jsp">
		<table>
			<tr>
				<td>Name</td>
				<td><input type="text" name="itemName"></td>
			</tr>
			<tr>
				<td>Category (LP/INST/CD)</td>
				<td><input type="text" name="itemType"></td>
			</tr>
			<tr>
				<td>Starting Price</td>
				<td><input type="text" name="itemStartingPrice"></td>
			</tr>
			<tr>
				<td>Reserve Amount (0 if none)</td>
				<td><input type="text" name="itemReserveAmount"></td>
			</tr>
			<tr>
				<td>End Date</td>
				<td><input type="text" name="itemEndDate" placeholder="YYYY-MM-DD"></td>
			</tr>
			<tr>
				<td>End Time</td>
				<td><input type="text" name="itemEndTime" placeholder="HH:MM:SS"></td>
			</tr>
			
		</table>
		<input type="submit" value="Register">
	</form>
</body>
</html>