<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Bay</title>
</head>
<body>
<h1 align="center"> E-Bay Home Page</h1>
 <div align="center">
  
  <form id="main" method="post" name="main" action="" onsubmit="redirectLogin(this);">
  <h3>If you are an Admin/Rep or registered customer</h3>
  <button type="submit" name="Login">Login now</button>
<!--     <input type="submit" name="Login"/> 
 --></form>

  <form id="main" method="post" name="main" action="" onsubmit="redirectReg(this);">
    <h3>If you are a new customer</h3>
    <button type="submit" name="Register">Register now</button>
</form>
  
  
  
  
  <script type="text/javascript">
  function redirectLogin(elem){
	     elem.setAttribute("action","login.jsp");
	     elem.submit();
	}
 
  function redirectReg(elem){
	     elem.setAttribute("action","register.jsp");
	     elem.submit();
	}

  </script>
  
 </div>
</body>
</html>

