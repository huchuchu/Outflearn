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



</style>

</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yy-MM-dd HH:mm:ss" var="today"/>
<sec:authorize access="isAuthenticated()">
<sec:authentication var="num" property="principal.user_num"/>
</sec:authorize>


<c:forEach items="${list }" var="row">
<div class="media text-muted pt-3" id="rid${row.comment_num }">
	<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">
		<span class="d-block">
			<strong class="text-gray-dark">${row.user_nickname }</strong>
			<span style="padding-left: 7px; font-size: 9pt">
				<span style="padding-right: 5px;"><c:out value="${today }"></c:out></span>
				<a onclick="editComment(${row.comment_num},'${row.user_nickname }','${row.comment_content }');" style="padding-right: 5px;" class="icon">수정</a>
				<a onclick="deleteComment(${row.comment_num});" class="icon">삭제</a>
			</span>
		</span>
	</p>
	<p>${row.comment_content }</p>
</div>
</c:forEach>


<script type="text/javascript">

function editComment(comNum,nickName,content){
	
	var	htmls = "<div class='media text-muted pt-3' id='rid"+comNum+"'>"+
				"<p class='media-body pb-3 mb-0 small lh-125 border-bottom horder-gray'>"+
				"<span class='d-block'>"+
				"<strong class='text-gray-dark'>"+nickName+"</strong>"+
				"<span style='padding-left: 7px; font-size: 9pt'>"+
				"<span style='padding-right: 5px;'><c:out value='${today }'></c:out></span>"+
				"<a onclick='updateComment("+comNum+");' style='padding-right: 5px;' class='icon' >저장</a>"+
				"<a onclick='back()' class='icon'>취소</a>"+
				"</span>"+
				"</span>"+
				"</p>"+
				"<p>"+
				"<textarea class='form-control' id='editContent' rows='3' >"+
				 content +
				"</textarea>"+
				"</p>"+
				"</div>";
		
 		$('#rid'+comNum).replaceWith(htmls);
 		$('#rid'+comNum+'#editContent').focus();
}


</script>





<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
</body>
</html>