package com.jtalk.dao;

import java.sql.*;
import java.util.ArrayList;

import com.jtalk.dto.CommentDTO;

import static com.jtalk.db.JdbcUtils.*;

public class CommentDAO {
	private CommentDAO() {}
	
	private static CommentDAO instance = new CommentDAO();
	
	public static CommentDAO getInstance() {
		return instance;
	}
	
	//댓글 작성
	public void insertComment(CommentDTO comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into comment(tableName, postNum, writerId, writerName, content) values(?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment.getTableName());
			pstmt.setInt(2, comment.getPostNum());
			pstmt.setString(3, comment.getWriterId());
			pstmt.setString(4, comment.getWriterName());
			pstmt.setString(5, comment.getContent());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//전체 댓글 확인
	public ArrayList<CommentDTO> getCommentList(String tableName, int postNum) {
		ArrayList<CommentDTO> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from comment where tableName = ? and postNum = ?";
		
		try {
			list = new ArrayList<CommentDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tableName);
			pstmt.setInt(2, postNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new CommentDTO(rs.getString("tableName"),
										rs.getInt("postNum"),
										rs.getInt("num"),
										rs.getString("writerId"),
										rs.getString("writerName"),
										rs.getString("content"),
										rs.getTimestamp("writeDate")));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	
	//댓글 수정
	public void modifyComment(String content, int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update comment set content = ?, writeDate = current_timestamp where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//댓글 삭제
	public void deleteComment(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from comment where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
}
