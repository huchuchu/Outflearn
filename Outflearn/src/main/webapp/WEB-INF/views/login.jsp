<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <sec:csrfMetaTags/>
  

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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		});
	
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


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
          <li><a href="LectureList.html">강좌 둘러보기</a></li>
          <li><a href="void:0">로드맵 학습</a></li>
          <li><a href="void:0">아웃프런 소개</a></li>
          <li><a href="void:0">라이브</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown"><a href="void:0" class="dropdown-toggle" data-toggle="dropdown"><i class="far fa-user"
                style="color: #6372ff "></i>
              <div class="dropdown-menu" role="menu" aria-expanded="navbarDropdown">
                <a href="void:0">로그아웃</a>
              </div>
            </a></li>
          <li><a href="/Outflearn/loginfrom">로그인</a></li>
          <li><a href="void:0">회원가입</a></li>
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
            
            <!-- 로그인 폼 영역 시작  -->
            <script type="text/javascript">
            
            $("#submit").submit(function(){
            	if($("#id").val()==""){
            		alert("아이디를 입력해주세요");
            	}else if($("#passwd").val()==""){
            		alert("비밀번호를 입력해 주세요");
            	}
            });
            
            </script>
            
              <form action="/Outflearn/login" method="post" id="test">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
                <input type="text" name="loginId" id="loginId" placeholder="ID">
                <input type="password" name="loginPw" id="loginPw" placeholder="PASSWORD">
                <input type="submit" value="Sign in" id="submit"><br/><br/>
				<label for="remember-me" style="padding-left: 60%;">
				<input type="checkbox" id="remember-me" name="remember-me">
				Rmember Me
				</label>
				<br/><br/>
				<c:if test="${not empty ERRORMSG }">
				<p>${ERRORMSG }	</p>	
				</c:if>
              </form>
              <br />

              <a href="void:0">아이디 찾기</a>
              <a href="void:0" style="padding-left: 2%;">비밀번호를 잊으셨나요?</a><br/><br/>
              
              <a id="kakao-login-btn"></a>
			  <a href="http://developers.kakao.com/logout"></a>
				
				<script type='text/javascript'>
				  //<![CDATA[
				    // 사용할 앱의 JavaScript 키를 설정해 주세요.
              	    Kakao.init('85e61dfa4e850de4478ab8c6df1a737a');
				    // 카카오 로그인 버튼을 생성합니다.
				    Kakao.Auth.createLoginButton({
				      container: '#kakao-login-btn',
				      success: function(authObj) {
	 				        alert(JSON.stringify(authObj));	

				    	  Kakao.API.request({
				    		 url: '/v1/user/me',
				    		 success: function(res){
				    			 
				    			 alert(res);				    			 
				    			 res.id += "@k";	
				    			alert(res.id);
				    			
				    			$.ajax({
				    				url: "idChk.do",  //id체크
				    				data: "id="+res.id,
				    				
				    				success: function(data){
				    					alert(data.idChk);
				    					if(data.idChk==true){ //아이디가 없다면 회원가입 
				    						alert("회원가입");
				    						
				    						var param = 
				    						{"user_id":res.id, "user_pw":res.id, "user_email":res.kaccount_email, "user_nickname":res.properties.nickname }
				    						
				    						$.ajax({
				    							url: "kakaoUserinsert",
				    							method: "POST",
				    							data: param	,
				    							success : function(){ //회원가입 성공, 가입 후 로그인ㄱㄱ
				    								alert("회원가입 완료");
				    								$("form").attr("method","post").attr("action","/Outflearn/login?id="+res.id+"&passwd="+res.id).submit();

				    							}
				    						});
				    						
				    					}else{ //아이디가 있다면 로그인 (시큐리티 로그인ㄱㄱ)
				    						alert("로그인하러 갑니다~!");
		    								$("form").attr("method","post").attr("action","/Outflearn/login?id="+res.id+"&passwd="+res.id).submit();
				    					}
				    				}
				    			});
				    		 },
				    		 fail: function(error){
				    			 alert(JSON.stringify(err));
				    		 }
				    	  });
				      },
				      fail: function(err) {
				         alert(JSON.stringify(err));
				      }
				    });
				  //]]>
				</script>
	
              
			
			<br/><br/>	
            <a href="void:0"><img alt=""
                  src="${pageContext.request.contextPath}/resources/img/loginIMG/naverLogin.png"></a>

              <!-- 로그인 폼 끝 -->

            </div>
          </div>
        </div>
      </div>
    </div>
  </header>


  <!-- Contact Section -->
  <div id="contact">
    <div class="container">
      <div class="col-md-8">
        <div class="row">
          <div class="section-title">
            <h2>Get In Touch</h2>
            <p>Please fill out the form below to send us an email and we will get back to you as soon as possible.</p>
          </div>
          <form name="sentMessage" id="contactForm" novalidate>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" id="name" class="form-control" placeholder="Name" required="required">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <input type="email" id="email" class="form-control" placeholder="Email" required="required">
                  <p class="help-block text-danger"></p>
                </div>
              </div>
            </div>
            <div class="form-group">
              <textarea name="message" id="message" class="form-control" rows="4" placeholder="Message"
                required></textarea>
              <p class="help-block text-danger"></p>
            </div>
            <div id="success"></div>
            <button type="submit" class="btn btn-custom btn-lg">Send Message</button>
          </form>
        </div>
      </div>
      <div class="col-md-3 col-md-offset-1 contact-info">
        <div class="contact-item">
          <h3>Contact Info</h3>
          <p><span><i class="fa fa-map-marker"></i> Address</span>4321 California St,<br>
            San Francisco, CA 12345</p>
        </div>
        <div class="contact-item">
          <p><span><i class="fa fa-phone"></i> Phone</span> +1 123 456 1234</p>
        </div>
        <div class="contact-item">
          <p><span><i class="fa fa-envelope-o"></i> Email</span> info@company.com</p>
        </div>
      </div>
      <div class="col-md-12">
        <div class="row">
          <div class="social">
            <ul>
              <li><a href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
              <li><a href="#"><i class="fa fa-youtube"></i></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Footer Section -->
  <div id="footer">
    <div class="container text-center">
      <p>Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a></p>
    </div>
  </div>
  <script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
  <script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
  <script type="text/javascript" src="resources/js/template/nivo-lightbox.js"></script>
  <script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
  <!-- script type="text/javascript" src="resources/js/template/contact_me.js"></script> -->
  <script type="text/javascript" src="resources/js/template/main.js"></script>
  <script type="text/javascript" src="resources/js/utils/login.js?ver=1"></script>
</body>

</html>