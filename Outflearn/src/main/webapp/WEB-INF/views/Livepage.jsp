<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Outflearn</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Outflearn</title>

	<!-- Favicons
              ================================================== -->
	<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
	<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">

	<!-- Stylesheet
              ================================================== -->
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

	<!-- css -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<!-- fullcalendar -->

<link href='resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='resources/fullcalendar/timegrid/main.css' rel='stylesheet' />

<script src='resources/fullcalendar/core/main.js'></script>
<script src='resources/fullcalendar/daygrid/main.js'></script>
<script src='resources/fullcalendar/timegrid/main.js'></script>

<link href='resources/fullcalendar/tooltip/tooltip.css' rel='stylesheet'/>
<script src='resources/fullcalendar/tooltip/popper.js'></script>
<script src='resources/fullcalendar/tooltip/tooltip.js'></script>

<script src='resources/fullcalendar/liveCalendar.js'></script>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<!--Slide Show-->
	<div class="container">
		<div class="page-header">
			<h1 class="float-left">방송</h1>
			<h3 class="m-0">
				<span class="label bg-danger">LIVE</span>
				<a href="Broadcast"><span class="label bg-danger">TESTLIVE</span></a>
			</h3>
		</div>
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="resources/img/cardpx.svg" alt="trash" style="height: 200px;">
				</div>
				<div class="carousel-item">
					<img src="resources/img/cardpx.svg" alt="trash" style="width: 50%; height: 200px;"
						class="float-left"> <img src="resources/img/cardpx.svg" alt="trash"
						style="width: 50%; height: 200px;" class="float-left">
				</div>
				<div class="carousel-item">
					<img src="resources/img/cardpx.svg" alt="trash" style="height: 200px;">
				</div>
				<div class="carousel-item">
					<img src="resources/img/cardpx.svg" alt="trash" style="height: 200px;">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>

		</div>
		<!--End off row-->
	</div>

	<div class="container">
		<div class="page-header">
			<h1>방송 스케줄</h1>
		</div>

		<div id='calendar'></div>

		<!-- <div class="table-responsive-lg">
			<table class="table">
				<tr class="text-center">
					<th>일요일</th>
					<th>월요일</th>
					<th>화요일</th>
					<th>수요일</th>
					<th>목요일</th>
					<th>금요일</th>
					<th>토요일</th>
				</tr>
				<tr>
					<td>1</td>
				</tr>
				<tr>
					<td>8</td>
				</tr>
			</table>
		</div> -->
	</div>


	<jsp:include page="footer/Footer.jsp"></jsp:include>

	<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/template/nivo-lightbox.js"></script>
	<script type="text/javascript" src="resources/js/template/jqBootstrapValidation.js"></script>
	<script type="text/javascript" src="resources/js/template/contact_me.js"></script>
	<script type="text/javascript" src="resources/js/template/main.js"></script>
</body>

</html>