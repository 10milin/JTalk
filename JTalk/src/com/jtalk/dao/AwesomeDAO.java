package com.jtalk.dao;

import java.sql.*;
import java.util.ArrayList;

import static com.jtalk.db.JdbcUtils.*;

public class AwesomeDAO {
	private AwesomeDAO() {}
	
	private static AwesomeDAO instance = new AwesomeDAO();
	
	public static AwesomeDAO getInstance() {
		return instance;
	}
	
	//좋아요 등록
	public int insertLike(int postNum, String email) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into awesome values(?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, email);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
		
		return result;
	}
	
	public boolean checkLike(int postNum, String email) {
		boolean check = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from awesome where postNum = ? and email = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return check;
	}
	
	//좋아요 취소
	public int deleteLike(int postNum, String email) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from awesome where postNum = ? and email = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			pstmt.setString(2, email);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
		
		return result;
	}
	
	//좋아요 갯수
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
