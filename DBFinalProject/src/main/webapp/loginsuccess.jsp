<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="backend.specs.login.connect.*"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div align="center">
   <h3>You have logged in</h3>
 
  <form id="main" method="post" name="main" action="" onsubmit="redirectLogout(this);">
    <button type="submit" name="Logout">Logout now</button>
</form>
 </div>
 
 <script type="text/javascript">
  function redirectLogout(elem){
	     elem.setAttribute("action","logout.jsp");
	     elem.submit();
	}
  </script>
 
</body>
</html>