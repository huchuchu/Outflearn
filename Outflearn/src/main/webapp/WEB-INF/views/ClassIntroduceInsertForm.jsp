<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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

<!-- 써머노트 -->
<!-- include libraries(jQuery, bootstrap) --> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 


<!-- include summernote css/js--> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

<script type="text/javascript">
$(function() {
	  $('#summernote').summernote({
		width : 1000,
	    height: 500,
	    lang: 'ko-KR' // 언어 세팅
	  });
	});
</script>

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
	
	
	<div class="row">
			<ul id="side_border" class="nav flex-column col-sm-2 col-el-2 text-center">
						<li class="nav-link active"><h3>강의 소개</h3></li>
						<li class="list-group-item-success"><h3>강의 내용</h3></li>
						<li class="nav-link active"><h3>영상 소개</h3></li>
						<li class="nav-link active"><h3>영상 추가</h3></li>
			</ul>
				<div class="col-sm-6 col-el-8">
			<form:form action="DataVideoUploadForm" method="post" enctype="multipart/form-data">
			
			<div class="input-group">
				<h1>강의 내용 </h1>
			</div>
			
			<div class="form-group">
				<textarea id="summernote" name="class_content"></textarea>
			</div>
	
			
			<div class="form-group">
				<input type="submit" class="add_field_button btn btn-success btn-md" value="다음"> 
				<input type="button" class="add_field_button btn btn-success btn-md" onclick="location.href='LectureList'" value="취소">
			</div>
	</form:form>
			</div>
			</div>
	
	
	
			
<!-- Footer Section -->
	<jsp:include page="footer/Footer.jsp"></jsp:include>
	
	<script>
		jQuery.noConflict();
	</script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript" src="resources/js/template/contact_me.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
</body>
</html>