<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="utf-8">

<head>
  <meta charset="UTF-8">
  <title>Outflearn</title>

</head>
<body>
  
  <!-- Header -->
  <jsp:include page="header/MainHeader.jsp"></jsp:include>
  
  <header id="header">
    <div class="intro">
      <div class="overlay">
        <div class="container">
          <div class="row">
            <div class="col-md-8 col-md-offset-2 intro-text">
              <h2>아웃프런에서 당신의 지식을 쌓으세요.</h2>              
              <sec:authorize access="isAuthenticated()">
              <h2><sec:authentication property="principal.user_nickname"/> 님 </h2>
              </sec:authorize>
              <p>배우고 싶은 지식 또는 기술을 경험하세요</p>
              <div class="input-group input-group-lg col-md-12">
      		 <form method="post" action="${pageContext.request.contextPath}/oauth">
      		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">	
    		<button>카카오페이로 결제하기</button>
			</form>
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

  <!--footer  --> 
  <jsp:include page="footer/Footer.jsp"></jsp:include>
  <!--footer  --> 

</body>

</html>