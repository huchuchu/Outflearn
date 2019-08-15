<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" >

function addSession(){
	
	var tr = document.createElement("tr");
		
	var str = "<td>"+
			  "<input type='text' name='class_num'>"+
			  "<input type='hidden' name='class_title'>"+
			  "</td>"+
			  "<td><input type='button' value='검색'></td>"+
			  "<td><input type='button' value='삭제' ></td>"+
			  "<td><input type='button' value='드래그앤드롭'></td>"+
			  "</tr>";
			  
	tr.innerHTML=str;	
	document.getElementById("addtr").appendChild(tr);
}


function submitClassInfo(){
	
// 	var size = document.getElementsByName("class_title").length;
// 	alert(size);
// 	var res ={};
// 	for (var i=0; i<size; i++){
// 	res[i]=document.getElementsByName("class_title")[i].value;
// 	alert(res[i]);
// 	}
	
// 	alert("★★★★res= "+res);
	
// 	document.write('<form action="roadNclass" id="sub_form" method="post">'+
// 			 	   '<input type="hidden" name="res" value="'+res+'">'+
// 			  	   '</form>');

// 	document.getElementById("sub_form").submit();

//onclick="submitClassInfo()" 




}


function searchWinOpen(){
	var url="searchWingogo";
	
	window.open(url,"searchWindow" ,"width=400,height=400,left=600");
	
	
}


</script>

<body>

<input type="button" value="세션추가" onclick="addSession();" >
<br/>

<form action="roadNclass" method="post">
<input type="hidden" name="seq" value="${roadSeq }">
<table>
<tbody id="addtr">
<!-- ★★★★★나중에 class_title 하고 class_num하고 name 바꾸기!!!!!!★★★★★★ -->
<!-- 위에 스크립트도 바꿔야함!!!!꼭!!!!! -->
<tr>
<td>
<input type="text"  name="class_num">
<input type="hidden" name="class_title">
</td>
<td><input type="button" value="검색" onclick="searchWinOpen()"></td>
<td><input type="button" value="삭제" ></td>
<td><input type="button" value="드래그앤드롭"></td>
</tr>

</tbody>
</table>

<br/>
<input type="submit" value="작성하기" >
</form>

</body>
</html>