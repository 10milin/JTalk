package com.jtalk.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.MemberDTO;

public class PwChangeService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = null;
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("member");
		
		String email = dto.getEmail();
		
		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		String newpasscheck = request.getParameter("newpasscheck");
		
		String errorMsg = null;
		
		if(dto.getPass().equals(oldpass)&&newpass.equals(newpasscheck))
		{
			MemberDAO dao = MemberDAO.getInstance();
			dao.passChange(email,newpass);
			resURL = "/pages/login/login.jsp";
		}
		
		if(!dto.getPass().equals(oldpass))
		{
			errorMsg = "현재 비밀번호와 맞지 않습니다.<br>다시 입력해주세요.";
			resURL = "/pages/profile/password.jsp";
			request.setAttribute("errorMsg", errorMsg);
		}
		if(!newpass.equals(newpasscheck))
		{
			errorMsg = "입력하신 비밀번호와 맞지 않습니다.<br>다시 입력해주세요.";
			resURL = "/pages/profile/password.jsp";
			request.setAttribute("errorMsg", errorMsg);
		}
		
		return resURL;
	}

}
