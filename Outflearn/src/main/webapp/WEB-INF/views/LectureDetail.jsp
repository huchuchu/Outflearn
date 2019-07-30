<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Outflearn</title>

<title>Outflearn</title>

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet
    ================================================== -->
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
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>

<!-- css -->
<link rel="stylesheet" href="resources/css/detail.css">

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<jsp:include page="header/LectureListHeader.jsp"></jsp:include>

	<div class="jumbotron" style="width: 100%">
		<div id="jumbo_row" class="row">
			<img src="resources/img/cardpx.svg" alt="썸네일" class="col-md-3">
			<div class="col-md-6">
				<h3>[Reactjs 강좌] React.js를 이용하여 웹 애플리케이션 만들기</h3>
				<div>
					<span>평점</span><br> <span>수강생</span>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="2"
							aria-valuemin="0" aria-valuemax="100"
							style="min-width: 2em; width: 2%;">2%</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<p class="text-center">
					<a href="void:0" class="btn btn-success btn-lg" role="button">학습하기</a>
				</p>
			</div>
		</div>
	</div>
	<div class="container">
		<nav class="nav">
			<ul class="nav nav-tabs">
				<li class="nav-item "><a class="nav-link" href="#">대쉬보드</a></li>
				<li class="nav-item "><a class="nav-link" href="#">강좌소개</a></li>
				<li class="nav-item "><a class="nav-link" href="#">질문&답변</a></li>
				<li class="nav-item "><a class="nav-link" href="#">새소식</a>
				</li>
			</ul>
		</nav>
	</div>
	<div id="page-switch" class="container">
		<input type="hidden" id="selectone" value="${classinfo.class_num }">
            <p>${classinfo.class_num } // test</p>
    </div>
	<jsp:include page="footer/Footer.jsp"></jsp:include>

	<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript" src="resources/js/template/contact_me.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
	<script type="text/javascript" src="resources/js/template/detail.js"></script>
</body>

</html>