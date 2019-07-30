<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            <th>영상 링크 </th>
            <td><input type="text" name="data_data" ></td>
         </tr>
         <tr>
            <td colspan="3" align="right"> 
               <input type="submit" value="전송"/>
               <input type="button" value="취소" onclick="location.href='history.back();'"/>
            </td>
         </tr>
      </table>
   </form>
   
</body>
</html>