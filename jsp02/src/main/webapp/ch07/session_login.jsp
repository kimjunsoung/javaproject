<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session_login.jsp</title>
  <title>Bootstrap Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  
  <%@ include file="../include/header.jsp" %>

<c:if test="${param.message == 'error'}">
 <script>
  alert("아이디 또는 비밀번호가 일치하지 않습니다.");
 </script>
</c:if>
<c:if test="${param.message == 'logout'}">
 <script>
  alert("로그아웃 되었습니다.");
 </script>
</c:if>

</head>
<body>
<h2>세션 로그인</h2>
<form method="post" name="form1" 
action="${path}/session_servlet/login.do">
<table border="1">
 <tr>
  <td>아이디</td>
  <td><input name="userid"> </td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd"> </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="submit" value="로그인">
  </td>
 </tr>
</table>
</form>

</body>
</html>