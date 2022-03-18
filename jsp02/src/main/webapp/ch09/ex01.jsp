<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>Java 코드</h2>
<%-- <%@ page import="java.util.Enumeration" %>
<%
Enumeration<String> headerNames=request.getHeaderNames();
while(headerNames.hasMoreElements()){//다음 요소가 있으면
  String key=(String)headerNames.nextElement();//다음 값을 읽음
  String value=request.getHeader(key);//헤더값 조회
  out.println(key+" : "+value+"<br>");
}
%> --%>

<h2>EL/JSTL 코드</h2>
<%--
${cookie} => 쿠키정보
${header} => request.getHeaderName() 과 같음 ,헤더 정보 
--%>
<c:forEach var="h" items="${header}">
 ${h.key} => ${h.value} <br>
</c:forEach>
<hr>
<!-- set var="변수명" value="값" scope="사용영역" 
사용영역 :	page < request < session < application
user-agent : 클라이언트의 웹브라우저 및 운영체제 정보
-->
<c:set var="browser" value="${header['user-agent']}" scope="page" />

<c:out value="${browser}"></c:out> <!-- out.println(값)같음 -->
${browser}<br>
<hr>
<c:remove var="browser"/> <!-- java의 removeAttribute()대체 -->
<c:out value="${browser}" />

</body>

</html>