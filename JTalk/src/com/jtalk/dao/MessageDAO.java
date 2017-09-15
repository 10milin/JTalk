package com.jtalk.dao;

import com.jtalk.dto.MessageDTO;
import java.sql.*;
import java.util.ArrayList;

import static com.jtalk.db.JdbcUtils.*;

public class MessageDAO {
	private MessageDAO() {}
	
	private static MessageDAO instance = new MessageDAO();
	
	public static MessageDAO getInstance() {
		return instance;
	}
	
	//메시지 전송
	public void sendMessage(MessageDTO message) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into message(title, content, sendId, sendName, receiveId) values (?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getTitle());
			pstmt.setString(2, message.getContent());
			pstmt.setString(3, message.getSendId());
			pstmt.setString(4, message.getSendName());
			pstmt.setString(5, message.getReceiveId());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//회원 한명의 읽지 않은 수신 메시지
	public ArrayList<MessageDTO> getNotReadMessage(String email) {
		ArrayList<MessageDTO> messageList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from message where receiveId = ? and readMessage = 0";
		
		try {
			messageList = new ArrayList<MessageDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				messageList.add(new MessageDTO(rs.getInt("num"),
												rs.getString("title"),
												rs.getString("content"),
												rs.getString("sendId"),
												rs.getString("sendName"),
												rs.getString("receiveId"),
												rs.getTimestamp("writeDate"),
												rs.getString("readMessage")));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return messageList;
	}
	
	//회원 한명의 모든 수신 메시지
	public ArrayList<MessageDTO> getAllMessage(String email) {
		ArrayList<MessageDTO> messageList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from message where receiveId = ?";
		
		try {
			messageList = new ArrayList<MessageDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				messageList.add(new MessageDTO(rs.getInt("num"),
												rs.getString("title"),
												rs.getString("content"),
												rs.getString("sendId"),
												rs.getString("sendName"),
												rs.getString("receiveId"),
												rs.getTimestamp("writeDate"),
												rs.getString("readMessage")));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return messageList;
	}
	
	//메시지 확인
	public MessageDTO getOneMessage(int num) {
		MessageDTO message = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from message where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				message = new MessageDTO(rs.getInt("num"),
										rs.getString("title"),
										rs.getString("content"),
										rs.getString("sendId"),
										rs.getString("sendName"),
										rs.getString("receiveId"),
										rs.getTimestamp("writeDate"),
										rs.getString("readMessage"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return message;
	}
	
	//메시지 읽음
	public void readMessage(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update message set readMessage = 1 where num = ?";
		
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
	
	//메시지 삭제
	public void deleteMessage(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from message where num = ?";
		
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
