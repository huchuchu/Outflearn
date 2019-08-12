<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript" src="resources/js/utils/register.js"></script>
<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
<title>Outflearn</title>

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="resources/img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/nivo-lightbox/nivo-lightbox.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/nivo-lightbox/default.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900"
	rel="stylesheet">

<!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
<link href="/your-path-to-fontawesome/css/fontawesome.css"
	rel="stylesheet">
<link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
<link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>

<sec:csrfMetaTags/>

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
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
	<!-- ==========================================Navigation==========================================-->
	<nav id="menu" class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top"
					style="color: #6372ff">Outflearn</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-center">
					<li><a href="LectureList.html">강좌 둘러보기</a></li>
					<li><a href="void:0">로드맵 학습</a></li>
					<li><a href="void:0">아웃프런 소개</a></li>
					<li><a href="void:0">라이브</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="void:0" class="dropdown-toggle"
						data-toggle="dropdown"><i class="far fa-user"
							style="color: #6372ff"></i>
							<div class="dropdown-menu" role="menu"
								aria-expanded="navbarDropdown">
								<a href="void:0">로그아웃</a>
							</div> </a></li>
					<li><a href="/Outflearn/loginform">로그인</a></li>
					<li><a href="/Outflearn/registerform.do">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<h1 class="text-center">회원 가입</h1>
	<div class="row">
		<div class="col-xs-3 col-sm-3"></div>
		<div class="col-xs-6 col-sm-6">
			<div class="col-sm-6 col-md-offset-3">

			<form method="post" action="${pageContext.request.contextPath}/register.do" onsubmit="return formsubmit();">
           	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">		
					<div class="form-group">
                        <label for="inputName">아이디</label>
                        <input type="text" class="form-control"  name="user_id" id="inputName" placeholder="아이디를 입력해 주세요" required />
								<div id="id_confirm"></div>
								<div class="form-group text-center" >
									<button type="button" id="btn_idcheck" class="btn btn-info" onclick="id_check()" >중복확인<i class="fa fa-check spaceLeft"></i></button>
									<p class="result">
									<span class="msg">아이디를 확인해 주십시오.</span>
								</p>
								</div>
					</div>
					<div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control" name="user_pw" id="inputPassword" placeholder="비밀번호를 입력해 주세요" onchange="pass_check()" required />
							<div id="pass_check"></div>
						<input type="password" class="form-control" name="user_pw02" id="inputPassword" placeholder="비밀번호를 확인해 주세요" onchange="pass_confirm()" required />
							<div id="pass_confirm"></div><br>
							
                    </div>
                    
                    <div class="form-group">
                        <label class="label-primary" for="InputNickname">닉네임</label>
							<input type="text" class="form-control" name="user_nickname" placeholder="닉네임" required />
                    </div>
                    
					<div class="form-group">
                        <label for="InputEmail">이메일 주소</label>
                        <input type="email" class="form-control" name="user_email" id="InputEmail" placeholder="이메일 주소를 입력해주세요" required/>
						<div class="form-group text-center">
						<button type="button" id="user_email" name="btn_emailChk" class="btn btn-info" onclick="email_Chk()">이메일 중복확인<i class="fa fa-check spaceLeft"></i></button>
						</div>
						<div class="form-group text-center">
							<div id="emailDupChk"></div>
                    	</div>
                    </div>
					<div class="form-group">
						<label for="InputEmail">이메일 인증 번호</label>
							<input type="text" class="form-control" name="ranNum" placeholder="인증번호발송을 먼저 누르시고 인증번호를 입력해주세요" required/>
							<div class="form-group text-center">
							<input type="button" class="btn btn-info" id="btn_sendemail" value="인증번호발송" onclick="sendEmail()"/>
							<input type="button" class="btn btn-info" id="ranChk" value="인증번호확인" onclick="ranNumChk()"/>
							<div id="confirm"></div>
							<div id="emailChkConfirm"></div>
                    		</div>
					</div>
					<div class="form-group text-center">
						<div id="example1" ></div>
						
					</div>
					<div class="form-group text-center">
						<button type="submit" id="join-submit" class="btn btn-success">회원가입<i class="fa fa-check spaceLeft"></i></button>
					</div>
						
						
					
				</form>
			</div>
		</div>
	</div>
	


	<!-- Contact Section -->
	<div id="contact">
		<div class="container">
			<div class="col-md-8">
				<div class="row">
					<div class="section-title">
						<h2>Get In Touch</h2>
						<p>Please fill out the form below to send us an email and we
							will get back to you as soon as possible.</p>
					</div>
					<form name="sentMessage" id="contactForm" novalidate>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" id="name" class="form-control"
										placeholder="Name" required="required">
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="email" id="email" class="form-control"
										placeholder="Email" required="required">
									<p class="help-block text-danger"></p>
								</div>
							</div>
						</div>
						<div class="form-group">
							<textarea name="message" id="message" class="form-control"
								rows="4" placeholder="Message" required></textarea>
							<p class="help-block text-danger"></p>
						</div>
						<div id="success"></div>
						<button type="submit" class="btn btn-custom btn-lg">Send
							Message</button>
					</form>
				</div>
			</div>
			<div class="col-md-3 col-md-offset-1 contact-info">
				<div class="contact-item">
					<h3>Contact Info</h3>
					<p>
						<span><i class="fa fa-map-marker"></i> Address</span>4321
						California St,<br> San Francisco, CA 12345
					</p>
				</div>
				<div class="contact-item">
					<p>
						<span><i class="fa fa-phone"></i> Phone</span> +1 123 456 1234
					</p>
				</div>
				<div class="contact-item">
					<p>
						<span><i class="fa fa-envelope-o"></i> Email</span>
						info@company.com
					</p>
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
			<p>
				Shared by <i class="fa fa-love"></i><a
					href="https://bootstrapthemes.co">BootstrapThemes</a>
			</p>
		</div>
	</div>
	<script type="text/javascript"
		src="resources/js/template/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript"
		src="resources/js/template/jqBootstrapValidation.js"></script>
	<!--  
	<script type="text/javascript"
		src="resources/js/template/contact_me.js"></script>
	-->
	<script type="text/javascript" src="resources/js/template/main.js"></script>
	<script type="text/javascript" src="resources/js/utils/login.js?ver=1"></script>
</body>

</html>