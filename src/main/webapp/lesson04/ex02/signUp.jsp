<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 추가</title>
</head>
<body>
	<%-- 
		흐름1) 유저 추가: signUp.jsp(폼) 가입버튼 클릭-> Ex02Insert(서블릿, DB insert) -> userList.jsp(유저목록, DB select)
		흐름2) 유저 삭제: userList.jsp(유저목록, DB select) 삭제 클릭-> Ex02Delete(서블릿, DB delete) -> userList.jsp(유저목록, DB select)
	 --%>
	 <form method="post" action="/lesson04/ex02_insert">
	 	<p>
	 		<b>이름</b>
	 		<input type="text" name="name">
	 	</p>
	 	<p>
	 		<b>생년월일</b>
	 		<input type="text" name="yyyymmdd">
	 	</p>
	 	<p>
	 		<b>이메일</b>
	 		<input type="text" name="email">
	 	</p>
	 	<p>
	 		<b>자기소개</b><br>
	 		<textarea name="introduce" rows="5" cols="50"></textarea>
	 	</p>
	 	<input type="submit" value="추가">
	 </form>
</body>
</html>