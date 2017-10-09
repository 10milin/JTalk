package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;
import com.jtalk.dto.StudyDTO;

import java.sql.*;
import java.util.ArrayList;

public class StudyDAO {
	private StudyDAO() {}
	
	private static StudyDAO instance = new StudyDAO();
	
	public static StudyDAO getInstance() {
		return instance;
	}
	
	//공지사항 작성
	public void insertStudy(StudyDTO study) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into study(title, content, writerId, writerName, fileName, originFileName, period, category, recruitNum, closingDate) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, study.getTitle());
			pstmt.setString(2, study.getContent());
			pstmt.setString(3, study.getWriterId());
			pstmt.setString(4, study.getWriterName());
			pstmt.setString(5, study.getFileName());
			pstmt.setString(6, study.getOriginFileName());
			pstmt.setInt(7, study.getPeriod());
			pstmt.setString(8, study.getCategory());
			pstmt.setInt(9, study.getRecruitNum());
			pstmt.setDate(10, study.getClosingDate());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//전체 공지사항 불러오기
	public ArrayList<StudyDTO> getAllStudy(int period) {
		ArrayList<StudyDTO> list = null;
		StudyDTO study = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from study where period = ? order by num desc";
		
		try {
			list = new ArrayList<StudyDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, period);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				study = new StudyDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				study.setPeriod(rs.getInt("period"));
				study.setCategory(rs.getString("category"));
				study.setRecruitNum(rs.getInt("recruitNum"));
				study.setClosingDate(rs.getDate("closingDate"));
				list.add(study);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//관리자가 열람시 전체글 뽑아오기
	public ArrayList<StudyDTO> getAllStudy() {
		ArrayList<StudyDTO> list = null;
		StudyDTO study = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from study order by num desc";
		
		try {
			list = new ArrayList<StudyDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				study = new StudyDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				study.setPeriod(rs.getInt("period"));
				study.setCategory(rs.getString("category"));
				study.setRecruitNum(rs.getInt("recruitNum"));
				study.setClosingDate(rs.getDate("closingDate"));
				list.add(study);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//공지사항 내용 불러오기
	public StudyDTO getStudy(int num) {
		StudyDTO study = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from study where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				study = new StudyDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				study.setPeriod(rs.getInt("period"));
				study.setCategory(rs.getString("category"));
				study.setRecruitNum(rs.getInt("recruitNum"));
				study.setClosingDate(rs.getDate("closingDate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return study;
	}
	
	//조회수 증가
	public void hitUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update study set hit = hit + 1 where num = ?";
		
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
	public ArrayList<StudyDTO> searchStudy(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from study where title like ? order by num desc";
		ArrayList<StudyDTO> searchList = new ArrayList<StudyDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StudyDTO studyDto = new StudyDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				studyDto.setPeriod(rs.getInt("period"));
				studyDto.setCategory(rs.getString("category"));
				studyDto.setRecruitNum(rs.getInt("recruitNum"));
				studyDto.setClosingDate(rs.getDate("closingDate"));
				searchList.add(studyDto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return searchList;
	}
	
	//공지사항 수정하기
	public void modifyStudy(StudyDTO study) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update study set "
				+ "title = ?, content = ?, writerId = ?, writerName = ?,";
		if(study.getFileName()!=null)
		{
			sql+=" fileName = ?, originFileName = ?,";
		}
		sql +=" writeDate = current_timestamp, period = ?, category = ?, recruitNum = ?, closingDate = ? "	+ "where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, study.getTitle());
			pstmt.setString(2, study.getContent());
			pstmt.setString(3, study.getWriterId());
			pstmt.setString(4, study.getWriterName());
			if(study.getFileName()!=null)
			{
				pstmt.setString(5, study.getFileName());
				pstmt.setString(6, study.getOriginFileName());
				pstmt.setInt(7, study.getPeriod());
				pstmt.setString(8, study.getCategory());
				pstmt.setInt(9, study.getRecruitNum());
				pstmt.setDate(10, study.getClosingDate());
				pstmt.setInt(11, study.getNum());
			}
			else
			{
				pstmt.setInt(5, study.getPeriod());
				pstmt.setString(6, study.getCategory());
				pstmt.setInt(7, study.getRecruitNum());
				pstmt.setDate(8, study.getClosingDate());
				pstmt.setInt(9, study.getNum());
			}
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//공지사항 삭제
	public void deleteStudy(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from study where num = ?";
		
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
		String sql = "select num from study order by num desc";
		
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
