<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Favicons ================================================== -->
<link rel="shortcut icon" href="resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="resources/img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet ================================================== -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/nivo-lightbox/nivo-lightbox.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/nivo-lightbox/default.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900"
	rel="stylesheet">

<!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
<link href="/your-path-to-fontawesome/css/fontawesome.css"
	rel="stylesheet">
<link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
<link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<!-- ======================================================jQuery -->
<script type="text/javascript"
	src="resources/js/template/jquery.1.11.1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	//작성 버튼 눌렀을시 추가 사항이 있는지 알람
	function clearalert() {
		alert("추가 작성 없을시 '게시판 넘기기' 클릭");
	}

	$(document).ready(function() {

		$(".success1").click(function() {
			$(".data").remove();
		});

		$(".success2").click(function() {
			$(".youTube").remove();
		});

	});
</script>

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<jsp:include page="header/LectureListHeader.jsp"></jsp:include>

	<div class="form-group">
		<h1>영상 소개</h1>
	</div>

	<div class="row">
		<ul id="side_border"
			class="nav flex-column col-sm-2 col-el-2 text-center">
			<li class="nav-link active"><h3>강의 소개</h3></li>
			<li class="nav-link active"><h3>강의 내용</h3></li>
			<li class="nav-link active"><h3>영상 소개</h3></li>
			<li class="list-group-item-success"><h3>영상 추가</h3></li>
		</ul>
		<div class="col-sm-6 col-el-8">

			<form:form action="DataVideoUploadPlus"  method="post" enctype="multipart/form-data">


				<div class="form-group">
					<h3>과정 제목</h3>
					<input type="text" name="data_title" class="form-control" placeholder="${classdata.data_title }">
				</div>

				<div class="form-group">
					<h3>과정 순서</h3>
					<input type="text" name="data_sq" class="form-control" placeholder="다음 순서를 입력해주세요.">
				</div>

				<div class="form-group">
					<h3>영상 업로드(유튜브 영상 링크 또는 파일 업로드 하나만 선택)</h3>
					<div class="youTube">
						<input type="text" name="data_data" class="form-control" placeholder="유튜브 주소를 입력해주세요." /> 
						<input type="button" value="완료" class="success1" />
					</div>
				</div>
				<div class="form-group">
					<div class="data">
						<input type="file" name="file" /> 
						<input type="button" value="완료" class="success2" />
					</div>
				</div>


				<div class="form-group">
					<input type="submit" class="add_field_button btn btn-success btn-md" value="작성 후 클릭" onclick="clearalert();" />
					<input type="button" class="add_field_button btn btn-success btn-md" value="뒤로" onclick="location.href='BackDataVideoUploadForm'" /> 
					<input type="button" class="add_field_button btn btn-success btn-md" value="게시판 넘기기 " onclick="location.href='LectureList'">
				</div>

			</form:form>
		</div>
	</div>


	<!-- Footer Section -->
	<jsp:include page="footer/Footer.jsp"></jsp:include>

	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript"
		src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>

</body>

</html>