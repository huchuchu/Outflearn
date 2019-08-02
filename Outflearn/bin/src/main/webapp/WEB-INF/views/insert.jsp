<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/Outflearn/userjoin" method="post">
	<input type="hidden"  name="${_csrf.parameterName }" value="${_csrf.token }">
	<table>
		<tr>
			<th>id</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>pw</th>
			<td><input type="text" name="passwd"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nickname"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
		<td colspan="2">
		<input type="submit" value="join in">
		</td>
		</tr>
	</table>	
	</form>
</body>
</html>