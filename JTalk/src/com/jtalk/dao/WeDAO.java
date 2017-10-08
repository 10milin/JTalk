package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;
import com.jtalk.dto.WeDTO;

import java.sql.*;
import java.util.ArrayList;

public class WeDAO {
	private WeDAO() {}
	
	private static WeDAO instance = new WeDAO();
	
	public static WeDAO getInstance() {
		return instance;
	}
	
	//공지사항 작성
	public void insertWe(WeDTO we) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into we(title, content, writerId, writerName, fileName, originFileName, period) "
				+ "values(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, we.getTitle());
			pstmt.setString(2, we.getContent());
			pstmt.setString(3, we.getWriterId());
			pstmt.setString(4, we.getWriterName());
			pstmt.setString(5, we.getFileName());
			pstmt.setString(6, we.getOriginFileName());
			pstmt.setInt(7, we.getPeriod());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//전체 공지사항 불러오기
	public ArrayList<WeDTO> getAllWe(int period) {
		ArrayList<WeDTO> list = null;
		WeDTO we = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from we where period = ? order by num desc";
		
		try {
			list = new ArrayList<WeDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, period);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				we = new WeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				we.setPeriod(rs.getInt("period"));
				list.add(we);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//공지사항 내용 불러오기
	public WeDTO getWe(int num) {
		WeDTO we = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from we where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				we = new WeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				we.setPeriod(rs.getInt("period"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return we;
	}
	
	//조회수 증가
	public void hitUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update we set hit = hit + 1 where num = ?";
		
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
	public ArrayList<WeDTO> searchWe(String key, int period) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from we where title like ? and period = ? order by num desc";
		ArrayList<WeDTO> searchList = new ArrayList<WeDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			pstmt.setInt(2, period);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WeDTO weDto = new WeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				weDto.setPeriod(rs.getInt("period"));
				searchList.add(weDto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return searchList;
	}
	
	//공지사항 수정하기
	public void modifyWe(WeDTO we) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update we set "
				+ "title = ?, content = ?, writerId = ?, writerName = ?,";
		if(we.getFileName()!=null)
		{
			sql+=" fileName = ?, originFileName = ?,";
		}
		sql +=" writeDate = current_timestamp, period = ? "	+ "where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, we.getTitle());
			pstmt.setString(2, we.getContent());
			pstmt.setString(3, we.getWriterId());
			pstmt.setString(4, we.getWriterName());
			if(we.getFileName()!=null)
			{
				pstmt.setString(5, we.getFileName());
				pstmt.setString(6, we.getOriginFileName());
				pstmt.setInt(7, we.getPeriod());
				pstmt.setInt(8, we.getNum());
			}
			else
			{
				pstmt.setInt(5, we.getPeriod());
				pstmt.setInt(6, we.getNum());
			}
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//공지사항 삭제
	public void deleteWe(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from we where num = ?";
		
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
		String sql = "select num from we order by num desc";
		
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
