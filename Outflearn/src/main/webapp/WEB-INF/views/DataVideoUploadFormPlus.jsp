<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<!-- Favicons ================================================== -->
	<link rel="shortcut icon" href="resources/img/favicon.ico" type="image/x-icon">
	<link rel="apple-touch-icon" href="resources/img/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="resources/img/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="resources/img/apple-touch-icon-114x114.png">

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
	<link href="/your-path-to-fontawesome/css/fontawesome.css" rel="stylesheet">
	<link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
	<link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/27cb20e940.js"></script>
<!-- ======================================================jQuery -->
<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
<script type="text/javascript">
      
// 직접 파일 업로드 
          function SelfDataVideoUpload() {
          	
          	 	var url = "SelfDataVideoUpload"

          	 window.open(url, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400");

          }

//		    작성 버튼 눌렀을시 추가 사항이 있는지 알람
          function clearalert(){
        		alert("추가 작성 없을시 '게시판 넘기기' 클릭");
        	}
       
           
</script>>
</head>
<body>
	<!-- ==========================================Navigation==========================================-->
	<nav id="menu" class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top" style="color: #6372ff">Outflearn</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-center">
					<li><a href="LectureList">강좌 둘러보기</a></li>
					<li><a href="void:0">로드맵 학습</a></li>
					<li><a href="void:0">아웃프런 소개</a></li>
					<li><a href="void:0">라이브</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="void:0" class="dropdown-toggle" data-toggle="dropdown"><i
								class="far fa-user" style="color: #6372ff"></i>
							<div class="dropdown-menu" role="menu" aria-expanded="navbarDropdown">
								<a href="void:0">로그아웃</a>
							</div>
						</a></li>
					<li><a href="/Outflearn/login">로그인</a></li>
					<li><a href="void:0">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>

<br/><br/><br/>
	
	<div class="form-group">
		<h1>영상 소개</h1>
	</div>
		
	<div class="row">
			<ul id="side_border" class="nav flex-column col-sm-2 col-el-2 text-center">
				<li class="nav-link active"><h3>강의 소개</h3></li>
				<li class="nav-link active"><h3>영상 소개</h3></li>
				<li class="list-group-item-success"><h3>영상 추가</h3></li>
			</ul>
	<div class="col-sm-6 col-el-8">
		<form:form action="DataVideoUploadPlus" method="post" onsubmit="return clearalert();" >
		 
		
		<div class="form-group">
			<h3>과정 제목</h3>
			<input type="text" name="data_title" class="form-control" placeholder="${classdata.data_title }">
		</div>
		
		<div class="form-group">
			<h3>과정 순서</h3>
			<input type="text" name="data_sq" class="form-control">
		</div>
	
		<div class="form-group">	
			<h3>영상 링크 </h3>         
            <input type="text" name="data_data" class="form-control" placeholder="${classdata.data_data }"/>
       	</div>
		
		
		<div class="form-group">
			<input type="button" value="게시판 넘기기 " onclick="location.href='LectureList'"> 
			<input type="submit" value="작성 후 클릭" />
			<input type="button" value="추가" onclick="location.href='DataVideoUploadFormPlus'" />
			<input type="button" value="직접 영상 올리기" onclick="SelfDataVideoUpload()" />
			<input type="button" value="뒤로" onclick="location.href='BackDataVideoUploadForm'" />
		</div>

	</form:form>
	</div></div>
	
		
	<!-- Footer Section -->
	<div id="footer">
		<div class="container text-center">
			<p>
				Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
			</p>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
</body>
</html>