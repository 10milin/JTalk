package com.jtalk.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dao.MessageDAO;

public class AdminPwService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		int result = 0;
		String email = request.getParameter("email");
		
		MemberDAO dao = MemberDAO.getInstance();
		result = dao.resetPassword(email);
		
		json = "{\"result\": \"" + result +"\"}";
		
		return json;
	}

}
