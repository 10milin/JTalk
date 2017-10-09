package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;

import com.jtalk.dto.ProjectDTO;

import java.sql.*;
import java.util.ArrayList;

public class ProjectDAO {
	private ProjectDAO() {}
	
	private static ProjectDAO instance = new ProjectDAO();
	
	public static ProjectDAO getInstance() {
		return instance;
	}
	
	//공지사항 작성
	public void insertProject(ProjectDTO project) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into project(title, content, writerId, writerName, fileName, originFileName, period, category, closingDate, teamName, teamMember) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, project.getTitle());
			pstmt.setString(2, project.getContent());
			pstmt.setString(3, project.getWriterId());
			pstmt.setString(4, project.getWriterName());
			pstmt.setString(5, project.getFileName());
			pstmt.setString(6, project.getOriginFileName());
			pstmt.setInt(7, project.getPeriod());
			pstmt.setString(8, project.getCategory());
			pstmt.setString(9, project.getClosingDate());
			pstmt.setString(10, project.getTeamName());
			pstmt.setString(11, project.getTeamMember());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//전체 공지사항 불러오기
	public ArrayList<ProjectDTO> getAllProject() {
		ArrayList<ProjectDTO> list = null;
		ProjectDTO project = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from project order by num desc";
		
		try {
			list = new ArrayList<ProjectDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				project = new ProjectDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				project.setPeriod(rs.getInt("period"));
				project.setCategory(rs.getString("category"));
				project.setClosingDate(rs.getString("closingDate"));
				project.setTeamName(rs.getString("teamName"));
				project.setTeamMember(rs.getString("teamMember"));
				list.add(project);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//공지사항 내용 불러오기
	public ProjectDTO getProject(int num) {
		ProjectDTO project = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from project where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				project = new ProjectDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				project.setPeriod(rs.getInt("period"));
				project.setCategory(rs.getString("category"));
				project.setClosingDate(rs.getString("closingDate"));
				project.setTeamName(rs.getString("teamName"));
				project.setTeamMember(rs.getString("teamMember"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return project;
	}
	
	//조회수 증가
	public void hitUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update project set hit = hit + 1 where num = ?";
		
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
	public ArrayList<ProjectDTO> searchProject(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from project where title like ? order by num desc";
		ArrayList<ProjectDTO> searchList = new ArrayList<ProjectDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProjectDTO projectDto = new ProjectDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				projectDto.setPeriod(rs.getInt("period"));
				projectDto.setCategory(rs.getString("category"));
				projectDto.setClosingDate(rs.getString("closingDate"));
				projectDto.setTeamName(rs.getString("teamName"));
				projectDto.setTeamMember(rs.getString("teamMember"));
				searchList.add(projectDto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return searchList;
	}
	
	//공지사항 수정하기
	public void modifyProject(ProjectDTO project) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update project set "
				+ "title = ?, content = ?, writerId = ?, writerName = ?,";
		if(project.getFileName()!=null)
		{
			sql+=" fileName = ?, originFileName = ?,";
		}
		sql +=" writeDate = current_timestamp, period = ?, category = ?, closingDate = ?, teamName = ?, teamMember = ? "	+ "where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, project.getTitle());
			pstmt.setString(2, project.getContent());
			pstmt.setString(3, project.getWriterId());
			pstmt.setString(4, project.getWriterName());
			if(project.getFileName()!=null)
			{
				pstmt.setString(5, project.getFileName());
				pstmt.setString(6, project.getOriginFileName());
				pstmt.setInt(7, project.getPeriod());
				pstmt.setString(8, project.getCategory());
				pstmt.setString(9, project.getClosingDate());
				pstmt.setString(10, project.getTeamName());
				pstmt.setString(11, project.getTeamMember());
				pstmt.setInt(12, project.getNum());
			}
			else
			{
				pstmt.setInt(5, project.getPeriod());
				pstmt.setString(6, project.getCategory());
				pstmt.setString(7, project.getClosingDate());
				pstmt.setString(8, project.getTeamName());
				pstmt.setString(9, project.getTeamMember());
				pstmt.setInt(10, project.getNum());
			}
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//공지사항 삭제
	public void deleteProject(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from project where num = ?";
		
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
		String sql = "select num from project order by num desc";
		
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
