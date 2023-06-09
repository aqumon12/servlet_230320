<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.common.MysqlService" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자들</title>
</head>
<body>
<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	String selectQuery = "select * from `user`";
	ResultSet res =  ms.select(selectQuery);
%>

	<h1>사용자들</h1>
	<table border=1>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>자기소개</th>
				<th>이메일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%
			while (res.next()) {
		%>
			<tr>
				<td><%= res.getInt("id") %></td>
				<td><%= res.getString("name") %></td>
				<td><%= res.getString("yyyymmdd") %></td>
				<td><%= res.getString("introduce") %></td>
				<td><%= res.getString("email") %></td>
				<td><a href="/lesson04/ex02_delete?id=<%= res.getInt("id") %>">삭제하기</a></td>
			</tr>
			
		<%
			}
		%>	
		</tbody>	
	</table>
<%
	// DB 연결 해제
	ms.disconnect();
%>	
</body>
</html>