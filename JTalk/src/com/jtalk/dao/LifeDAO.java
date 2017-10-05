package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;

import com.jtalk.dto.LifeDTO;

import java.sql.*;
import java.util.ArrayList;

public class LifeDAO {
	private LifeDAO() {}
	
	private static LifeDAO instance = new LifeDAO();
	
	public static LifeDAO getInstance() {
		return instance;
	}
	
	//공지사항 작성
	public void insertLife(LifeDTO life) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into life(title, content, writerId, writerName, fileName, originFileName) "
				+ "values(?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, life.getTitle());
			pstmt.setString(2, life.getContent());
			pstmt.setString(3, life.getWriterId());
			pstmt.setString(4, life.getWriterName());
			pstmt.setString(5, life.getFileName());
			pstmt.setString(6, life.getOriginFileName());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//전체 공지사항 불러오기
	public ArrayList<LifeDTO> getAllLife() {
		ArrayList<LifeDTO> list = null;
		LifeDTO life = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from life order by num desc";
		
		try {
			list = new ArrayList<LifeDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				life = new LifeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				list.add(life);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//공지사항 내용 불러오기
	public LifeDTO getLife(int num) {
		LifeDTO life = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from life where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				life = new LifeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return life;
	}
	
	//조회수 증가
	public void hitUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update life set hit = hit + 1 where num = ?";
		
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
	public ArrayList<LifeDTO> searchLife(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from life where title like ? order by num desc";
		ArrayList<LifeDTO> searchList = new ArrayList<LifeDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				searchList.add(new LifeDTO(rs.getInt("num"),
											rs.getString("title"),
											rs.getString("content"),
											rs.getString("writerId"),
											rs.getString("writerName"),
											rs.getString("fileName"),
											rs.getString("originFileName"),
											rs.getTimestamp("writeDate"),
											rs.getInt("hit")));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return searchList;
	}
	
	//공지사항 수정하기
	public void modifyLife(LifeDTO life) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update life set "
				+ "title = ?, content = ?, writerId = ?, writerName = ?,";
		if(life.getFileName()!=null)
		{
			sql+=" fileName = ?, originFileName = ?,";
		}
		sql +=" writeDate = current_timestamp "	+ "where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, life.getTitle());
			pstmt.setString(2, life.getContent());
			pstmt.setString(3, life.getWriterId());
			pstmt.setString(4, life.getWriterName());
			if(life.getFileName()!=null)
			{
				pstmt.setString(5, life.getFileName());
				pstmt.setString(6, life.getOriginFileName());
				pstmt.setInt(7, life.getNum());
			}
			else
			{
				pstmt.setInt(5, life.getNum());
			}
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//공지사항 삭제
	public void deleteLife(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from life where num = ?";
		
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
		String sql = "select num from life order by num desc";
		
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
