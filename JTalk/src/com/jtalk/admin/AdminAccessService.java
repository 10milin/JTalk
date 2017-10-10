package com.jtalk.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dto.MemberDTO;

public class AdminAccessService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = null;
		
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("member");
		
		String pass = request.getParameter("pass");
		
		String errorMsg = null;
		
		if(!dto.getPass().equals(pass)){
			errorMsg = "비밀번호가 올바르지 않습니다.<br>다시 입력해주세요.";
			resURL = "/pages/profile/profile.jsp";
			request.setAttribute("errorMsg", errorMsg);
			request.setAttribute("tab", "admin");
		}else{
			resURL = "/pages/admin/main.jsp";
		}
		
		
		return resURL;
	}

}
