<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길이 변환</title>
</head>
<body>
	<%
		int length = Integer.valueOf(request.getParameter("length"));
		String[] unitArr = request.getParameterValues("unit");
	%>
	<div class="container">
		<h1>길이 변환 결과</h1>
		<h3><%= length %>cm</h3>
		<hr>
		
		<h2>
			<%
				if (unitArr != null) {
					for (String unit : unitArr) {
						if (unit.equals("inch")) {
							double inch = length * 0.393701;
							out.print(inch + "in<br>");
						} else if (unit.equals("yard")) {
							double yard = length * 0.0109361;
							out.print(yard + "yd<br>");
						} else if (unit.equals("feet")) {
							double feet = length * 0.032808;
							out.print(feet + "ft<br>");
						} else if (unit.equals("meter")) {
							double meter = length * 0.01;
							out.print(meter + "m<br>");
						}
					}
				}
			%>
		</h2>
	</div>
</body>
</html>