<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Buyer's History:
	<form method="post" action="CheckUserBuyerHistory.jsp">
		<table>
			<tr>
				<td>Name</td>
				<td><input type="text" name="username"></td>
			</tr>			
		</table>
		<input type="submit" value="View History">
	</form>
	Seller's History:
	<form method="post" action="CheckUserSellerHistory.jsp">
		<table>
			<tr>
				<td>Name</td>
				<td><input type="text" name="username"></td>
			</tr>			
		</table>
		<input type="submit" value="View History">
	</form>
</body>
</html>