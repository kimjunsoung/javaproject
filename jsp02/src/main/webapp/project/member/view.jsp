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
	
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	function daumZipCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("address1").value = extraAddr;
				} else {
					document.getElementById("address2").value = '';
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("address1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("address2").focus();
			}
		}).open();
	}

	$(function() {
		
		$("#btnUpdate").click(function() {
			var passwd=$("#passwd").val();
			var passwd1=$("#passwd1").val();
			if(passwd1 != passwd){
		        alert("비밀번호가 맞는지 확인해주세요.");
		        $("#passwd").focus();
		        return;
		     }
			
			document.form1.action = "${path}/my_member_servlet/update.do";
			document.form1.submit();
		});
		$("#btnDelete").click(function() {
			var passwd=$("#passwd").val();
			var passwd1=$("#passwd1").val();
			if(passwd1 != passwd){
		        alert("비밀번호가 맞는지 확인해주세요.");
		        $("#passwd").focus();
		        return;
		     }
			if (confirm("탈퇴하시겠습니까?")) {
				document.form1.action = "${path}/my_member_servlet/deleteMember.do";
				document.form1.submit();
			}
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

table {
	width: 100%;
	border: solid;
	border-color: green;
	border-width: 4px;
}

tr, td {
	border: none;
	text-align: center;
}

#zipcode {
	text-align: left;
}
</style>
</head>
<body>

	<%@include file="../include1/menu.jsp"%>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-left" id="dvi1">
				<h2>회원정보</h2>
				<form name="form1" method="post">
					<table>
						<tr>
							<td>ID</td>
							<td><input name="userid" value="${dto.userid}" 
								class="form-control" readonly="readonly"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="hidden" name="passwd1" value="${dto.passwd}" 
								class="form-control" id="passwd1"></td>
						</tr>
						<tr>
							<td>pw</td>
							<td><input type="password" name="passwd"
								class="form-control" id="passwd"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input name="name" value="${dto.name}"
								class="form-control"></td>
						</tr>
						<tr>
							<td>핸드폰번호</td>
							<td><input name="phone" value="${dto.phone}"
								class="form-control"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input name="email" value="${dto.email}"
								class="form-control"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td id="zipcode"><input name="zipcode" id="zipcode"
								value="${dto.zipcode}" readonly class="form-control"
								style="width: 40%; display: inline;"> <input type="text"
								onclick="daumZipCode()" value="우편번호 찾기" class="btn btn-success">
							</td>
						</tr>
						<tr>
							<td>도로명주소</td>
							<td><input name="address1" id="address1"
								value="${dto.address1}" class="form-control"></td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td><input name="address2" id="address2"
								value="${dto.address2}" class="form-control"></td>
						</tr>
						<tr>
							<td>회원가입일자</td>
							<td><fmt:formatDate value="${join_date}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button"
								value="회원정보 수정" id="btnUpdate"
								class="btn btn-lg btn-success btn-block"> <input
								type="button" value="회원탈퇴" id="btnDelete"
								class="btn btn-lg btn-success btn-block">
								
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

	<%@include file="../include1/footer.jsp"%>

</body>
</html>