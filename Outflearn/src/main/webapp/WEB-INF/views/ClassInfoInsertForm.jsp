<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<link href="/your-path-to-fontawesome/css/fontawesome.css"
	rel="stylesheet">
<link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
<link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/27cb20e940.js"></script>

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">


	<!-- ==========================================Navigation==========================================-->
	<nav id="menu" class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top"
					style="color: #6372ff">Outflearn</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-center">
					<li><a href="LectureList">강좌 둘러보기</a></li>
					<li><a href="void:0">로드맵 학습</a></li>
					<li><a href="void:0">아웃프런 소개</a></li>
					<li><a href="void:0">라이브</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="void:0" class="dropdown-toggle"
						data-toggle="dropdown"><i class="far fa-user"
							style="color: #6372ff"></i>
							<div class="dropdown-menu" role="menu"
								aria-expanded="navbarDropdown">
								<a href="void:0">로그아웃</a>
							</div> </a></li>
					<li><a href="/Outflearn/login">로그인</a></li>
					<li><a href="void:0">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
		

		<br/><br/><br/>
		<div class="row">
			<ul id="side_border" class="nav flex-column col-sm-2 col-el-2 text-center">
						<li class="list-group-item-success"><h3>강의 소개</h3></li>
						<li class="nav-link active"><h3>강의 내용</h3></li>
						<li class="nav-link active"><h3>영상 소개</h3></li>
						<li class="nav-link active"><h3>영상 추가</h3></li>
			</ul>
				<div class="col-sm-6 col-el-8">
		<form:form action="ClassIntroduceInsertForm" method="post">
	
	
			<div class="input-group">
				<h1>강의 소개 </h1>
			</div>
	
			<div class="form-group">
				<h3>강의 제목을 입력해주세요</h3>
				<input type="text" class="form-control" name="class_title" placeholder="제목을 입력해주세요.">
			</div>
	
			<div class="form-group">
				<h3>강사명</h3>
				<input type="text" class="form-control" name="class_author">
			</div>
			
			<div class="input-group">
				<h3>실시간 여부</h3>
				<input type="text" class="form-control" name="class_live" placeholder="Y or N 입력해주세요." >
			</div>
			
			<div class="form-group">
				<h3>가격</h3>
				<input type="text" class="form-control" name="class_price" placeholder="숫자만 입력해주세요." >
			</div>
			
			<div class="input-group col-xs-4">
				<h3>수강 대상</h3>
				<select name="class_studentlevel" class="alert alert-success">
					<option value="초급자">초급자</option>
					<option value="중급자">중급자</option>
					<option value="상급자">상급자</option>
				</select>
			</div>
			
			<div class="input-group col-xs-4">
				<h3>카테고리</h3>
				<select name="class_category" class="alert alert-success ">
					<option value="JAVA">JAVA</option>
					<option value="JSP/Servlet">JSP/Servlet</option>
					<option value="Spring Framework">Spring Framework</option>
					<option value="DB">DB</option>
					<option value="UI">UI</option>
				</select>
			</div>
			
			<div class="form-group">
				<h3>강좌 소개</h3>
				<textarea name="class_intro" class="form-control" rows="5" cols="10" placeholder="강좌에 대해서 설명해주세요."></textarea>
			</div>
			
			<div class="form-group">
				<input type="submit" class="add_field_button btn btn-success btn-md" value="다음"> 
				<input type="button" class="add_field_button btn btn-success btn-md" onclick="location.href='LectureList'" value="취소">
			</div>
		</form:form>
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
	

	<script type="text/javascript"
		src="resources/js/template/jquery.1.11.1.js"></script>
	<!-- 라이브러리 충돌해결 -->
	<script>
		var jb = jQuery.noConflict();
	</script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript"
		src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript"
		src="resources/js/template/contact_me.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
	
</body>

</html>