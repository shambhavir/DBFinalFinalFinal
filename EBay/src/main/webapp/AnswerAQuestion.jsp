<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="CheckAnswerAQuestion.jsp">
		<table>
			<tr>
				<td>Question ID (QID)</td>
				<td><input type="text" name="QID"></td>
			</tr>
			<tr>
				<td>Answer</td>
				<td><input type="text" name="answer"></td>
			</tr>
		</table>
		<input type="submit" value="Submit">
	</form>
</body>
</html>