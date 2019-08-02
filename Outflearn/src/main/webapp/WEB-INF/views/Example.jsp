<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://jquery.com/download/https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


//  과정추가  클릭시 체크박스랑 텍스트창이 나온다
$(function() {
   $('#uploadplus')
        .click(
           function() {
              var cooking_no = $('#cooking_no').val();
              var nothingtext = document.getElementById("cooking_no").value;
              if (nothingtext == null || nothingtext == "") {
                 alert("과정을 입력해주세요!!");
                 
                 
                 return false;
              }
              
              $('#result2')
              .append(
                    "<div><input type='checkbox' name='chk2' checked='checked' onclick='allcancel2();'/>"
                    +"<input type='text' name='cooking_no' id='cooking_no' style='width: 350px;'/></div>");

               });

});
</script>
<body>
	
	<div>
                     <input type="checkbox" name="all2" onclick="allChk2(this.checked)" checked='checked' id=""> 
                     <input type="text" name="cooking_no" id="cooking_no" style="width: 67%;"  onkeydown="return captureReturnKey(event)"/> 
                     <input type="button" id="uploadplus" value="과정 추가" style="width: 27%; height: 27px;" onclick="return nothingtext()"> 
                     <input type="button" id="uploadsubtract" onclick="chkdelete2();" value="과정 삭제">
                  </div>
                  
                  <div id="result2" style="width: 1500px;">
                      
                  </div>
	
</body>
<script type="text/javascript" src="resources/js/template/jquery.1.11.1.js"></script>
</html>