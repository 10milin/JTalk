package com.jtalk.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.MemberDAO;

public class AuthService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		MemberDAO dao = MemberDAO.getInstance();
		String email = request.getParameter("email");
		String link = request.getParameter("link");

		int check = dao.activeMember(email, link);
		
		if(check > 0) {
			request.setAttribute("email", email);
			resURL = "/pages/auth/success.jsp";
		}
		
		return resURL;
	}

}
