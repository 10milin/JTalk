package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;
import com.jtalk.dto.ExchangeDTO;

import java.sql.*;
import java.util.ArrayList;

public class ExchangeDAO {
	private ExchangeDAO() {}
	
	private static ExchangeDAO instance = new ExchangeDAO();
	
	public static ExchangeDAO getInstance() {
		return instance;
	}
	
	//공지사항 작성
	public void insertExchange(ExchangeDTO exchange) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into exchange(title, content, writerId, writerName, fileName, originFileName, period, category) "
				+ "values(?, ?, ?, ?, ?, ?, ?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, exchange.getTitle());
			pstmt.setString(2, exchange.getContent());
			pstmt.setString(3, exchange.getWriterId());
			pstmt.setString(4, exchange.getWriterName());
			pstmt.setString(5, exchange.getFileName());
			pstmt.setString(6, exchange.getOriginFileName());
			pstmt.setInt(7, exchange.getPeriod());
			pstmt.setString(8, exchange.getCategory());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//전체 공지사항 불러오기
	public ArrayList<ExchangeDTO> getAllExchange(int period) {
		ArrayList<ExchangeDTO> list = null;
		ExchangeDTO exchange = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from exchange where period = ? order by num desc";
		
		try {
			list = new ArrayList<ExchangeDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, period);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				exchange = new ExchangeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				exchange.setPeriod(rs.getInt("period"));
				exchange.setCategory(rs.getString("category"));
				list.add(exchange);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//관리자가 열람시 전체글 뽑아오기
	public ArrayList<ExchangeDTO> getAllExchange() {
		ArrayList<ExchangeDTO> list = null;
		ExchangeDTO exchange = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from exchange order by num desc";
		
		try {
			list = new ArrayList<ExchangeDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				exchange = new ExchangeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				exchange.setPeriod(rs.getInt("period"));
				exchange.setCategory(rs.getString("category"));
				list.add(exchange);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//공지사항 내용 불러오기
	public ExchangeDTO getExchange(int num) {
		ExchangeDTO exchange = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from exchange where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				exchange = new ExchangeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				exchange.setPeriod(rs.getInt("period"));
				exchange.setCategory(rs.getString("category"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return exchange;
	}
	
	//조회수 증가
	public void hitUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update exchange set hit = hit + 1 where num = ?";
		
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
	
	//글 검색기능
	public ArrayList<ExchangeDTO> searchExchange(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from exchange where title like ? order by num desc";
		ArrayList<ExchangeDTO> searchList = new ArrayList<ExchangeDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ExchangeDTO exchangeDto = new ExchangeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				exchangeDto.setPeriod(rs.getInt("period"));
				exchangeDto.setCategory(rs.getString("category"));
				searchList.add(exchangeDto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return searchList;
	}
	
	//공지사항 수정하기
	public void modifyExchange(ExchangeDTO exchange) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update exchange set "
				+ "title = ?, content = ?, writerId = ?, writerName = ?,";
		if(exchange.getFileName()!=null)
		{
			sql+=" fileName = ?, originFileName = ?,";
		}
		sql +=" writeDate = current_timestamp, period = ?, category = ? "	+ "where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, exchange.getTitle());
			pstmt.setString(2, exchange.getContent());
			pstmt.setString(3, exchange.getWriterId());
			pstmt.setString(4, exchange.getWriterName());
			if(exchange.getFileName()!=null)
			{
				pstmt.setString(5, exchange.getFileName());
				pstmt.setString(6, exchange.getOriginFileName());
				pstmt.setInt(7, exchange.getPeriod());
				pstmt.setString(8, exchange.getCategory());
				pstmt.setInt(9, exchange.getNum());
			}
			else
			{
				pstmt.setInt(5, exchange.getPeriod());
				pstmt.setString(6, exchange.getCategory());
				pstmt.setInt(7, exchange.getNum());
			}
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//공지사항 삭제
	public void deleteExchange(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from exchange where num = ?";
		
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
	
	//제일 마지막의 글 번호 가져오기
	public int getLastNum() {
		int lastNum = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select num from exchange order by num desc";
		
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
}
