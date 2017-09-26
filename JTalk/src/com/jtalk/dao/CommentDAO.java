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
	public int insertComment(CommentDTO comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into comment(tableName, postNum, writerId, writerName, content) values(?, ?, ?, ?, ?)";
		int result = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment.getTableName());
			pstmt.setInt(2, comment.getPostNum());
			pstmt.setString(3, comment.getWriterId());
			pstmt.setString(4, comment.getWriterName());
			pstmt.setString(5, comment.getContent());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
		return result;
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
	public int modifyComment(String content, int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update comment set content = ?, writeDate = current_timestamp where num = ?";
		int result = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
		return result;
	}
	
	//댓글 삭제
	public int deleteComment(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from comment where num = ?";
		int result = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
		
		return result;
	}
	
	//글 삭제로 인한 댓글 삭제
	public void postDeleteComment(String tableName, int postNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from comment where tableName = ? and postNum = ?";
		
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
	
	//댓글의 갯수
	public int countComment(String tableName, int postNum) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from comment where tableName = ? and postNum = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tableName);
			pstmt.setInt(2, postNum);
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
	
	//댓글 번호로 글 번호 가져오기
	public int getPostNum(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select postNum from comment where num = ?";
		int postNum = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				postNum = rs.getInt("postNum");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		return postNum;
	}
	
	//댓글의 num 최대 번호 가져오기
	public int getMaxNum(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(num) from comment";
		int num = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		return num;
	}
}
