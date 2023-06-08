package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	// field
	private static MysqlService mysqlService = null;
	
	// 도메인 뒤에 접속할 데이터베이스명까지 넣는다.
	private String url = "jdbc:mysql://localhost:3306/test_230320";
	private String id = "root";
	private String pw = "root";
	
	private Connection conn;
	private Statement statement;
	private ResultSet res;
	
	// method
	
	// 디자인패턴
	// Singleton 패턴:  MysqlService라는 객체가 단 하나만 생성될 수있도록 하는디자인 패턴
	public static MysqlService getInstance() {
		if (mysqlService == null) {
			mysqlService = new MysqlService();
		}
		return mysqlService;
	}
	
	// DB 접속 - JDBC 연결
	public void connect() {
		try {
			// 1. 드라이버 메모리 로딩
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			// 2. DB 연결(DB Connection)
			conn = DriverManager.getConnection(url, id, pw);
			
			// 3. statement: DB와 연결해서 쿼리를 실행하기 위한 준비
			statement = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 연결 해제
	public void disconnect() {
		try {
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// R: select
	public ResultSet select(String query) throws SQLException {
		res = statement.executeQuery(query);
		return res;
	}
	
	// CUD: insert, update, delete
	public void update(String query) throws SQLException {
		statement.executeUpdate(query);
		
	}
	
}
