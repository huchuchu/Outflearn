<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>

<!-- css -->
<link rel="stylesheet" href="resources/css/LectureList.css">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet ================================================== -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">

	
</head>
<body>

<jsp:include page="../header/LectureListHeader.jsp"></jsp:include>


	<!-- body -->
	<form:form action="pay" method="post">
	<div class="column is-8">
		<h1>강좌 장바구니</h1>
				<c:choose>
					<c:when test="${empty classInfoUser }">
						<div>
						 	<p>담겨진 강의가 없습니다.</p>
						</div>
					</c:when>
					
					<c:otherwise>
						<div>
							
								<div class="container">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%">강좌</th>
							<th style="width:40%">가격</th>
							<th style="width:20%">총합</th>
						</tr>
					</thead>
					
				<c:forEach items="${classInfoUser }" var="dto">
					<tbody>
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<img src="${pageContext.request.contextPath }/resources/uploadImage/${dto.class_img }" alt="..." class="img-responsive"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin">${dto.class_title }</h4>
										<p>(수강기한:무제한)</p>
									</div>
								</div>
							</td>
							<td data-th="Price">₩${dto.class_price }</td>
							<td data-th="Price">₩${dto.class_price }</td>
							<td class="actions" >
								<input class="btn btn-info btn-sm" type="button" value="장바구니에서 삭제" onclick="loaction.href='basketDelete'">							
							</td>
						</tr>
					</tbody>
				</c:forEach>
					
					
					<tfoot>
						<tr>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center">
								<strong>총합 ₩1.99</strong>
							</td>
							<td><a href="#" class="btn btn-success btn-block">결제하기 <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
</div>
							
						</div>
					</c:otherwise>
				</c:choose>
	</div>
	</form:form>
	
	

<!-- ==================== FOOTER ==================== -->

	<jsp:include page="../footer/Footer.jsp"></jsp:include>

	<script type="text/javascript"
		src="resources/js/template/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript"
		src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript"
		src="resources/js/template/LectureList.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
</body>
</html>