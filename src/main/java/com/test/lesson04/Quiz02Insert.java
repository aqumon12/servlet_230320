package com.test.lesson04;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson04/quiz02_insert")
public class Quiz02Insert extends HttpServlet{

		@Override
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
			
			// 파라미터 받기
			String name = request.getParameter("name");
			String url = request.getParameter("url");
			
			// DB 연결
			MysqlService ms = MysqlService.getInstance();
			ms.connect();
			
			// INSERT
			String insertQuery = "insert into `webpage_bookmark`"
					+ "(`name`, `url`)"
					+ "values"
					+ "('" + name + "', '" + url + "')";
			try {
				ms.update(insertQuery);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			// DB 연결 해제
			ms.disconnect();
			
			// redirect
			response.sendRedirect("/lesson04/quiz02/webpageList.jsp");
			
			
		}
}
