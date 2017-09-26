package com.jtalk.dao;

import java.sql.*;
import static com.jtalk.db.JdbcUtils.*;

public class AwesomeDAO {
	private AwesomeDAO() {}
	
	private static AwesomeDAO instance = new AwesomeDAO();
	
	public static AwesomeDAO getInstance() {
		return instance;
	}
	
	//좋아요 등록
	public void insertLike(int postNum, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into awesome values(?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//좋아요 취소
	public void deleteLike(int postNum, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from awesome where postNum = ? and email = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//좋아요의 갯수
	public int getLikeCount(int postNum) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from awesome where postNum = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		return count;
	}
}
