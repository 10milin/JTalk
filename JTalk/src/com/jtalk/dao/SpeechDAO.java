package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;
import com.jtalk.dto.SpeechDTO;

import java.sql.*;
import java.util.ArrayList;

public class SpeechDAO {
	private SpeechDAO() {}
	
	private static SpeechDAO instance = new SpeechDAO();
	
	public static SpeechDAO getInstance() {
		return instance;
	}
	
	//공지사항 작성
	public void insertSpeech(SpeechDTO speech) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into speech(title, content, writerId, writerName, fileName, originFileName, period) "
				+ "values(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, speech.getTitle());
			pstmt.setString(2, speech.getContent());
			pstmt.setString(3, speech.getWriterId());
			pstmt.setString(4, speech.getWriterName());
			pstmt.setString(5, speech.getFileName());
			pstmt.setString(6, speech.getOriginFileName());
			pstmt.setInt(7, speech.getPeriod());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//전체 공지사항 불러오기
	public ArrayList<SpeechDTO> getAllSpeech(int period) {
		ArrayList<SpeechDTO> list = null;
		SpeechDTO speech = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from speech where period = ? order by num desc";
		
		try {
			list = new ArrayList<SpeechDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, period);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				speech = new SpeechDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				speech.setPeriod(rs.getInt("period"));
				list.add(speech);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//관리자가 열람시 전체글 뽑아오기
	public ArrayList<SpeechDTO> getAllSpeech() {
		ArrayList<SpeechDTO> list = null;
		SpeechDTO speech = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from speech order by num desc";
		
		try {
			list = new ArrayList<SpeechDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				speech = new SpeechDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				speech.setPeriod(rs.getInt("period"));
				list.add(speech);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//공지사항 내용 불러오기
	public SpeechDTO getSpeech(int num) {
		SpeechDTO speech = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from speech where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				speech = new SpeechDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				speech.setPeriod(rs.getInt("period"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return speech;
	}
	
	//조회수 증가
	public void hitUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update speech set hit = hit + 1 where num = ?";
		
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
	public ArrayList<SpeechDTO> searchSpeech(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from speech where title like ? order by num desc";
		ArrayList<SpeechDTO> searchList = new ArrayList<SpeechDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SpeechDTO speechDto = new SpeechDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				speechDto.setPeriod(rs.getInt("period"));
				searchList.add(speechDto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return searchList;
	}
	
	//공지사항 수정하기
	public void modifySpeech(SpeechDTO speech) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update speech set "
				+ "title = ?, content = ?, writerId = ?, writerName = ?,";
		if(speech.getFileName()!=null)
		{
			sql+=" fileName = ?, originFileName = ?,";
		}
		sql +=" writeDate = current_timestamp, period = ? "	+ "where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, speech.getTitle());
			pstmt.setString(2, speech.getContent());
			pstmt.setString(3, speech.getWriterId());
			pstmt.setString(4, speech.getWriterName());
			if(speech.getFileName()!=null)
			{
				pstmt.setString(5, speech.getFileName());
				pstmt.setString(6, speech.getOriginFileName());
				pstmt.setInt(7, speech.getPeriod());
				pstmt.setInt(8, speech.getNum());
			}
			else
			{
				pstmt.setInt(5, speech.getPeriod());
				pstmt.setInt(6, speech.getNum());
			}
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//공지사항 삭제
	public void deleteSpeech(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from speech where num = ?";
		
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
		String sql = "select num from speech order by num desc";
		
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
