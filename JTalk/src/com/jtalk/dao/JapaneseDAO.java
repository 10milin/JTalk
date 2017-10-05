package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;
import com.jtalk.dto.JapaneseDTO;

import java.sql.*;
import java.util.ArrayList;

public class JapaneseDAO {
	private JapaneseDAO() {}
	
	private static JapaneseDAO instance = new JapaneseDAO();
	
	public static JapaneseDAO getInstance() {
		return instance;
	}
	
	//공지사항 작성
	public void insertJapanese(JapaneseDTO japanese) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into japanese(title, content, writerId, writerName, fileName, originFileName) "
				+ "values(?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, japanese.getTitle());
			pstmt.setString(2, japanese.getContent());
			pstmt.setString(3, japanese.getWriterId());
			pstmt.setString(4, japanese.getWriterName());
			pstmt.setString(5, japanese.getFileName());
			pstmt.setString(6, japanese.getOriginFileName());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//전체 공지사항 불러오기
	public ArrayList<JapaneseDTO> getAllJapanese() {
		ArrayList<JapaneseDTO> list = null;
		JapaneseDTO japanese = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from japanese order by num desc";
		
		try {
			list = new ArrayList<JapaneseDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				japanese = new JapaneseDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				list.add(japanese);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//공지사항 내용 불러오기
	public JapaneseDTO getJapanese(int num) {
		JapaneseDTO japanese = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from japanese where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				japanese = new JapaneseDTO(rs.getInt("num"),
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
		
		return japanese;
	}
	
	//조회수 증가
	public void hitUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update japanese set hit = hit + 1 where num = ?";
		
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
	public ArrayList<JapaneseDTO> searchJapanese(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from japanese where title like ? order by num desc";
		ArrayList<JapaneseDTO> searchList = new ArrayList<JapaneseDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				searchList.add(new JapaneseDTO(rs.getInt("num"),
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
	public void modifyJapanese(JapaneseDTO japanese) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update japanese set "
				+ "title = ?, content = ?, writerId = ?, writerName = ?,";
		if(japanese.getFileName()!=null)
		{
			sql+=" fileName = ?, originFileName = ?,";
		}
		sql +=" writeDate = current_timestamp "	+ "where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, japanese.getTitle());
			pstmt.setString(2, japanese.getContent());
			pstmt.setString(3, japanese.getWriterId());
			pstmt.setString(4, japanese.getWriterName());
			if(japanese.getFileName()!=null)
			{
				pstmt.setString(5, japanese.getFileName());
				pstmt.setString(6, japanese.getOriginFileName());
				pstmt.setInt(7, japanese.getNum());
			}
			else
			{
				pstmt.setInt(5, japanese.getNum());
			}
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//공지사항 삭제
	public void deleteJapanese(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from japanese where num = ?";
		
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
		String sql = "select num from japanese order by num desc";
		
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
