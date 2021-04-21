<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Customer Rep Account</title>
</head>
<body>
	<h1>Register</h1>
	<form method="post" action="CheckCreateAccount.jsp">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>Account Type </td>
				<td><input type="text" name="userType"></td>
			</tr>
		</table>
		<input type="submit" value="Register">
	</form>
</body>
</html>