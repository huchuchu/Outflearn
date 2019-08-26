<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<jsp:include page="../views/header/LectureListHeader.jsp"></jsp:include>


	<!-- body -->
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
									<th style="width: 50%">강좌</th>
									<th style="width: 40%">가격</th>
									<th style="width: 20%">총합</th>
								</tr>
							</thead>
							
							<c:set var="sum" value="0" />
							<c:forEach items="${classInfoUser }" var="dto" varStatus="status">
								<tbody>
									<tr>
										<td data-th="Product">
											<div class="row">
												<div class="col-sm-2 hidden-xs">
													<img
														src="${pageContext.request.contextPath }/resources/uploadImage/${dto.class_img }"
														alt="..." class="img-responsive" />
												</div>
												<div class="col-sm-10">
													<h4 class="nomargin">${dto.class_title }</h4>
													<p>(수강기한:무제한)</p>
												</div>
											</div>
										</td>
										<td data-th="Price">₩${dto.class_price }</td>
										<td data-th="Price">₩${dto.class_price }</td>
										<td class="actions">
												<input type="hidden" name="class_num"
													value="${dto.class_num }" id="class_num">
												<input type="button" class="btn btn-info btn-sm"
													value="강의 삭제" onclick="BasketDelete();">
											</td>
									</tr>
								</tbody>
							<c:set var="sum" value="${sum + (dto.class_price * status.count )}" />
							</c:forEach>


							<tfoot>
								<tr>
									<td colspan="2" class="hidden-xs"></td>
									<td class="hidden-xs text-center"><strong>총합
											<fmt:formatNumber  value="${sum}" />원</strong></td>
									<td></td>
								</tr>
							</tfoot>
						</table>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</div>


	<form:form method="post" action="oauth">
		<input type="submit" value="결제하기" class="btn btn-success btn-block">
	</form:form>
	
	<script type="text/javascript">
	var class_num = $("#class_num").val();

	function BasketDelete() {
		
		$.ajax({
			url : 'basketDelete?class_num=' + class_num,	
			method : 'post',
			success:function(data){
				window.location.reload();
			},
			error:function(){
				alert('에러 발생~~ \n')
			}
			
		});	
		

	}
	</script>


	<!-- ==================== FOOTER ==================== -->

	<jsp:include page="../views/footer/Footer.jsp"></jsp:include>

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