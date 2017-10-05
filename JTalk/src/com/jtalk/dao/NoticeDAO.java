package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;
import com.jtalk.dto.NoticeDTO;

import java.sql.*;
import java.util.ArrayList;

public class NoticeDAO {
	private NoticeDAO() {}
	
	private static NoticeDAO instance = new NoticeDAO();
	
	public static NoticeDAO getInstance() {
		return instance;
	}
	
	//공지사항 작성
	public void insertNotice(NoticeDTO notice) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into notice(title, content, writerId, writerName, fileName, originFileName) "
				+ "values(?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getWriterId());
			pstmt.setString(4, notice.getWriterName());
			pstmt.setString(5, notice.getFileName());
			pstmt.setString(6, notice.getOriginFileName());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//전체 공지사항 불러오기
	public ArrayList<NoticeDTO> getAllNotice() {
		ArrayList<NoticeDTO> list = null;
		NoticeDTO notice = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from notice order by num desc";
		
		try {
			list = new ArrayList<NoticeDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				notice = new NoticeDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				list.add(notice);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//공지사항 내용 불러오기
	public NoticeDTO getNotice(int num) {
		NoticeDTO notice = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from notice where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice = new NoticeDTO(rs.getInt("num"),
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
		
		return notice;
	}
	
	//조회수 증가
	public void hitUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update notice set hit = hit + 1 where num = ?";
		
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
	public ArrayList<NoticeDTO> searchNotice(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from notice where title like ? order by num desc";
		ArrayList<NoticeDTO> searchList = new ArrayList<NoticeDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				searchList.add(new NoticeDTO(rs.getInt("num"),
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
	public void modifyNotice(NoticeDTO notice) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update notice set "
				+ "title = ?, content = ?, writerId = ?, writerName = ?,";
		if(notice.getFileName()!=null)
		{
			sql+=" fileName = ?, originFileName = ?,";
		}
		sql +=" writeDate = current_timestamp "	+ "where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getWriterId());
			pstmt.setString(4, notice.getWriterName());
			if(notice.getFileName()!=null)
			{
				pstmt.setString(5, notice.getFileName());
				pstmt.setString(6, notice.getOriginFileName());
				pstmt.setInt(7, notice.getNum());
			}
			else
			{
				pstmt.setInt(5, notice.getNum());
			}
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//공지사항 삭제
	public void deleteNotice(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from notice where num = ?";
		
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
		String sql = "select num from notice order by num desc";
		
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
