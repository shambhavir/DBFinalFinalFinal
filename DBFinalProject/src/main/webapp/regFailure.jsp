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
   <h3>Register Failure, enter everything</h3>
   
 
 <form id="main" method="post" name="main" action="" onsubmit="redirectSignUp(this);">
    <button   type="submit" name="Reg" >Register Now!</button>
</form>
 
 </div>
 <script type="text/javascript">
  function redirectSignUp(elem){
	     elem.setAttribute("action","register.jsp");
	     elem.submit();
	}
  </script>
  
</body>
</html>