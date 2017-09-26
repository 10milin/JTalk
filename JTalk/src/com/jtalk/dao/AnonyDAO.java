package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;

import java.sql.*;
import java.util.ArrayList;

import com.jtalk.dto.AnonyDTO;


public class AnonyDAO {
	private AnonyDAO(){}
	
	private static AnonyDAO instance = new AnonyDAO();

	public static AnonyDAO getInstance() {
		return instance;
	}

	public ArrayList<AnonyDTO> getAllAnony() {
		ArrayList<AnonyDTO> list = null;
		AnonyDTO anony = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from anony order by num desc";
		
		try
		{
			list = new ArrayList<AnonyDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				anony = new AnonyDTO(rs.getInt("num"),
						rs.getString("writerID"),
						rs.getString("content"),
						rs.getTimestamp("writeDate"));
				list.add(anony);
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

	public void insertAnony(AnonyDTO anony) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into anony(writerID, content) values(?,?)";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, anony.getWriterId());
			pstmt.setString(2, anony.getContent());
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
		String sql = "select num from anony order by num desc";
		
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
	
	//댓글 삭제
	public int deleteAnony(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from anony where num = ?";
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

}
