<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Outflearn</title>
  <!-- Bootstrap -->
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome/css/font-awesome.css">

  <!-- Stylesheet
    ================================================== -->
  <link rel="stylesheet" type="text/css" href="resources/css/style.css">
  <link rel="stylesheet" type="text/css" href="resources/css/nivo-lightbox/nivo-lightbox.css">
  <link rel="stylesheet" type="text/css" href="resources/css/nivo-lightbox/default.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">

  <!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
  <script src="https://kit.fontawesome.com/27cb20e940.js"></script>
  
  <!-- Sweet Alert2 -->
  <link href='resources/js/sweetalert/sweetalert2.min.css' rel='stylesheet' />
  <script src='resources/js/sweetalert/sweetalert2.min.js'></script>

  

  
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<!-- ==========================================Navigation==========================================-->
  <nav id="menu" class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
          data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span
            class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <a class="navbar-brand page-scroll" href="/Outflearn/" style="color: #6372ff">Outflearn</a> </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-center">
          <li><a href="LectureList">강좌 둘러보기</a></li>
          <li><a href="RoadMap">로드맵 학습</a></li>
          <li><a href="introOutflearn">아웃프런 소개</a></li>
          <li><a href="Livepage">라이브</a></li>
          <li><a href="basketSelect">장바구니</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"><a href="void:0" class="dropdown-toggle" data-toggle="dropdown"><i class="far fa-user" style="color: #6372ff "></i><div class="dropdown-menu" role="menu" aria-expanded="navbarDropdown">
              <a href="RoadMapWriteP1">로드맵 작성하기</a>
              <a href="RoadMapWriteP2">로드맵 작성하기2</a>
            </div></a></li>
          <sec:authorize access="isAnonymous()">
          <li><a href="/Outflearn/loginform">로그인</a></li>
          <li><a href="/Outflearn/registerform.do">회원가입</a></li>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
            <li><a href="/Outflearn/myPage">마이페이지</a></li>
            <li><a href="/Outflearn/MemberInfoUpdateForm.do">회원정보 수정</a></li>
          <li><a href="/Outflearn/logout">로그아웃</a></li>  
          </sec:authorize>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Header -->
  
</body>
</html>