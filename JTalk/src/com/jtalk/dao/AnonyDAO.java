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
						rs.getString("content"),
						rs.getTimestamp("writeDate"),
						rs.getInt("awesome"));
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

}
