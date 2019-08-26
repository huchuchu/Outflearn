<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Outflearn</title>
<style type="text/css">
.container-fluid{
margin-top: 4%;

}

header{
background-color:pink;
text-align: center;
padding-top: 2%;

}
.inner_Wrapper, .social_cnts, .meta_info{
padding-bottom: 2%;

}
.roadMapInfo{
text-align: center;
background-color: orange;
}

.floating_card{ 
position: fixed; 
right: 17%; 
top: 30%;
/* margin-right: -720px;  */
text-align:center; 
/* width: 120px;  */
border: 1px solid;
padding: 10px;

}

.like, .link_share, .kakao_share{
float: left;
}

.link_share{
margin-left:  1%;
}



</style>

</head>
<body>	
<!-- Header  -->
<jsp:include page="../header/MainHeader.jsp"></jsp:include>
<!-- Header  -->

<div class="container-fluid">
	<div class="row">
		<header class="roadmap_detail_header">
			<div class="inner_Wrapper">
				<h1>
				${roadMap.roadmap_title }
				</h1>
			</div>
			<div class="social_cnts">
				<span class="cnt">
					<i class="fas fa-user"></i>
					<span class="social_cnt">${roadMap.roadmap_subscribe }</span>&nbsp;&nbsp;				
				</span>
				<span class="cnt">
					<i class="fas fa-heart"></i>
					<span class="social_cnt">${roadMap.roadmap_like }</span>&nbsp;&nbsp;				
				</span>
				<span class="cnt">
					<i class="fas fa-share-alt"></i>
					<span class="social_cnt">${roadMap.roadmap_share }</span>				
				</span>
			</div>
			<div class="meta_info">
				<p class="info">포함된 강좌 수 : </p>			
			</div>
		</header>
	</div>
	<div class="row">
		<div class="col-md-8" >
			<div class="roadMapInfo">
			${roadMap.roadmap_content }	
			</div>
		</div>
		<div class="col-md-4">
			<div class="floating_card"> 
				<button type="button" class="enroll">
					<i class="far ra-plus"></i>
					 로드맵 참여하기
				</button>
				<div class="provider_card">
					<div class="profiles"></div>
					<div class="author">
						<div class="author">
							<span class="author_label">만든사람</span>
							<span class="author_name">${roadMap.user_num }</span>
						</div>
					</div>
					<a href="void:0" class="other_roadmap">
						다른 로드맵 <i class="fas fa-chevron-right"></i>
					</a>
					<div class="social_buttons">
						<button type="button" class="like">
						<i class="fas fa-heart"></i>
						</button>
						<div class="shares">
							<button type="button" class="link_share">
							<i class="fas fa-share-alt"></i>
							</button>
							<button type="button" class="kakao_share">
							<i class="fas fa-comment"></i>
							</button>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8">
			<h2>
				Heading
			</h2>
			<p>
				Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
			</p>
			<p>
				<a class="btn" href="#">View details »</a>
			</p>
		</div>
		<div class="col-md-4">
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
</div>









<!--footer  -->
<jsp:include page="../footer/Footer.jsp"></jsp:include>
</body>
</html>