package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;

import java.sql.*;
import java.util.ArrayList;

import com.jtalk.dto.CommentDTO;
import com.jtalk.dto.DatabaseDTO;
import com.jtalk.dto.LogDTO;


public class DatabaseDAO {
	private DatabaseDAO(){}
	
	private static DatabaseDAO instance = new DatabaseDAO();

	public static DatabaseDAO getInstance() {
		return instance;
	}
	
	public ArrayList<DatabaseDTO> getStorage() {
		ArrayList<DatabaseDTO> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT table_name, table_rows, round(data_length/(1024*1024),2) as 'data_size' FROM information_schema.TABLES where table_schema = 'jtalk' GROUP BY table_name having table_name not in('newcomment', 'comment', 'log', 'awesome', 'message', 'member') ORDER BY table_rows DESC";
		
		try {
			list = new ArrayList<DatabaseDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DatabaseDTO dto = new DatabaseDTO();
				dto.setTable_name(rs.getString(1));
				dto.setTable_rows(rs.getInt(2));
				dto.setData_size(rs.getDouble(3));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	
	public double getDatabaseCapacity() {
		double size = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select table_schema ?, SUM(data_length + index_length) / 1024 / 1024 from information_schema.TABLES group by table_schema";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "Database Name");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString(1).equals("jtalk")) {
					size = rs.getDouble(2);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return size;
	}

}
