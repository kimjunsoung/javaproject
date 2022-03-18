<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include1/header.jsp"%>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

table{
 width: 300px;
 margin: auto;
 border: solid;
 border-color: green;
 border-width: 2px;
 
}

tr,td{
border: none;
text-align: center;
}

</style>

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

	<%@include file="../include1/menu.jsp" %>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-left">

				<h2 align="center">로그인</h2>
				<form name="form1" method="post" action="${path}/session_servlet/login.do">
					<table border="none" width="400px">
						<tr>
							<td>ID</td>
							<td><input id="userid" name="userid" class="form-control"
								placeholder="아이디"></td>
						</tr>
						<tr>
							<td>pw</td>
							<td><input type="password" id="passwd" name="passwd"
								class="form-control" placeholder="비밀번호"></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit" id="btnLogin"
									class="btn btn-lg btn-success btn-block" style="width: 100;">로그인
								</button> <c:if test="${message == 'error'}">
									<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
								</c:if> <c:if test="${message == 'logout'}">
									<div style="color: red;">로그아웃되었습니다.</div>
								</c:if>
							</td>
						</tr>
					</table>
					<br>
					<div>
						


					</div>


				</form>


				<div id="result"></div>

			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">
					<p>
						<a href="http://www.google.com/"><img
							src="../images/images/google.jpg"></a>
					</p>
				</div>
				<div class="well">
					<p>
						<a href="http://www.naver.com/"><img
							src="../images/images/naver.jpg"></a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../include1/footer.jsp" %>

</body>
</html>