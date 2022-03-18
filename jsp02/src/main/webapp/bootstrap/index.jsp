<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JumboTron</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.jumbotron {
 height:200px;
 background-image: url("../images/matrix.jpg");
 background-size: 100%;
 background-repeat: no-repeat; 
 text-shadow: lime 0.2em 0.2em 0.2em
}
</style>
</head>
<body>
<!-- navbar.jsp -->
<div class="container">
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
</div>

<div class="container">
  <div class="jumbotron">
   <h1 class="text-center"> 점보트론(JumboTron)</h1>
   <p class="text-center"> 점보트론은 대형전광판을 의미하는 단어로 첫화면에서 쓰일 메인화면으로 주로 쓰입니다.</p>
  </div>
</div>
 
<div class="container">
<!-- hover는 마우스가 올라갈때 음영처리된다.  -->
  <table class="table table-hover">
    <tr>
      <td>번호</td>
      <td>이름</td>
      <td>나이</td>
      <td>주소</td>
      <td>전화번호</td>
    </tr>
    <tr>
      <td>1</td>
      <td>kim</td>
      <td>20</td>
      <td>서울시</td>
      <td>010-111-5555</td>
    </tr>
   <tr>
      <td>2</td>
      <td>park</td>
      <td>30</td>
      <td>인천시</td>
      <td>010-222-5555</td>
    </tr>
    <tr>
      <td>3</td>
      <td>lee동</td>
      <td>40</td>
      <td>대전시</td>
      <td>010-555-5555</td>
    </tr>
  </table>
</div>

<div class="container">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</div>
</body>
</html>
            