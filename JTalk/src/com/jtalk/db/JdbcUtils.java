package com.jtalk.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class JdbcUtils {
	public static Connection getConnection() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost/jtalk?autoReconnect=true&useSSL=false&useUnicode=yes&amp;characterEncoding=UTF-8";
		String user = "jtalk";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
