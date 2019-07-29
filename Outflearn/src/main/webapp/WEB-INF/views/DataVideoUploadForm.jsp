<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body>

	<form action="DataVideoUpload" method="post">
		<table border="1">
			<tr>
				<th>소제목</th>
				<td><input type="text" name="data_subhead"></td>
			</tr>
			<tr>
				<th>과정순서</th>
				<td><input type="text" name="data_sq"></td>
			</tr>
			<tr>
				<th>과정제목</th>
				<td><input type="text" name="data_title"></td>
			</tr>
			<tr>
				<th>영상 링크</th>
				<td><input type="text" name="data_data"></td>
			</tr>
			<tr>
				<td colspan="3" align="right"><input type="submit" value="전송" />
					<input type="button" value="취소"
					onclick="location.href='history.back();'" /></td>
			</tr>
		</table>
	</form>
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
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript"
		src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript"
		src="resources/js/template/contact_me.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
</body>

</body>
</html>