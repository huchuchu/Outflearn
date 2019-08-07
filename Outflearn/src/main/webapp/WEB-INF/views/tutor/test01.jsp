<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form:form action="/Outflearn/test01">
<input type="text" name="test" >
<input type="submit" value="제출">
</form:form>

<%-- <form action="/Outflearn/test01" method="post"> --%>
<%-- <sec:csrfInput/> --%>
<!-- <input type="text" name="test" > -->
<!-- <input type="submit" value="제출"> -->
<%-- </form> --%>

<br/><br/>


<p>principal : <sec:authentication property="principal"/></p>
<p>principal.username : <sec:authentication property="principal.username" /> </p>
<p>principal.passwird : <sec:authentication property="principal.password"/> </p>
<p>principal.email : <sec:authentication property="principal.user_email"/></p>
<p>닉네임: <sec:authentication property="principal.user_nickname"/></p>
<p>등급(principal.Authorities): <sec:authentication property="principal.Authorities"/></p>
<sec:authorize></sec:authorize>


<sec:authorize></sec:authorize>





</body>
</html>