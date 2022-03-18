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
	
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function() {
		location.href="${path}/board/write.jsp";
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
			
			
		  <h2>검색결과</h2>
<form name="form1" method="post" 
action="${path}/board_servlet/search.do">
<select name="search_option">
<c:choose>
 <c:when test="${search_option == 'writer'}">
   <option value="writer" selected>이름</option>
   <option value="subject">제목</option>
   <option value="content">내용</option>
   <option value="all">이름+제목+내용</option>
 </c:when>
 <c:when test="${search_option == 'subject'}">
   <option value="writer" >이름</option>
   <option value="subject" selected>제목</option>
   <option value="content">내용</option>
   <option value="all">이름+제목+내용</option>
 </c:when>
 <c:when test="${search_option == 'content'}">
   <option value="writer" >이름</option>
   <option value="subject" >제목</option>
   <option value="content" selected>내용</option>
   <option value="all">이름+제목+내용</option>
 </c:when>
 <c:when test="${search_option == 'all'}">
   <option value="writer" >이름</option>
   <option value="subject" >제목</option>
   <option value="content" >내용</option>
   <option value="all" selected>이름+제목+내용</option>
 </c:when>
</c:choose> 
</select>
<input name="keyword">
<button id="btnSearch">검색</button>
</form>

<button id="btnWrite">글쓰기</button>
<table border="1" style="width: 100%;">
 <tr>
  <th>번호</th>
  <th>이름</th>
  <th>제목</th>
  <th>날짜</th>
  <th>조회수</th>
  <th>첨부파일</th>
  <th>다운로드</th>
 </tr>
<c:forEach var="dto" items="${list}">
 <c:choose>
  <c:when test="${dto.show == 'y'}">
 <tr>
  <td>${dto.num}</td>
  <td>${dto.writer}</td>
  <td>
   <!-- 답글 들여쓰기 -->
   <c:forEach var="i" begin="1" end="${dto.re_level}">
    &nbsp;&nbsp;
   </c:forEach>
  
  <a href="${path}/board_servlet/view.do?num=${dto.num}">${dto.subject}</a>
   <!-- 댓글갯수 표시 -->
   <c:if test="${dto.comment_count > 0}">
    <span style="color: red;">(${dto.comment_count})</span>
   </c:if>
  </td>
  <td>${dto.reg_date}</td>
  <td>${dto.readcount}</td>
  <td align="center">
   <c:if test="${dto.filesize > 0}">
    <a href="${path}/board_servlet/download.do?num=${dto.num}">
     <img src="../images/file.gif">
    </a>
    <script>
     //setTimeout('location.reload()',1000);//다운로드횟수를 1초마다 새로고침
    </script>
    
   </c:if>
  </td>
  <%-- <td>${dto.filename}</td> --%>
  <td>${dto.down}</td>
 </tr>
  </c:when>
  <c:otherwise>
   <tr>
    <td>${dto.num}</td>
    <td colspan="6" align="center">
    삭제된 게시물입니다.</td>
   </tr>
  </c:otherwise>
 </c:choose>
</c:forEach> 
</table>

		   
			
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