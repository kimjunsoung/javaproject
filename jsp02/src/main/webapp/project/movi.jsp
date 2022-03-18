<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="include1/header.jsp"%>
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
	clear: both;
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

#dvi1{
 text-align: center;
 
}
</style>
</head>
<body>

	<%@include file="include1/menu.jsp" %>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>

	<div class="col-sm-8 text-left" id="dvi1">
	<h1>카운터 스트라이크 영상</h1>
    <iframe width="100%" height="500" src="https://www.youtube.com/embed/tl4hadSOmfo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <h1>입문자 영상</h1>
    <iframe width="100%" height="500" src="https://www.youtube.com/embed/g-pvPddAdLc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <h1>중고 바이크 구입요령</h1>
    <iframe width="100%" height="500" src="https://www.youtube.com/embed/CR9l3TiHrDs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				
				
				
				
				
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

	<%@include file="include1/footer.jsp" %>

</body>
</html>