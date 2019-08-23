<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Outflearn</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="resources/css/LectureList.css">

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
top: 45%;
text-align:center; 
width: 20%;
}

.like, .link_share, .kakao_share{
float: left;


}

.link_share{
margin-left:  8%;
}

.enroll{
width: 100%;
height: 95px;
margin-top: 1rem;
border-radius: 4px;
border: 1px solid;
background-color: #fff;
color: skyblue;
font-weight: 800;
font-size: 18px;
align-items: center;
cursor: pointer;

}
.provider_card{
width: 100%;
height: 95px;
border: 1px solid;
text-align: center;
margin-top: 5%;
font-size: 18px;
text-align: center;
}

.social_buttons{
margin-top: 5%;
}


</style>




</head>
<body>	
<!-- Header  -->
<jsp:include page="../header/MainHeader.jsp"></jsp:include>
<!-- Header  -->
<input type="hidden" id="userNum" value="${roadMap.user_num }">
<input type="hidden" id="roamdMapNum" value="${roadMap.roadmap_num }">
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
					<i class="fas fa-share-alt"></i>
					<span class="social_cnt">${roadMap.roadmap_share }</span>				
				</span>
			</div>
			<div class="meta_info">
				<p class="info">포함된 강좌 수 : <c:out value="${fn:length(resList) }"/>  </p>			
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

				<button type="button" class="enroll" onclick="roadmap_join();">
					<i class="far fa-plus"></i>
					 로드맵 참여하기
				</button>

				<div class="provider_card">
					<div class="profiles"></div>
					<div class="author">
						<div class="author">
							<span class="author_label">만든사람</span>
							<span class="author_name"><b>${roadMap.user_num }</b></span>
						</div>
					</div>
					<div class="another">
					<a href="void:0" class="other_roadmap">
						다른 로드맵 <i class="fas fa-chevron-right"></i>
					</a>
					</div>
			     	</div>
					<div class="social_buttons" >
						<div class="shares">
							<button type="button" class="link_share" data-clipboard-text="${URL }">
							<i class="fas fa-share-alt"></i>
							</button>
							<button type="button" class="kakao_share" >
							<i class="fas fa-comment"></i>
							</button>
					</div>
					</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8" id="classDetail">
		<table>
		
		<tr>
		<c:forEach items="${conList }" var="conDto">
		<td>
			<div class="roadmap_card">
				<div class="number_wrap">
					<span class="wrap">
						<span class="num">${conDto.roadmap_cue}</span>
					</span>
				</div>
		</td>		
				<c:forEach items="${resList }" var="resDto">
				<c:if test="${resDto.class_num eq conDto.class_num }">
		<td>
				<div class="card_block">
					<div class="card">
							<a href="LectureDetail?class_num=${resDto.class_num }"> 
							<img class="card-img-top" src="${pageContext.request.contextPath }/resources/uploadImage/${ resDto.class_img }" alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">${resDto.class_title }</h5>
									<p class="card-text">${resDto.class_intro }</p>
								</div>
							</a>
					</div>
					</div>
		</td>
		<td>			
					<div class="card_detail">
						<ul class="roadmap_tag">
						<span>테그1</span>
						<span>테그2</span>
						<span>테그3</span>
						</ul>
						<div class="desc">
							<p class="desc_summary">
							강의에 대한 내용 강의에 대한 내용 강의에 대한 내용 강의에 대한 내용 
							강의에 대한 내용 강의에 대한 내용 강의에 대한 내용 강의에 대한 내용 
							강의에 대한 내용 강의에 대한 내용 강의에 대한 내용 강의에 대한 내용 
							강의에 대한 내용 강의에 대한 내용 강의에 대한 내용 강의에 대한 내용 
							</p>

						</div>
					
					</div>
				</td>	
				</c:if>
				</c:forEach>	
				</div>
				</tr>	
				</c:forEach>
				
			</table>
			</div>			
		</div>

	</div>
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
</div>

<script type="text/javascript"> 
 $(function(){
	
 	$('.link_share').click(function(){
	
 		var URL = window.location.href;
		
 		var clip = new ClipboardJS('.link_share');
		
 		clip.on('success', function(e){
 			alert("복사완료");
 			
 		});
 		clip.on('error',function(e){
 			alert("복사실패");
 		});
		
 	});
 })


function roadmap_join(){
	var roadNum = $("#roamdMapNum").val();
	var userNum = $("#userNum").val();
	
	alert(roadNum); alert(userNum);
	
	var param = {roadnum : roadNum, usernum : userNum}
	
	$.ajax({
		url: "roadMapJoin",
		type: "POST",
		data:param,
		success:function(){
			alert("성공");
		},
		error:function(){
			
		}
		
	});
	
}
 

</script>


<script type="text/javascript" src="resources/js/template/LectureList.js"></script>
<!-- clipBoard -->
<script src="resources/js/clipboard/dist/clipboard.min.js"></script>

<!--footer  -->
<jsp:include page="../footer/Footer.jsp"></jsp:include>
</body>
</html>