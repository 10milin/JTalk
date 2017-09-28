package com.jtalk.dao;

import java.sql.*;
import java.util.ArrayList;
import static com.jtalk.db.JdbcUtils.*;
import com.jtalk.dto.TradeDTO;

public class TradeDAO {
	private TradeDAO() {}
	
	private static TradeDAO instance = new TradeDAO();
	
	public static TradeDAO getInstance()
	{
		return instance;
	}

	public ArrayList<TradeDTO> getAllTrade() {
		ArrayList<TradeDTO> list = null;
		TradeDTO trade = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from trade order by num desc";
		
		try
		{
			list = new ArrayList<TradeDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				trade = new TradeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("photo"),
						rs.getString("originphoto"),
						rs.getString("content"),
						rs.getString("isSoldout"),
						rs.getString("writerID"),
						rs.getString("writerName"),
						rs.getString("phone"),
						rs.getString("price"),
						rs.getTimestamp("writeDate"));
				list.add(trade);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(rs, pstmt, conn);
		}
		
		return list;
	}

	public ArrayList<TradeDTO> searchTrade(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from trade where title like ? order by num desc";
		ArrayList<TradeDTO> searchList = new ArrayList<TradeDTO>();
		
		try
		{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				searchList.add(new TradeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("photo"),
						rs.getString("originphoto"),
						rs.getString("content"),
						rs.getString("isSoldout"),
						rs.getString("writerID"),
						rs.getString("writerName"),
						rs.getString("phone"),
						rs.getString("price"),
						rs.getTimestamp("writeDate")));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(rs, pstmt, conn);
		}
		
		return searchList;
	}

	public void insertTrade(TradeDTO trade) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into trade(title,photo,originphoto,content,"
				+ "writerID,writerName,phone,price) values(?,?,?,?,?,?,?,?)";
		
		try
		{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, trade.getTitle());
			pstmt.setString(2, trade.getPhoto());
			pstmt.setString(3, trade.getOriginphoto());
			pstmt.setString(4, trade.getContent());
			pstmt.setString(5, trade.getWriterID());
			pstmt.setString(6, trade.getWriterName());
			pstmt.setString(7, trade.getPhone());
			pstmt.setString(8, trade.getPrice());
			
			pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(null, pstmt, conn);
		}
	}

	public int getLastNum() {
		int lastNum = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select num from trade order by num desc";
		
		try
		{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				lastNum = rs.getInt("num");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			close(rs, pstmt, conn);
		}
		
		return lastNum;
	}
}
