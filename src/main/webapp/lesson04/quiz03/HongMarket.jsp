<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍당무마켓</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<style>
	header {height: 100px; background-color: #FF8000; color: #FFF;}
	nav {height: 80px; background-color: #FF8000;}
	.content {height: 600px;}
	footer {height: 100px;}
	.nav-link {color: white; font-weight: bold; font-size:20px;}
	.nav-link:hover {color: #FA5882;}
	.border {border-color: #FF8000;}
	.media-parent-box {gap:5px 10px; padding-top:10px;} /* 상자 사이 간격   상하 5px/좌우 10px */
	.media-box {width:300px;}
</style>
</head>
<body>
<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	String selectQuery = "select seller.*, used_goods.*	from seller	join used_goods	on seller.id = used_goods.sellerId";
	ResultSet res = ms.select(selectQuery);
%>

	<div id="wrap" class="container">
		<header class="d-flex justify-content-center align-items-center">
			<h1 class="font-weight-bold">HONG당무 마켓</h1>
		</header>	
		<nav class="d-flex justify-content-center align-items-center">
			<ul class="nav nav-fill w-100">
				<li class="nav-item"><a href="#" class="nav-link">리스트</a></li>
				<li class="nav-item"><a href="#" class="nav-link">물건 올리기</a></li>
				<li class="nav-item"><a href="#" class="nav-link">마이 페이지</a></li>
			</ul>
		</nav>
		<section class="content bg-dark">
			<div class="media-parent-box d-flex flex-wrap justify-content-between">
			<%
				while (res.next()) {
				
			%>
				<article class="media-box border p-5">
					<img src="<%= res.getString("pictureUrl") %>" alt="이미지" width="300" height="200">
					<div><%= res.getString("title") %></div>
					<div><%= res.getString("price") %></div>
					<div><%= res.getString("nickname") %></div>
				</article>						
			<%
				}
			%>	
			</div>
		
		</section>
		<footer class="bg-primary"></footer>
	</div>
	
	
</body>
</html>