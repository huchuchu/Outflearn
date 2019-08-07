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

</body>
</html>