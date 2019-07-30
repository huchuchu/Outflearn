<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Outflearn</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Outflearn</title>

	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome/css/font-awesome.css">

	<!-- Stylesheet ================================================== -->
	<link rel="stylesheet" type="text/css" href="resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="resources/css/nivo-lightbox/nivo-lightbox.css">
	<link rel="stylesheet" type="text/css" href="resources/css/nivo-lightbox/default.css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">

	<!-- reference your copy Font Awesome here (from our Kits or by hosting yourself) -->
	<script src="https://kit.fontawesome.com/27cb20e940.js"></script>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/LectureList.css">
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<jsp:include page="header/LectureListHeader.jsp"></jsp:include>

	<div id="body" class="container">
		<div class="row">
			<ul id="side_border" class="nav flex-column col-sm-2 text-center">
				<li class="nav-item"><a href="void:0" class="nav-link active" data-toggle="dropdown">카테고리</a></li>
				<li class="nav-item"><a href="void:0" id="side_server" class="nav-link active">서버&nbsp;<i
							class="fas fa-chevron-down"></i></a>
					<ul id="side_server_menu" class="nav flex-column">
						<li><a href="void:0" class="nav-link active">Back End</a></li>
						<li><a href="void:0" class="nav-link active">Linux</a></li>
						<li><a href="void:0" class="nav-link active">Nodejs</a></li>
						<li><a href="void:0" class="nav-link active">Express</a></li>
						<li><a href="void:0" class="nav-link active">C#</a></li>
						<li><a href="void:0" class="nav-link active">MYSQL</a></li>
					</ul>
				</li>
				<li class="nav-item"><a href="void:0" id="side_web" class="nav-link active">웹 개발&nbsp;<i
							class="fas fa-chevron-down"></i></a>
					<ul id="side_web_menu" class="nav flex-column">
						<li><a href="void:0" class="nav-link active">html/css</a></li>
						<li><a href="void:0" class="nav-link active">Javascript</a></li>
						<li><a href="void:0" class="nav-link active">Front End</a></li>
						<li><a href="void:0" class="nav-link active">Spring</a></li>
						<li><a href="void:0" class="nav-link active">Java</a></li>
						<li><a href="void:0" class="nav-link active">Vuejs</a></li>
					</ul>
				</li>
				<li class="nav-item"><a href="void:0" id="side_db" class="nav-link active">데이터베이스&nbsp;<i
							class="fas fa-chevron-down"></i></a>
					<ul id="side_db_menu" class="nav flex-column">
						<li><a href="void:0" class="nav-link active">MYSQL</a></li>
						<li><a href="void:0" class="nav-link active">MONGODB</a></li>
						<li><a href="void:0" class="nav-link active">PL/SQL</a></li>
					</ul>
				</li>
				<ul class="row" style="clear: both">
					<ul class="nav flex-column">
						<li class="nav-item"><a href="void:0" class="nav-link active">카테고리</a>
						</li>
						<li class="nav-item"><a href="void:0" class="nav-link active">서버&nbsp;<i
									class="fas fa-chevron-right"></i></a></li>
						<li class="nav-item"><a href="void:0" class="nav-link active">웹
								개발&nbsp;<i class="fas fa-chevron-right"></i>
							</a></li>
						<li class="nav-item"><a href="void:0" class="nav-link active">데이터베이스&nbsp;<i
									class="fas fa-chevron-right"></i></a></li>
					</ul>
				</ul>
			</ul>
			<main>
				<div class="page-header col-sm-10">
					<h1 id="page-header-content">전체 카테고리</h1>
					<div class="input-group col-sm-4 pull-right">
						<input type="text" class="form-control" placeholder="검색하기">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">검색</button>
						</span>
					</div>
					<a href="LectureDetail">
						<div class="card" style="width: 28.8rem">
							<img class="card-img-top" src="resources/img/cardpx.svg" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">Java</h5>
								<p class="card-text">JPA를 처음 접하거나, 실무에서 JPA를 사용하지만 기본 이론이
									부족하신 분들이 JPA의 기본 이론을 탄탄하게 학습해서 초보자도 실무에서 자신있게 JPA를 사용할 수 있습니다.</p>
							</div>

						</div>
					</a>
					</article>
			</main>
		</div>
	</div>
	<!-- ==================== FOOTER ==================== -->

	<jsp:include page="footer/Footer.jsp"></jsp:include>

	<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript" src="resources/js/template/contact_me.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
</body>

</html>