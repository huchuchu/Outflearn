<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<br/><br/><br/>
	<form action="ClassUpload" enctype="multipart/form-data" method="get">
	<input type="hidden"  name="${_csrf.parameterName }" value="${_csrf.token }">
	<input type="hidden"  name="data_chapter" />
	
		<div class="form-group">
			<h3>업로드 할 파일 선택</h3>
			파일 : <input type="file" name="upload_data">
		</div>
		
		<div class="form-group">
			<input type="submit" value="전송" onclick="alert('업로드가 완료되었습니다.');  window.close();" >
		</div>
	</form> 
	
	
</body>
</html>