<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Outflearn</title>

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome/css/font-awesome.css">

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

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<jsp:include page="header/MainHeader.jsp"></jsp:include>

	<!-- Live Section -->
	<div id="live">
		<div class="container">
			<h2 class="page-header" style="text-align: center">Live 강의</h2>

			<div class="slideshow-container">
				<div class="mySlides1">
					<img src="images/img_1.jpg" style="width: 100%">
				</div>

				<div class="mySlides1">
					<img src="images/img_2.jpg" style="width: 100%">
				</div>

				<div class="mySlides1">
					<img src="images/img_3.jpg" style="width: 100%">
				</div>

				<a class="prev" onclick="plusSlides(-1, 0)">&#10094;</a> <a
					class="next" onclick="plusSlides(1, 0)">&#10095;</a>
			</div>
		</div>
	</div>

	<!-- 신규 강좌 -->
	<div id="recent">
		<div class="container">
			<h2 class="page-header" style="text-align: center">최근에 개설된 신규 강좌</h2>

			<div class="slideshow-container">
				<div class="mySlides2">
					<img src="images/img_1.jpg" style="width: 100%">
				</div>

				<div class="mySlides2">
					<img src="images/img_2.jpg" style="width: 100%">
				</div>

				<div class="mySlides2">
					<img src="images/img_3.jpg" style="width: 100%">
				</div>

				<a class="prev" onclick="plusSlides(-1, 1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1, 1)">&#10095;</a>
			</div>
		</div>
	</div>

	<!-- 좋은 평가를 받고 있는 강좌 -->
	<div id="best_review">
		<div class="container">
			<h2 class="page-header" style="text-align: center">좋은 평가를 받고 있는
				강좌</h2>

			<div class="slideshow-container">
				<div class="mySlides3">
					<img src="images/img_1.jpg" style="width: 100%">
				</div>

				<div class="mySlides3">
					<img src="images/img_2.jpg" style="width: 100%">
				</div>

				<div class="mySlides3">
					<img src="images/img_3.jpg" style="width: 100%">
				</div>

				<a class="prev" onclick="plusSlides(-1, 2)">&#10094;</a> <a
					class="next" onclick="plusSlides(1, 2)">&#10095;</a>
			</div>
		</div>
	</div>

	<!-- 인기 강좌 -->
	<div id="popular">
		<div class="container">
			<h2 class="page-header" style="text-align: center">인기있는 강좌</h2>

			<div class="slideshow-container">
				<div class="mySlides4">
					<img src="images/img_1.jpg" style="width: 100%">
				</div>

				<div class="mySlides4">
					<img src="images/img_2.jpg" style="width: 100%">
				</div>

				<div class="mySlides4">
					<img src="images/img_3.jpg" style="width: 100%">
				</div>

				<a class="prev" onclick="plusSlides(-1, 3)">&#10094;</a> <a
					class="next" onclick="plusSlides(1, 3)">&#10095;</a>
			</div>
		</div>
	</div>

	<jsp:include page="footer/Footer.jsp"></jsp:include>

	<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript" src="resources/js/template/contact_me.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
</body>

</html>