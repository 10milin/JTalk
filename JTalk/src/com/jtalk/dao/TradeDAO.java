package com.jtalk.dao;

import java.sql.*;
import java.util.ArrayList;
import static com.jtalk.db.JdbcUtils.*;

import com.jtalk.dto.NoticeDTO;
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
				trade.setHit(rs.getInt("hit"));
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
	
	//조회수 증가
		public void hitUp(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "update trade set hit = hit + 1 where num = ?";
			
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
		
		//글 내용 불러오기
		public TradeDTO getTrade(int num) {
			TradeDTO trade = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from trade where num = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					trade = new TradeDTO();
					trade.setNum(rs.getInt("num"));
					trade.setTitle(rs.getString("title"));
					trade.setPhoto(rs.getString("photo"));
					trade.setOriginphoto(rs.getString("originphoto"));
					trade.setContent(rs.getString("content"));
					trade.setIsSoldout(rs.getString("isSoldout"));
					trade.setWriterID(rs.getString("writerID"));
					trade.setWriterName(rs.getString("writerName"));
					trade.setPhone(rs.getString("phone"));
					trade.setPrice(rs.getString("price"));
					trade.setWriteDate(rs.getTimestamp("writeDate"));
					trade.setHit(rs.getInt("hit"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs, pstmt, conn);
			}
			
			return trade;
		}
		
		//글 삭제
		public void deleteTrade(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "delete from trade where num = ?";
			
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
		
		//글 수정하기
		public void modifyTrade(TradeDTO trade) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "update trade set "
					+ "title = ?, content = ?, writerID = ?, writerName = ?,";
			if(trade.getPhoto() !=null)
			{
				sql+=" photo = ?, originphoto = ?,";
			}
			sql +=" phone = ?, price = ?"	+ "where num = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, trade.getTitle());
				pstmt.setString(2, trade.getContent());
				pstmt.setString(3, trade.getWriterID());
				pstmt.setString(4, trade.getWriterName());
				if(trade.getPhoto() !=null)
				{
					pstmt.setString(5, trade.getPhoto());
					pstmt.setString(6, trade.getOriginphoto());
					pstmt.setString(7, trade.getPhone());
					pstmt.setString(8, trade.getPrice());
					pstmt.setInt(9, trade.getNum());
				}
				else
				{
					pstmt.setString(5, trade.getPhone());
					pstmt.setString(6, trade.getPrice());
					pstmt.setInt(7, trade.getNum());
				}
				
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(null, pstmt, conn);
			}
		}
}
