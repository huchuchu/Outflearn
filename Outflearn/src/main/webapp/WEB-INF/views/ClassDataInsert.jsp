<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
      $('#summernote').summernote({
         height : 400

      });
   });
</script>



<body>
	
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<table border="1" >
			<tr>
				<th>강의 번호</th>
				<td><input type="text" name="class_num" style="width:100%"></td>
			</tr>
			<tr>
				<th>소제목</th>
				<td><input type="text" name="dto.data_subhead" style="width:100%"></td>
			</tr>
			<tr>
				<th>강의 순서</th>
				<td><input type="text" name="data_sq" style="width:100%"></td>
			</tr>
			<tr>
				<th>과정 제목</th>
				<td><input type="text" name="data_sq" style="width:100%"></td>
			</tr>
			<tr>
				<th>과정 영상</th>
				<td><input type="text" name="data_sq" id="summernote"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="작성" >
				<input type="button" onclick="location.href='history.back();'" value="취소"> 
			</tr>
		</table>
	</form>
	
</body>
</html>