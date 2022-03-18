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
$(function(){ //웹페이지가 로딩되면 자동으로 실행됨
	comment_list();
	$("#btnSave").click(function() {
		comment_add();
	});
	$("#btnList").click(function() {
		location.href="${path}/board_servlet/list.do";
	});
	$("#btnReply").click(function() {
		document.form1.action="${path}/board_servlet/reply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function() {
		document.form1.action="${path}/board_servlet/pass_check.do";
		document.form1.submit();
	});
	
	
	
});

function comment_add(){
	var param="board_num=${dto.num}&writer="+$("#writer").val()
	+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}

function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){//result변수는 responseText서버의 응답 텍스트
			$("#commentList").html(result);
		}
	});
}

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
			
			
		<h2>매물확인</h2>
<form name="form1" method="post">
<table border="1" style="width: 100%">
 <tr>
  <td>날짜</td>
  <td>${dto.reg_date}</td>
  <td>조회수</td>
  <td>${dto.readcount}</td>
 </tr>
 <tr>
  <td>이름</td>
  <td colspan="3">${dto.writer}</td>
 </tr>
 <tr>
  <td>제목</td>
  <td colspan="3">${dto.subject}</td>
 </tr>
 <tr>
  <td>본문</td>
  <td colspan="3">
  
  ${dto.content}<br>
  
  </td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td colspan="3">
   <input type="password" name="passwd" id="passwd">
   <c:if test="${param.message == 'error' }">
    <span style="color: red;">
     비밀번호가 일치하지 않습니다.
    </span>
   </c:if>
  </td>
 </tr>
 <tr>
  <td>첨부파일</td>
  <td colspan="3">
   <c:if test="${dto.filesize > 0}">
    ${dto.filename}(${dto.filesize} bytes)
    <a href="${path}/board_servlet/download.do?num=${dto.num}">[다운로드]</a>
   </c:if>
  </td>
 </tr>
 <tr>
  <td colspan="4" align="center">
   <input type="hidden" name="num" value="${dto.num}">
   <input type="button" value="수정/삭제" id="btnEdit">
   <input type="button" value="답변" id="btnReply">
   <input type="button" value="목록" id="btnList">
  </td>
 </tr>
</table>
</form>
<!-- 댓글 쓰기 폼 -->
<table border="1" style="width: 100%">
 <tr>
  <td><input id="writer" placeholder="이름"></td>
  <td rowspan="2">
   <button id="btnSave" type="button">확인</button>
  </td>
 </tr>
 <tr>
  <td><textarea rows="5" cols="80" 
  placeholder="내용을 입력하세요" id="content"></textarea></td>
 </tr>
</table>

<!-- 댓글 목록을 출력할 영역 -->
<div id="commentList"></div>
		   
			
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