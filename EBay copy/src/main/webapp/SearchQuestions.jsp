<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Search by Keyword</h1>
	<form method="post" action="CheckSearchQuestions.jsp">
		<table>
			<tr>
				<td>Keyword</td>
				<td><input type="text" name="keyword"></td>
			</tr>
		</table>
		<input type="submit" value="Search">
	</form>
</body>
</html>