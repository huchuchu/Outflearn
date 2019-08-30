<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Outflearn</title>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
<!-- 제이쿼리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">
.icon{
cursor: pointer;
}

.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}



</style>

</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yy-MM-dd HH:mm:ss" var="today"/>


<table class="table">
<c:forEach items="${list }" var="row">
<tr>
	<td>
		<span><b>${row.user_nickname }</b></span>
		<span><c:out value="${today }"></c:out></span>
		<p><span>${row.comment_content }</span></p>
		<p><a class="icon">답글달기</a></p>
		<div id="reComment"></div>
	</td>
	<td>
		<sec:authentication property="principar.user_num"/>
		<a title="수정" class="icon" id="myBtn" ><i class="fas fa-reply"></i></a>
		<a title="삭제" class="icon" onclick="location.href='commentDelete?commentNum=${row.comment_num}'"><i class="far fa-trash-alt"></i></a>
	</td>
</tr>
</c:forEach>
</table>





<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
</body>
</html>