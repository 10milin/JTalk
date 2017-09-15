package com.jtalk.dao;

import java.sql.*;
import java.util.ArrayList;

import com.jtalk.dto.NewCommentDTO;

import static com.jtalk.db.JdbcUtils.*;

public class NewCommentDAO {
	private NewCommentDAO() {}
	
	private static NewCommentDAO instance = new NewCommentDAO();
	
	public static NewCommentDAO getInstance() {
		return instance;
	}
	
	//새로운 글 작성시 값 생성
	public void insertNew(String tableName, int postNum, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into newComment(tableName, postNum, email) values(?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tableName);
			pstmt.setInt(2, postNum);
			pstmt.setString(3, email);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//새 댓글 등록시 갱신
	public void updateNew(String tableName, int postNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update newComment set newCount = newCount + 1 where tableName = ? and postNum = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tableName);
			pstmt.setInt(2, postNum);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//글 확인으로 인한 새 댓글 리셋
	public void resetNew(String tableName, int postNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update newComment set newCount = 0 where tableName = ? and postNum = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tableName);
			pstmt.setInt(2, postNum);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//모두 확인으로 인한 새 댓글수 리셋
	public void resetAll(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update newComment set newCount = 0 where email = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//사용자의 전체 새 댓글 수
	public int getAllNew(String email) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select newCount from newComment where email = ? and newCount != 0";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count += rs.getInt("newCount");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		return count;
	}
	
	//사용자의 개별 새 댓글
	public ArrayList<NewCommentDTO> getOneNew(String email) {
		ArrayList<NewCommentDTO> newList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from newComment where email = ? and newCount != 0";
		
		try {
			newList = new ArrayList<NewCommentDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				newList.add(new NewCommentDTO(rs.getString("tableName"),
											rs.getInt("postNum"),
											rs.getString("email"),
											rs.getInt("newCount")));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return newList;
	}
	
	//글 삭제시 리스트 삭제
	public void deleteNew(String tableName, int postNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from newComment where tableName = ? and postNum = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tableName);
			pstmt.setInt(2, postNum);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
}
