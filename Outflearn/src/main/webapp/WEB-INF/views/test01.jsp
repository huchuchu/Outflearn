<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Sweet Alert2 -->
<!--  <link href='resources/js/sweetalert/sweetalert2.min.css' rel='stylesheet' /> -->
<!--  <script src='resources/js/sweetalert/sweetalert2.min.js'></script> -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script type="text/javascript">

function swaltest(){

	Swal.fire('Any fool can use a computer')
}

</script>
</head>
<body>
	<jsp:include page="header/MainHeader.jsp"></jsp:include>


<p>principal : <sec:authentication property="principal"/></p>
<p>아이디 : <sec:authentication property="principal.username" /> </p>
<p>비밀번호 : <sec:authentication property="principal.password"/> </p>
<p>이메일 : <sec:authentication property="principal.user_email"/></p>
<p>닉네임: <sec:authentication property="principal.user_nickname"/></p>
<p>등급 : <sec:authentication property="principal.Authorities"/></p>




<%-- <sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
<a href="/Outflearn/sulkiki"><input type="button" value="sulkiki_BTN"></a>
<%-- </sec:authorize> --%>

<%-- <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_TUTOR', 'ROLE_USER')"> --%>
<a href="/Outflearn/tutorgogo"><input type="button" value="tutor_BTN"></a>
<%-- </sec:authorize> --%>
<button onclick="swaltest()">SWAL_TEST</button>


<p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>







  <jsp:include page="footer/Footer.jsp"></jsp:include>
  

  
  
  
</body>
</html>