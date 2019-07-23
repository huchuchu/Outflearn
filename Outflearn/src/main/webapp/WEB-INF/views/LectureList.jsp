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

<!-- Favicons
          ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet
          ================================================== -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css"
	href="css/nivo-lightbox/nivo-lightbox.css">
<link rel="stylesheet" type="text/css"
	href="css/nivo-lightbox/default.css">
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

<!-- css -->
<link rel="stylesheet" href="css/LectureList.css">
</head>

<body id="page-top" data-spy="scroll" data-target=".fixed-top">
	<!-- ==========================================Navigation==========================================-->
	<nav id="menu" class="navbar navbar-default fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top">Interact</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-center">
					<li class="dropdown"><a href="void:0" class="dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">분야별
							강좌&nbsp;<i class="fas fa-chevron-down"></i>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown-submenu"><a
									class="dropdown-toggle dropright" href="void:0"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">서버&nbsp;<i
										class="fas fa-chevron-right pull-right"></i></a>
									<ul class="dropdown-menu">
										<li class="dropdown-item"><a href="void:0">Back End</a></li>
										<li class="dropdown-item"><a href="void:0">Linux</a></li>
										<li class="dropdown-item"><a href="void:0">Nodejs</a></li>
										<li class="dropdown-item"><a href="void:0">Express</a></li>
										<li class="dropdown-item"><a href="void:0">C#</a></li>
										<li class="dropdown-item"><a href="void:0">MYSQL</a></li>
									</ul></li>
								<li><a href="void:0"
									class="dropdown dropdown-toggle dropdown-item"
									data-toggle="dropdown">웹 개발 </a></li>
								<li><a href="void:0"
									class="dropdown dropdown-toggle dropdown-item"
									data-toggle="dropdown">데이터베이스
										<ul class="dropdown-menu" role="menu">

										</ul>
								</a></li>
							</ul>
					</a></li>
					<li><a href="void:0">로드맵 학습</a></li>
					<li><a href="void:0">아웃프런 소개</a></li>
					<li><a href="void:0">라이브</a></li>
					<li>
						<div class="search navbar-item header-search is-hidden-touch">
							<input type="text" class="input">
						</div>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="far fa-user">&nbsp;문희수</i>
							<div class="dropdown-menu" role="menu"
								aria-expanded="navbarDropdown">
								<a href="void:0">로그아웃</a>
							</div> </a></li>
					<li><a href="void:0">로그인</a></li>
					<li><a href="void:0">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<ul id="side_border" class="nav flex-column col-sm-2 text-center">
				<li class="nav-item"><a href="void:0" class="nav-link active"
					data-toggle="dropdown">카테고리</a></li>
				<li class="nav-item"><a href="void:0" id="side_server"
					class="nav-link active">서버&nbsp;<i class="fas fa-chevron-down"></i></a>
					<ul id="side_server_menu" class="nav flex-column">
						<li><a href="void:0" class="nav-link active">Back End</a></li>
						<li><a href="void:0" class="nav-link active">Linux</a></li>
						<li><a href="void:0" class="nav-link active">Nodejs</a></li>
						<li><a href="void:0" class="nav-link active">Express</a></li>
						<li><a href="void:0" class="nav-link active">C#</a></li>
						<li><a href="void:0" class="nav-link active">MYSQL</a></li>
					</ul></li>
				<li class="nav-item"><a href="void:0" id="side_web"
					class="nav-link active">웹 개발&nbsp;<i
						class="fas fa-chevron-down"></i></a>
					<ul id="side_web_menu" class="nav flex-column">
						<li><a href="void:0" class="nav-link active">html/css</a></li>
						<li><a href="void:0" class="nav-link active">Javascript</a></li>
						<li><a href="void:0" class="nav-link active">Front End</a></li>
						<li><a href="void:0" class="nav-link active">Spring</a></li>
						<li><a href="void:0" class="nav-link active">Java</a></li>
						<li><a href="void:0" class="nav-link active">Vuejs</a></li>
					</ul></li>
				<li class="nav-item"><a href="void:0" id="side_db"
					class="nav-link active">데이터베이스&nbsp;<i
						class="fas fa-chevron-down"></i></a>
					<ul id="side_db_menu" class="nav flex-column">
						<li><a href="void:0" class="nav-link active">MYSQL</a></li>
						<li><a href="void:0" class="nav-link active">MONGODB</a></li>
						<li><a href="void:0" class="nav-link active">PL/SQL</a></li>
					</ul></li>
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
			</div>
			<article>
				<div class="page-body">
					<span>
						<h2>
							지식 카테고리
							<div class="btn-group pull-right">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" aria-expanded="false">
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul>
							</div>
						</h2>
					</span>
					<div>
						<span class="label label-default">Python</span>
					</div>
					<div class="card" style="width: 28.8rem;">
						<img class="card-img-top" src="images/cardpx.svg"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">Java</h5>
							<p class="card-text">JPA를 처음 접하거나, 실무에서 JPA를 사용하지만 기본 이론이
								부족하신 분들이 JPA의 기본 이론을 탄탄하게 학습해서 초보자도 실무에서 자신있게 JPA를 사용할 수 있습니다.</p>
						</div>
					</div>
				</div>
			</article>
			</main>
		</div>
	</div>
	<!-- Contact Section -->
	<div id="contact">
		<div class="container">
			<div class="col-md-8">
				<div class="row">
					<div class="section-title">
						<h2>Get In Touch</h2>
						<p>Please fill out the form below to send us an email and we
							will get back to you as soon as possible.</p>
					</div>
					<form name="sentMessage" id="contactForm" novalidate>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" id="name" class="form-control"
										placeholder="Name" required="required">
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="email" id="email" class="form-control"
										placeholder="Email" required="required">
									<p class="help-block text-danger"></p>
								</div>
							</div>
						</div>
						<div class="form-group">
							<textarea name="message" id="message" class="form-control"
								rows="4" placeholder="Message" required></textarea>
							<p class="help-block text-danger"></p>
						</div>
						<div id="success"></div>
						<button type="submit" class="btn btn-custom btn-lg">Send
							Message</button>
					</form>
				</div>
			</div>
			<div class="col-md-3 col-md-offset-1 contact-info">
				<div class="contact-item">
					<h3>Contact Info</h3>
					<p>
						<span><i class="fa fa-map-marker"></i> Address</span>4321
						California St,<br> San Francisco, CA 12345
					</p>
				</div>
				<div class="contact-item">
					<p>
						<span><i class="fa fa-phone"></i> Phone</span> +1 123 456 1234
					</p>
				</div>
				<div class="contact-item">
					<p>
						<span><i class="fa fa-envelope-o"></i> Email</span>
						info@company.com
					</p>
				</div>
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="social">
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#"><i class="fa fa-youtube"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Section -->
	<div id="footer">
		<div class="container text-center">
			<p>
				Shared by <i class="fa fa-love"></i><a
					href="https://bootstrapthemes.co">BootstrapThemes</a>
			</p>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/nivo-lightbox.js"></script>
	<script type="text/javascript" src="js/jqBootstrapValidation.js"></script>
	<script type="text/javascript" src="js/contact_me.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</body>

</html>