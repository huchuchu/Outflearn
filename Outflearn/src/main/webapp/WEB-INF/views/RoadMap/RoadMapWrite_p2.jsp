<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
 
<!-- tableDnD -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="resources/js/tableDnD/jquery.tablednd.js"></script>

<style type="text/css">
.dragRow{
background-color: #6372ff;
}
</style>
</head>
<script type="text/javascript" >

var Cnt = 2;

function addSession(){
	alert("cnt="+Cnt);
	
	var res = Cnt-1;
	var Chk = document.getElementById("real"+res).value;
	
	if(Chk == null || Chk == ""){
		alert("이전 항목을 채워주새요");
		
		return false;
	}
	
	
	var tr = document.createElement("tr");
		
	var str = "<td>"+
			  "<input type='text' name='class_title' id='real"+Cnt+"'>"+
			  "<input type='text' name='class_num' id= 'test"+Cnt+"'>"+
			  "</td>"+
			  "<td><input type='button' value='검색' onclick='searchClass(this.id)' id="+Cnt+"></td>"+
			  "<td><input type='button' value='삭제' onclick='deleteLine(this)' ></td>"+
			  "<td><input type='button' value='드래그앤드롭'></td>"+
			  "</tr>";
			  
	tr.innerHTML=str;	
	document.getElementById("addtr").appendChild(tr);
	$("#classInfoTable").tableDnD({
		onDragClass:"dragRow"
		
		
	});
	Cnt +=1;
}
</script>


<body>



<input type="button" value="세션추가" id="taget" onclick="addSession(this);" >
<br/>

<form action="roadNclass" method="post">
<input type="text" name="seq" value="${roadSeq }">
<table id="classInfoTable" border="1">
<tbody id="addtr">
<!-- ★★★★★나중에 class_title 하고 class_num하고 name 바꾸기!!!!!!★★★★★★ -->
<!-- 위에 스크립트도 바꿔야함!!!!꼭!!!!! -->
<!-- 08.17 바꿈! -->
<tr>
<td>
<input type="text"  name="class_title" id="real1" readonly="readonly">
<input type="text" name="class_num" id="test1" readonly="readonly">

</td>
<td><input type="button" value="검색" onclick="searchClass(this.id)" id="1" ></td>
<td><input type="button" value="삭제" onclick="deleteLine(this)"  ></td>
<td><input type="button" value="드래그앤드롭"></td>
</tr>

</tbody>
</table>

<br/>
<input type="submit" value="작성하기" >
</form>



<input type="button" value="로드맵1p 수정하기">

<script type="text/javascript">

function searchClass(btnId){
	
	var url="searchWingogo";
	window.name = "parentForm";//부모창 이름
	//window.open("open할 윈도우","자식창 이름","팝업창 옵션");
	window.open(url+"?btnIdVal="+btnId,"searchWindow" ,"width=400,height=400,left=600");
	
}

function deleteLine(obj){

	var tr = $(obj).parent().parent();	
	tr.remove();	
	
}


</script>



<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
<script type="text/javascript" src="resources/js/template/bootstrap.js"></script>
</body>
</html>