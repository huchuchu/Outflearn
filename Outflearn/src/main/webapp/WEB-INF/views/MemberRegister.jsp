<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <meta name="description" content=""> -->
<!-- <meta name="author" content=""> -->
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
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="resources/css/bootstrap.css"> -->
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="resources/fonts/font-awesome/css/font-awesome.css"> -->

<!-- Stylesheet
    ================================================== -->
<!-- <link rel="stylesheet" type="text/css" href="resources/css/style.css"> -->
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="resources/css/nivo-lightbox/nivo-lightbox.css"> -->
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="resources/css/nivo-lightbox/default.css"> -->
<!-- <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" -->
<!-- 	rel="stylesheet"> -->
<!-- <link href="https://fonts.googleapis.com/css?family=Lato:400,700" -->
<!-- 	rel="stylesheet"> -->
<!-- <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" -->
<!-- 	rel="stylesheet"> -->

<!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
<link href="/your-path-to-fontawesome/css/fontawesome.css"
	rel="stylesheet">
<link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
<link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">
<!-- <script src="https://kit.fontawesome.com/27cb20e940.js"></script> -->

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


<sec:csrfMetaTags/>


</head>

<body>

	<!-- Header  -->
	<jsp:include page="header/MainHeader.jsp"></jsp:include>
	<!-- Header  -->
	
	<h1 class="text-center">회원 가입</h1>
	<div class="row">
		<div class="col-xs-3 col-sm-3"></div>
		<div class="col-xs-6 col-sm-6">
			
			<form method="post" action="${pageContext.request.contextPath}/register.do" onsubmit="return formsubmit();">
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
					
					<header>
						<h3>회원가입</h3>
					</header>
					<table>
						
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" class="text" name="user_id" placeholder="아이디" required />
								<div id="id_confirm"></div>
								<input type="button" class="idChk" id="btn_idcheck" value="중복확인" onclick="id_check()"/><p></p>
								<p class="result">
									<span class="msg">아이디를 확인해 주십시오.</span>
								</p>
							</td>
							
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" class="text" name="user_pw" placeholder="비밀번호" onchange="pass_check()" required />
								<div id="pass_check"></div>
								<input type="password" class="text" name="user_pw02" placeholder="비밀번호 확인" onchange="pass_confirm()" required />
								<div id="pass_confirm"></div><br>
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input type="text" class="text" name="user_nickname" placeholder="닉네임" required />
								<div id="nick_confirm"></div><br>
<!-- 								<input type="button" class="nickChk" name="btn_nickcheck" value="중복확인" onclick="nick_check()"/><p></p> -->
							</td>
				
						</tr>
						
						
						<tr>
							<th>이메일</th>
							<td>
								<input type="email" class="text" name="user_email"  placeholder="이메일" required/>
								<input type="button" class="emailChk" name="btn_emailChk" id="user_email" value="이메일 중복확인" onclick="email_Chk()" /><br> 
								<div id="emailDupChk"></div>
							</td>
						</tr>
						<tr>
							<th>이메일 인증번호</th>
							<td>
								<input type="text" class="text" name="ranNum" placeholder="인증번호" required/>
								<input type="button" id="btn_sendemail" value="인증번호발송" onclick="sendEmail()"/>
								<input type="button" id="ranChk" value="인증번호확인" onclick="ranNumChk()"/>
								<div id="confirm"></div>
								<div id="emailChkConfirm"></div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="example1" style="margin-left: 0em;"></div>
							</td>
						</tr>
						<tr>
							<td colspan="2" >
								<input type="submit" value="회원가입" style="margin-left: 10em;"/>
							</td>
						</tr>
					</table>
				</form>

		</div>
	</div>
	
   <!--footer  -->
   <jsp:include page="footer/Footer.jsp"></jsp:include>    
   <!--footer  -->

</body>

</html>