<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../project/include1/header.jsp"%>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="../include/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnSave").click(function() {
		var writer=$("#writer").val();
		var subject=$("subject").val();
		var content=$("#content").val();
		var passwd=$("#passwd").val();
		if(writer==""){
			alert("이름을 입력하세요.");
			$("#writer").focus();
			return;
		}
		if(subject==""){
			alert("제목을 입력하세요.");
			$("#subject").focus();
			return;
		}
		if(content==""){
			alert("내용을 입력하세요.");
			$("#content").focus();
			return;
		}
		if(passwd==""){
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}
		document.form1.submit();
	});
});
</script>
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
</style>
</head>
<body>

	<%@include file="../project/include1/menu.jsp"%>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			
			
			
			
			
			<div class="col-sm-8 text-left" id="dvi1">
			<h3>매물등록</h3>
<form name="form1" method="post" enctype="multipart/form-data"
action="${path}/board_servlet/insert.do">
<table border="1" style="width: 100%;">
 <tr>
  <td>이름</td>
  <td><input name="writer" id="writer"> </td>
 </tr>
 <tr>
  <td>제목</td>
  <td><input name="subject" id="subject" size="60"> </td>
 </tr>
 <tr>
  <td>본문</td>
  <td><textarea rows="5" cols="60" name="content" id="content">
  </textarea> </td>
 </tr>
  <tr>
  <td>첨부파일</td>
  <td><input type="file" name="file1" id="file1"> </td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd" id="passwd"> </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="button" value="확인" id="btnSave">
  </td>
 </tr>
</table>

</form>
			
			
			
			
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

	<%@include file="../project/include1/footer.jsp"%>

</body>
</html>