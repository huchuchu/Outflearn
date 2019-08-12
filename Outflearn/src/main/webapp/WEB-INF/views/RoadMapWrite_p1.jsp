<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <p>로드맵 작성하기</p>
  <input type="button" value="다음으로" onclick="document.getElementById('roadMapForm').submit();" >
  
  <form action="" method="post" id="roadMapForm">
	  <input type="text" name="title">  
	  <select>
	  	<option>카테고리</option>
	  	<option value="1">IT프로그래밍</option>
	  	<option value="2">크리에티브</option>
	  	<option value="3">비즈니스</option>  
	  	<option value="4">마케팅</option>
	  </select>
	  
	    <div id="summernote"></div>
    
   </form> 
    <script>
      $('#summernote').summernote({

        tabsize: 2,
        height: 100
      });
    </script>
  </body>
</html>
