<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Outflearn</title>

  <!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
  <script src="https://kit.fontawesome.com/27cb20e940.js"></script>

  <!-- css -->
  <link rel="stylesheet" href="resources/css/myPage.css">

  <!-- Bootstrap -->
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome/css/font-awesome.css">

  <!-- Stylesheet ================================================== -->
  <link rel="stylesheet" type="text/css" href="resources/css/style.css">

</head>

<body>

  <jsp:include page="../header/LectureListHeader.jsp"></jsp:include>

  <div class="container">

    <div class="row">

      <aside class="col-sm-2">

        <div class="side_category">
          <ul class="nav flex-column text-center">

            <li class="nav-item side_menu select">
              <a href="myPage">대시보드</a>
            </li>

            <li class="nav-item side_menu">
              <a href="void:0">내 강좌</a>
              <ul class="inner_menu">
                <li><a href="listenClass">수강중인 강좌</a></li>
                <li><a href="wishClass" >위시리스트</a></li>
              </ul>
            </li>

            <li class="nav-item side_menu">
              <a href="void:0">로드맵</a>
              <ul class="inner_menu">
                <li><a href="subRoadmap">참여중인 로드맵</a></li>
              </ul>
            </li>

            <li class="nav-item side_menu">
              <a href="myQuestion" >내 질문</a>
            </li>

            <li class="nav-item side_menu">
              <a href="void:0">설정</a>
              <ul class="inner_menu">
                <li><a href="configProfile">프로필 설정</a></li>
                <li><a href="configAlarm" class="selectMenu">알림 설정</a></li>
              </ul>
            </li>

          </ul>
        </div>

        <div class="side_category live">
          <ul class="nav flex-column text-center">
            <li class="nav-item side_menu">
              <a href="casterRoom">방송하기</a>
              <p>강사만 보이게</p>
            </li>
          </ul>
        </div>

      </aside>

      <div class="col-sm-10">
        <div class="page-header">
          <h1 id="page-header-content">설정</h1>
        </div>
        <article>
          <div class="page-body">
            <div class="row">
              <div class="col-sm-12">
                <div class="boardBox">
                  <h4 class="boxTitle">알람 설정</h4>
                  
                </div>
              </div>
            </div>


          </div>
        </article>
      </div>
    </div>
  </div>
  <!-- ==================== FOOTER ==================== -->

  <jsp:include page="../footer/Footer.jsp"></jsp:include>

  <script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
  <script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
  <script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
</body>

</html>