<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html >
 <head> 
 <meta charset="UTF-8">
 <title>Outflearn</title>
 
 <!-- Bootstrap -->
 <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
   
 <!-- 썸머노트 -->    
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script> 
 
 <style type="text/css">
 
 .top{
 	grid-area : header;
 	background-color: LightSeaGreen ; 
 	height: 30%;
 }
 
 .leftCol{
 	grid-area : menu;
 	background-color: orange;
 }
 
 .mid{
 	grid-area : main;
 	background-color: lightblue;
 }
 
 .wapper{
 	display: grid;
	grid-template-areas:
	'header header'
	'menu main';
 	grid-gap : 10px;
 }
 
 
 
 </style>
 
 
 
 </head>
 <body>	  
 
 	<div class="wrapper">	
 	  
	 <div class="top">
		 <h1>로드맵 작성하기</h1>
		 <input type="button" value="다음페이지로->" onclick="document.getElementById('roadMapForm').submit();" >
	 </div>
	 	 
	 <div class="leftCol">
	 <ul>
	 	<li>로드맵 등록하기</li>
		<li>강의 등록하기</li>	 
	 </ul>	 
	 </div> 
	 
	 <div class="mid">
	 <form action="roadInsert" method="post" id="roadMapForm">
	 <!-- hidden : 사용자 번호 -->
	 <input type="hidden" name="user_num" value='<sec:authentication property="principal.user_num"/>'>
	  <input type="text" name="roadmap_title">  
	  <select name="main_num">
	  	<option>카테고리</option>
	  	<option value="1">서버</option>
	  	<option value="2">웹 개발</option>
	  	<option value="3">데이터베이스</option>  
	  	
	  </select>	  
<!-- 	    <textarea rows="" cols=""id="summernote" name="roadmap_content"></textarea>     -->
	  </form> 	  
	  </div>
	  
	</div>  
	  
	   <script>
	     $('#summernote').summernote({
			width: 1000,
			height: 500,
			lang: 'ko-KR' // 언어 세팅
	     });
	   </script>
 <script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
 <script type="text/javascript" src="resources/js/template/bootstrap.js"></script>   
 </body>
</html>
