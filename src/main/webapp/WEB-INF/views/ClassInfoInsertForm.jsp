<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>기본 정보 입력</h1>
   
   <form action="DataVideoUploadForm" method="post">
      <table border="1" >
         <tr>
            <th>제목</th>
            <td><input type="text" name="class_title"></td>
         </tr>
         <tr>
            <th>강사명</th>
            <td><input type="text" name="class_author"></td>
         </tr>
         <tr>
            <th>강좌소개</th>
            <td><input type="text" name="class_intro"></td>
         </tr>
         <tr>
            <th>과정평가</th>
            <td><input type="text" name="class_rating"></td>
         </tr>
         <tr>
            <th>가격</th>
            <td><input type="text" name="class_price" placeholder="0" required="required"></td>
         </tr>
         <tr>
            <th>수강대상</th>
            <td>
               <select name="class_studentlevel">
                  <option value="초급자">초급자</option>
                  <option value="중급자">중급자</option>
                  <option value="상급자">상급자</option>
               </select>
            </td>
         </tr>
         <tr>
            <th>카테고리</th>
            <td>
               <select name="class_category">
                  <option value="카테고리1">카테고리1</option>
                  <option value="카테고리2">카테고리2</option>
                  <option value="카테고리3">카테고리3</option>
               </select>
            </td>
         </tr>
         <tr>
            <td colspan="2" align="right">
            <input type="submit" value="다음" >
            <input type="button" onclick="location.href='insert.do'" value="취소"> 
         </tr>
      </table>
   </form>
   
</body>
</html>