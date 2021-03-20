<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div align="center">
  <h1>You have registered in successfully</h1>
 <%--  <b>${user.fullname} (${user.email})</b>
        <br><br>
        <a href="/logout">Logout</a> --%>
        
          <form id="main" method="post" name="main" action="" onsubmit="redirectLogin(this);">
    <button type="submit" name="Login">Please login now</button>
</form>
 </div>
 <div>
 <script type="text/javascript">
  function redirectLogin(elem){
	     elem.setAttribute("action","login.jsp");
	     elem.submit();
	}
  </script>
 </div>

</body>
</html>