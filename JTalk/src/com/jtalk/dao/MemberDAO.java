package com.jtalk.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.jtalk.db.JdbcUtils.*;
import com.jtalk.dto.MemberDTO;

public class MemberDAO {
	private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	//회원가입
	public void insertMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member(email, pass, name, period, link)"
				+ " values(?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getPeriod());
			pstmt.setString(5, member.getLink());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}
	
	//회원 활성화
	public int activeMember(String email, String link) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update member set active = 1, link = null where email = ? and link = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, link);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
		return result;
	}
	
	//로그인 체크
	public int memberCheck(String email, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where email = ? and pass = ?";
		int result = 0;
		/*
		 * 0 : 아이디 또는 비밀번호 오류로 인한 로그인 불가
		 * 1 : 아이디 비활성화로 인한 로그인 불가
		 * 2 : 아이디 정지로 인한 로그인 불가
		 * 3 : 로그인 성공
		 */
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("active").equals("1")) {
					if(rs.getString("ban").equals("0")) {
						result = 3;
					}else {
						result = 2;
					}
				}else {
					result = 1;
				}
			}else {
				result = 0;
			}
		}catch(Exception e) {
			
		}finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	//로그인 후 멤버 정보 session생성
	public MemberDTO getMember(String email) {
		MemberDTO member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where email = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO(rs.getString("email"), 
						rs.getString("pass"),
						rs.getString("name"),
						rs.getInt("period"),
						rs.getString("ban"),
						rs.getString("active"),
						rs.getString("link"),
						rs.getTimestamp("registerDate"),
						rs.getString("profile"),
						rs.getString("pr"));	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		return member;
	}
	
	//비밀번호 찾기를 위한 정보 확인
	public int findCheck(String email, String name, int period) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where email = ? and name = ? and period = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.setInt(3, period);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}
		}catch(Exception e) {
			
		}finally {
			close(rs, pstmt, conn);
		}
		return result;
	}
	
	//임시 비밀번호로 수정
	public void findPass(String newPass, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member set pass = ? where email = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPass);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}

	public void passChange(String email, String newpass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member set pass = ? where email = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newpass);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
	}

	public void updateProfile(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member set name = ? , period = ? , pr = ? , profile = ? where email = ?";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPeriod());
			pstmt.setString(3, dto.getPr());
			pstmt.setString(4, dto.getProfile());
			pstmt.setString(5, dto.getEmail());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
	}
	
	public String getPicture(String email)
	{
		String profile = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select profile from member where email = ?";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				profile = rs.getString("profile");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return profile;
	}
	//회원 정보 수정
	/*public void changePass()
	{
		
	}*/
}
