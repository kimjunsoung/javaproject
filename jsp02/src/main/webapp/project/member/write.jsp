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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
    function daumZipCode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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
function check(){
	//아이디 체크
	var userid = $("#userid").val();
	if (userid==""){
		alert("아이디는 필수 입력입니다.");
		$("#userid").focus();
		return;
	}
	//비밀번호 체크
	var passwd=$("#passwd").val();
	if (passwd==""){
		alert("비밀번호는 필수 입력입니다.");
		$("#passwd").focus();
		return;
	}
	
	//비밀번호 확인 체크
	var passwd=$("#passwd").val();
	var passwd1=$("#passwd1").val();
	if(passwd1 != passwd){
        alert("비밀번호가 맞는지 확인해주세요.");
        $("#passwd1").focus();
        return;
     }
	
	//이름 체크
	var name = $("#name").val();
	if (name==""){
		alert("이름을 입력하세요.");
		$("#name").focus();
		return;
	}
	
	//번호 체크
	var name = $("#phone").val();
	if (name==""){
		alert("이름을 입력하세요.");
		$("#phone").focus();
		return;
	}
	
	//이메일 체크
	var email = $("#email").val();
	if (email==""){
		alert("이메일을 입력하세요.");
		$("#email").focus();
		return;
	}
	
	//주소 체크
	var zipcode = $("#zipcode").val();
	if (zipcode==""){
		alert("우편번호 찾기를 누르세요.");
		$("#zipcode").focus();
		return;
	}
	
	document.form1.action="${path}/my_member_servlet/join.do";
	document.form1.submit();
	
	
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
	height: auto;
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
				
<h2>회원등록</h2>
<form name="form1" method="post">
<div class="form-group">
 아이디 <input class="form-control" placeholder="아이디" 
 name="userid" id="userid" type="text">
</div>
<div class="form-group">
 비밀번호 <input class="form-control" placeholder="비밀번호" 
 name="passwd" id="passwd" type="password">
 <div class="form-group">
 <b style="color: red;">*</b>비밀번호 확인 <input class="form-control" placeholder="비밀번호 확인" 
 name="passwd1" id="passwd1" type="password">
</div>
</div>
<div class="form-group">
 이름 <input class="form-control" placeholder="이름" 
 name="name" id="name" type="text">
</div>
<div class="form-group">
 핸드폰번호 <input class="form-control" placeholder="핸드폰번호" 
 name="phone" id="phone" type="text">
</div>
<div class="form-group">
 이메일 <input class="form-control" placeholder="이메일" 
 name="email" id="email" type="text">
</div>
<div class="form-group">
 주소 <br>
 <input class="form-control" style="width: 40%; display: inline;"  
 placeholder="우편번호" name="zipcode" id="zipcode" type="text" readonly>
 <button type="button" class="btn btn-success" onclick="daumZipCode();">
 <i class="fa fa-search"></i> 우편번호 찾기</button>
</div>
<div class="form-group">
 <input class="form-control" style="top: 5px;"  
 placeholder="도로명 주소" name="address1" id="address1" type="text" readonly>
</div>
<div class="form-group">
 <input class="form-control" placeholder="상세주소" 
 name="address2" id="address2" type="text">
</div>
<input type="button" class="btn btn-lg btn-success btn-block" 
onclick="check()" value="가입하기">
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