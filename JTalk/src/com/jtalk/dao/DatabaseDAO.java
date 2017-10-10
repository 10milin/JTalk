package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;

import java.sql.*;
import java.util.ArrayList;

import com.jtalk.dto.LogDTO;


public class DatabaseDAO {
	private DatabaseDAO(){}
	
	private static DatabaseDAO instance = new DatabaseDAO();

	public static DatabaseDAO getInstance() {
		return instance;
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
