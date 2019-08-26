<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Outflearn</title>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">

<!-- slimSelect -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.23.0/slimselect.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.23.0/slimselect.min.css" rel="stylesheet"></link>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<h1>강의 검색하기</h1>
	<form action="searchFilter" method="get" id="filterForm">
		<input type="text" id="please" name="please" value="${btnIdVal }">
		<select name="subFilter" id="multiple" multiple>
			<c:forEach items="${mainList }" var="mainDto">
				<optgroup label="${mainDto.main_name }">
					<c:forEach items="${subList }" var="subDto">
						<c:if test="${mainDto.main_num eq subDto.main_num }">
							<option value="${subDto.sub_num }">${subDto.sub_name }</option>
						</c:if>
					</c:forEach>
				</optgroup>
			</c:forEach>	
		</select>
		<input type="submit" value="검색">
	</form>

	<c:if test="${!empty resList }">
	<input type="text" > <input type="button" value="결과 내 검색하기">
		<table>		
				<c:forEach items="${resList }" var="resDto">
					<tr>
						<td>
						<div>
							<div id="img">
								<img src="${pageContext.request.contextPath }/resources/uploadImage/${resDto.class_img }" alt="썸네일" class="col-md-3">
							</div>
						
						
						</div>
						
						
						
						
						
						
						<input type="text" name="resTitle" value="${resDto.class_title }" id="title${resDto.class_num }">					
						<input type="text" name="resNum" value="${resDto.class_num }" id="num${resDto.class_num }">
						</td>
						<td><input type="button" onclick="setParentText()" value="선택" id="${resDto.class_num }" name="resBtn"></td>
					</tr>
				</c:forEach>		
		</table>
	</c:if>

	<script type="text/javascript">
	
		$(function() {
			new SlimSelect({		
				 select: '#multiple'
			})
			
		});	
	
		$("input[name=resBtn]").click(function(){
					
			var resBtnId = $(this).attr('id');
			alert("========"+resBtnId);
			
			var returnVal = document.getElementById("please").value;
			alert("++++++++"+returnVal);
			
			opener.document.getElementById("real"+returnVal).value = document.getElementById("title"+resBtnId).value;
			opener.document.getElementById("test"+returnVal).value = document.getElementById("num"+resBtnId).value;		
			window.close();
			
			
		});
	
		
	</script>

<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
</body>
</html>