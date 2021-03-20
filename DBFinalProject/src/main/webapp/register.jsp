<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Bay</title>
</head>
<body>
 <div align="center">
  <h1>Registration Form</h1>
  <form action="<%= request.getContextPath() %>/register" method="post">
   <table style="with: 80%">
    <tr>
    
     <td>Username</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" /></td>
    </tr>
       <tr>
     <td>User Type (you are a customer)</td>
     <td><input type="text" name="userType" /></td>
    </tr>
    <tr>
   </table>
   <input type="submit" value="Register" />
  </form>
 </div>
</body>
</html>