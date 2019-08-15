<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Outflearn</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
  </head>

  <body>
  
  <div>
  <h1>로드맵 작성하기</h1>
  <input type="button" value="다음으로 이미지로할까~!" onclick="document.getElementById('roadMapForm').submit();" >
  </div>
   
  
  <div>
  <form action="roadInsert" method="post" id="roadMapForm">
  <input type="text" name="user_num" value='<sec:authentication property="principal.user_num"/>'>
	  <input type="text" name="roadmap_title">  
	  <select name="main_num">
	  	<option>카테고리</option>
	  	<option value="1">서버</option>
	  	<option value="2">웹 개발</option>
	  	<option value="3">데이터베이스</option>  
	  	
	  </select>	  
	    <textarea rows="" cols=""id="summernote" name="roadmap_content"></textarea>    
   </form> 
   
   </div>
    <script>
      $('#summernote').summernote({
			width: 1000,
			height: 500,
			lang: 'ko-KR' // 언어 세팅
      });
    </script>
    
  </body>
</html>
