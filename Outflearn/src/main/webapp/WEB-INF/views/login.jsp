<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">

  <title>Outflearn</title>

<!-- loginform css -->
<link rel="stylesheet" type="text/css" href="resources/css/loginForm.css">

<!-- 카카오 네이버 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<!-- 제이쿼리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 
</head>
<body >
	
	<!-- Header  -->
	<jsp:include page="header/MainHeader.jsp"></jsp:include>
	<!-- Header  -->
	
	  <header id="header">
	    <div class="intro">
	      <div class="overlay">
	        <div class="container">
	          <div class="row">
	            <div class="col-md-8 col-md-offset-2 intro-text">
	            <div class="login-form">
	            <!-- 로그인 폼 영역 시작  -->
	            <div class="modal-header">
		        <a id="login-logo" style="text-align: center;" >Outflearn</a> 
	        	</div>
	            <div class="modal-body">
	            <br/><br/>
				
	              <form action="/Outflearn/login" method="post" id="loginform" name="loginform">
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
	                <input type="text" name="loginId" id="loginId" placeholder="  아이디 입력" ><br/>
	                <input type="password" name="loginPw" id="loginPw" placeholder="  비밀번호 입력" style="margin-top: 2%;"><br/><br/>
					
				
	                <input type="submit" value="Sign in" id="submitBTN" >
					<input type="checkbox" id="remember-me" name="remember-me" style="margin-left: 2%;">
					<span>Rmember Me</span>
	
					
					<br/><br/>
					<c:if test="${not empty ERRORMSG }">				
					<span id="errorMSG">${ERRORMSG }</span>	
					</c:if>
	              </form>
				<br/>
	              <a href="/Outflearn/findIdForm.do">아이디 찾기</a>
	              <a href="/Outflearn/findPwForm.do" style="padding-left: 2%;">비밀번호를 잊으셨나요?</a><br/><br/>
	              
	              <!-- 카카오 로그인 시작 -->
	              <a id="kakao-login-btn"></a>
				  <a href="http://developers.kakao.com/logout"></a>
				  <!-- 카카오로그인.js -->
				  <script type="text/javascript" src="resources/js/utils/kakaologin.js"></script><br/><br/>	
				  <!-- 카카오 로그인 끝 -->
				  <!-- ============================================= -->
	              <!-- 네이버 로그인  시작-->  
	              <!-- callback.jsp와 함께 사용  -->   
			      <div id="naverIdLogin"></div>
				  <script type="text/javascript">
					var naverLogin = new naver.LoginWithNaverId(
						{
							clientId: "xsVfuuGnIVuwdJhzN_0M",
							callbackUrl: "http://localhost:8787/Outflearn/naverCallback",
							isPopup: false, /* 팝업을 통한 연동처리 여부 */
							loginButton: {color: "green", type: 3, height: 48} /* 로그인 버튼의 타입을 지정 */
						}
					);
					
					/* 설정정보를 초기화하고 연동을 준비 */
					naverLogin.init();
				</script>
				</div>
	
				<!-- 네이버 로그인 끝 -->
	         <!-- 로그인 폼 끝 --> 
	<%--             <jsp:include page="loginform.jsp"></jsp:include>             --%>
				</div>
			  <div class="modal-footer">
		        <a style="text-align: center; color: white; font-weight: 600;" >© Outflean </a> 
		      </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </header>

   <!--footer  -->
   <jsp:include page="footer/Footer.jsp"></jsp:include>    
   <!--footer  -->
   
  <script type="text/javascript" src="resources/js/utils/login.js"></script>    
</body>

</html>