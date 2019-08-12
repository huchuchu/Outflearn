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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/utils/memberInfo.js"></script>
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
	
	<h1 class="text-center">회원 정보 설정</h1>

		<div class="row">
		<div class="col-xs-3 col-sm-3"></div>
		<div class="col-xs-6 col-sm-6">
			
			<div id="content">
		<div class="inner">

			<!-- Post -->
			<section class="box search">
				<form method="post" action="${pageContext.request.contextPath}/memberInfoUpdate.do" onsubmit="return formsubmit();">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">	
					<header>
						<h3>회원정보 설정</h3>
					</header>
					
					<table id="user_info_table">
						
						<tr>
							<th>아이디</th>
							<td>
							<input type="text" name="user_id" value='<sec:authentication property="principal.username"/>'></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
							<input type="text" name="user_nickname" value='<sec:authentication property="principal.user_nickname"/>'>
							</td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">비밀번호</th>
							<td>
								<ul>
									<li>
										<label for="now_pw">
											<span>현재 비밀번호 : </span><input type="password" id="now_pw" name="now_pw" placeholder="현재 비밀번호를 입력해주세요."  required >
											<span id="currentPwChk"></span>
										</label>
									</li>
									<li>
										<label for="new_pw">
											<span>새 비밀번호 : </span><input type="password" id="new_pw" name="new_pw" placeholder="변경할 비밀번호를 입력해주세요." onchange="pw_change()" required >
<!-- 											<input type="button" id="pw_change_btn" value="비밀번호확인" onclick="pw_change()"> -->
										<div id="pass_check"></div>
											
										</label>
									</li>
									<li>
										<label for="new_pw_chk">
											<span>새 비밀번호 확인 : </span><input type="password" id="new_pw_chk" name="new_pw_chk" placeholder="다시 한 번 입력해주세요." >
										</label>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td>
								<div id="pw_success" style="color: blue;">비밀번호가 일치합니다.</div>
								<div id="pw_fail" style="color: red;">비밀번호가 일치하지 않습니다.</div>
							</td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">이메일</th>
							<td class="email_inline">
								<input type="text" id="email1" name="email1" value="${email1}">
								  @
								<input type="text" id="email2" name="email2" value="${email2 }" >
								<select id="select_email" name="select_email">
									<option value="1" selected>직접 입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="paran.com">paran.com</option>
									<option value="empas.com">empas.com</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="freechal.com">freechal.com</option>
									
								</select>
								
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<input type="submit" class="MemberInfoUpdate_btn" value="수정하기" >
								<input type="button" class="MemberInfoCancel_btn" value="취소" onclick="location.href='loginform?user_id=<sec:authentication property="principal.user_id"/>'"> 
								<input type="button" class="member_info_bottom" value="회원탈퇴" onclick="withdraw()">
							</td>
						</tr>
					</table>
				</form>
			</section>

		</div>
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