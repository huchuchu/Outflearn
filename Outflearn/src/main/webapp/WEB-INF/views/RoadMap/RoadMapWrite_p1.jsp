<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>


<style type="text/css">

.container-fluid{
margin-top: 5%;
margin-bottom: 1px;
background-color: #fff;
}

</style>


</head>
<body>
<!-- Header  -->
<jsp:include page="../header/MainHeader.jsp"></jsp:include>
<!-- Header  -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" id="top_top">
			<span>로드맵 소개하기</span> <span>강의 등록하기</span>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4" id="mid_left">
			<ul id="road_list">
<!-- 				<li style="color: #FA4B00">로드맵 소개하기</li>	<br/>	 -->
<!-- 				<li>강의 등록하기</li>	  -->
			</ul>
			<br/>

		
		</div>
		<div class="col-md-8">	
			<div id="mid_right">	
			  	 <form action="roadInsert" method="post" id="roadMapForm">
					 <!-- hidden : 사용자 번호 -->
					 <input type="hidden" name="user_num" value='<sec:authentication property="principal.user_num"/>'>
					 <div id="Mid_top" class="form-group">
					  <input type="text" name="roadmap_title" id="roadmap_title" class="form-control">  
					  <select name="main_num" class="form-control" id="main_num">
					  	<option>카테고리</option>
					  	<option value="1">서버</option>
					  	<option value="2">웹 개발</option>
					  	<option value="3">데이터베이스</option> 	  	
					  </select>
					  </div>	  
				
					  <div id="heyhey">
					    <textarea rows="" cols=""id="summernote" name="roadmap_content"></textarea>    
					  </div>
				 </form>
				  <script>
				     $('#summernote').summernote({
						width: 1000,
						height: 500,
						lang: 'ko-KR' // 언어 세팅
				     });
				   </script>
				</div> 
		</div>
	</div>
	<div class="row">
		<div class="col-md-12" >
				<button type="button" class="btn btn-primary btn-lg" onclick="document.getElementById('roadMapForm').submit();">
				Next Page
			</button>	
			</div>
	</div>
</div>
	
<!--footer  --> 
<jsp:include page="../footer/Footer.jsp"></jsp:include>
<!--footer  --> 
</body>
</html>