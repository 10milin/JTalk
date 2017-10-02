package com.jtalk.dao;

import static com.jtalk.db.JdbcUtils.*;
import com.jtalk.dto.FoodDTO;

import java.sql.*;
import java.util.ArrayList;

public class FoodDAO {
	private FoodDAO() {}
	
	private static FoodDAO instance = new FoodDAO();
	
	public static FoodDAO getInstance() {
		return instance;
	}
	
	//공지사항 작성
	public void insertFood(FoodDTO food) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into food(title, content, writerId, writerName, fileName, originFileName) "
				+ "values(?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, food.getTitle());
			pstmt.setString(2, food.getContent());
			pstmt.setString(3, food.getWriterId());
			pstmt.setString(4, food.getWriterName());
			pstmt.setString(5, food.getFileName());
			pstmt.setString(6, food.getOriginFileName());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//전체 공지사항 불러오기
	public ArrayList<FoodDTO> getAllFood() {
		ArrayList<FoodDTO> list = null;
		FoodDTO food = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from food order by num desc";
		
		try {
			list = new ArrayList<FoodDTO>();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				food = new FoodDTO(rs.getInt("num"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("writerId"),
						rs.getString("writerName"),
						rs.getString("fileName"),
						rs.getString("originFileName"),
						rs.getTimestamp("writeDate"),
						rs.getInt("hit"));
				list.add(food);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//공지사항 내용 불러오기
	public FoodDTO getFood(int num) {
		FoodDTO food = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from food where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				food = new FoodDTO(rs.getInt("num"),
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
		
		return food;
	}
	
	//조회수 증가
	public void hitUp(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update food set hit = hit + 1 where num = ?";
		
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
	public ArrayList<FoodDTO> searchFood(String key) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from food where title like ? order by num desc";
		ArrayList<FoodDTO> searchList = new ArrayList<FoodDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				searchList.add(new FoodDTO(rs.getInt("num"),
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
	public void modifyFood(FoodDTO food) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update food set "
				+ "title = ?, content = ?, writerId = ?, writerName = ?,";
		if(food.getFileName()!=null)
		{
			sql+=" fileName = ?, originFileName = ?";
		}
		sql +=" writeDate = current_timestamp "	+ "where num = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, food.getTitle());
			pstmt.setString(2, food.getContent());
			pstmt.setString(3, food.getWriterId());
			pstmt.setString(4, food.getWriterName());
			if(food.getFileName()!=null)
			{
				pstmt.setString(5, food.getFileName());
				pstmt.setString(6, food.getOriginFileName());
				pstmt.setInt(7, food.getNum());
			}
			else
			{
				pstmt.setInt(5, food.getNum());
			}
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//공지사항 삭제
	public void deleteFood(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from food where num = ?";
		
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
		String sql = "select num from food order by num desc";
		
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
