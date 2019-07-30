<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="utf-8">

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
        <a class="navbar-brand page-scroll" href="#page-top" style="color: #6372ff">Outflearn</a> </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-center">
          <li><a href="LectureList">강좌 둘러보기</a></li>
          <li><a href="void:0">로드맵 학습</a></li>
          <li><a href="void:0">아웃프런 소개</a></li>
          <li><a href="Livepage">라이브</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown"><a href="void:0" class="dropdown-toggle" data-toggle="dropdown"><i class="far fa-user"
                style="color: #6372ff "></i>
              <div class="dropdown-menu" role="menu" aria-expanded="navbarDropdown">
                <a href="/Outflearn/logout">로그아웃</a>
              </div>
            </a></li>
          <li><a href="/Outflearn/loginform">로그인</a></li>
          <li><a href="/Outflearn/joinform">회원가입</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Header -->
  <header id="header">
    <div class="intro">
      <div class="overlay">
        <div class="container">
          <div class="row">
            <div class="col-md-8 col-md-offset-2 intro-text">
              <h2>아웃프런에서 당신의 지식을 쌓으세요.</h2>
              <h2>${UserInfo.user_nickname}</h2>
              <p>배우고 싶은 지식 또는 기술을 경험하세요</p>
              <div class="input-group input-group-lg col-md-12">
                <input type="text" class="form-control" placeholder="배우고 싶은 기술을 입력하세요.">
                <span class="input-group-btn">
                  <button type="button" class="btn btn-default btn-lg"><i class="fas fa-search"
                      style="color: #3366FF"></i></button>
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
  </header>


  <!-- Live Section -->
  <div id="live">
    <div class="container">
      <h2 class="page-header" style="text-align: center">Live 강의</h2>

      <div class="slideshow-container">
        <div class="mySlides1">
          <img src="images/img_1.jpg" style="width: 100%">
        </div>

        <div class="mySlides1">
          <img src="images/img_2.jpg" style="width: 100%">
        </div>

        <div class="mySlides1">
          <img src="images/img_3.jpg" style="width: 100%">
        </div>

        <a class="prev" onclick="plusSlides(-1, 0)">&#10094;</a> <a class="next" onclick="plusSlides(1, 0)">&#10095;</a>
      </div>
    </div>
  </div>

  <!-- 신규 강좌 -->
  <div id="recent">
    <div class="container">
      <h2 class="page-header" style="text-align: center">최근에 개설된 신규 강좌</h2>

      <div class="slideshow-container">
        <div class="mySlides2">
          <img src="images/img_1.jpg" style="width: 100%">
        </div>

        <div class="mySlides2">
          <img src="images/img_2.jpg" style="width: 100%">
        </div>

        <div class="mySlides2">
          <img src="images/img_3.jpg" style="width: 100%">
        </div>

        <a class="prev" onclick="plusSlides(-1, 1)">&#10094;</a> <a class="next" onclick="plusSlides(1, 1)">&#10095;</a>
      </div>
    </div>
  </div>

  <!-- 좋은 평가를 받고 있는 강좌 -->
  <div id="best_review">
    <div class="container">
      <h2 class="page-header" style="text-align: center">좋은 평가를 받고 있는
        강좌</h2>

      <div class="slideshow-container">
        <div class="mySlides3">
          <img src="images/img_1.jpg" style="width: 100%">
        </div>

        <div class="mySlides3">
          <img src="images/img_2.jpg" style="width: 100%">
        </div>

        <div class="mySlides3">
          <img src="images/img_3.jpg" style="width: 100%">
        </div>

        <a class="prev" onclick="plusSlides(-1, 2)">&#10094;</a> <a class="next" onclick="plusSlides(1, 2)">&#10095;</a>
      </div>
    </div>
  </div>

  <!-- 인기 강좌 -->
  <div id="popular">
    <div class="container">
      <h2 class="page-header" style="text-align: center">인기있는 강좌</h2>

      <div class="slideshow-container">
        <div class="mySlides4">
          <img src="images/img_1.jpg" style="width: 100%">
        </div>

        <div class="mySlides4">
          <img src="images/img_2.jpg" style="width: 100%">
        </div>

        <div class="mySlides4">
          <img src="images/img_3.jpg" style="width: 100%">
        </div>

        <a class="prev" onclick="plusSlides(-1, 3)">&#10094;</a> <a class="next" onclick="plusSlides(1, 3)">&#10095;</a>
      </div>
    </div>
  </div>

  <jsp:include page="footer/Footer.jsp"></jsp:include>

  <script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
  <script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
  <script type="text/javascript" src="resources/js/template/nivo-lightbox.js"></script>
  <script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
  <script type="text/javascript" src="resources/js/template/contact_me.js"></script>
  <script type="text/javascript" src="resources/js/template/main.js"></script>
</body>

</html>