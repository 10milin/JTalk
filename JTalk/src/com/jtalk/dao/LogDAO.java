package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;

import java.sql.*;
import java.util.ArrayList;

import com.jtalk.dto.ItDTO;
import com.jtalk.dto.LogDTO;


public class LogDAO {
	private LogDAO(){}
	
	private static LogDAO instance = new LogDAO();

	public static LogDAO getInstance() {
		return instance;
	}

	public ArrayList<LogDTO> getAllLog() {
		ArrayList<LogDTO> list = null;
		LogDTO log = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from log order by num desc";
		
		try
		{
			list = new ArrayList<LogDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				log = new LogDTO();
				log.setNum(rs.getInt("num"));
				log.setBoard(rs.getString("board"));
				log.setTitle(rs.getString("title"));
				log.setContent(rs.getString("content"));
				log.setWriterId(rs.getString("writerId"));
				log.setWriterName(rs.getString("writerName"));
				log.setDeleteId(rs.getString("deleteId"));
				log.setDeleteName(rs.getString("deleteName"));
				log.setExecuteDate(rs.getTimestamp("executeDate"));
				list.add(log);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(rs,pstmt,conn);
		}
		
		return list;
	}

	public void insertLog(LogDTO log) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into log(board, title, content, writerId, writerName, deleteId, deleteName) values(?,?,?,?,?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, log.getBoard());
			pstmt.setString(2, log.getTitle());
			pstmt.setString(3, log.getContent());
			pstmt.setString(4, log.getWriterId());
			pstmt.setString(5, log.getWriterName());
			pstmt.setString(6, log.getDeleteId());
			pstmt.setString(7, log.getDeleteName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		
	}

	public int getLastNum() {
		int lastNum = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select num from log order by num desc";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				lastNum = rs.getInt("num");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return lastNum;
	}
	
	//전체 로그수 추출
	public int getLogCount() {
		int lastNum = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from log";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				lastNum = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return lastNum;
	}
	
	//글 검색기능
	public ArrayList<LogDTO> searchLog(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogDTO log = null;
		String sql = "select * from log where title like ? order by num desc";
		ArrayList<LogDTO> searchList = new ArrayList<LogDTO>();
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				log = new LogDTO();
				log.setNum(rs.getInt("num"));
				log.setBoard(rs.getString("board"));
				log.setTitle(rs.getString("title"));
				log.setContent(rs.getString("content"));
				log.setWriterId(rs.getString("writerId"));
				log.setWriterName(rs.getString("writerName"));
				log.setDeleteId(rs.getString("deleteId"));
				log.setDeleteName(rs.getString("deleteName"));
				log.setExecuteDate(rs.getTimestamp("executeDate"));
				searchList.add(log);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return searchList;
	}

}
