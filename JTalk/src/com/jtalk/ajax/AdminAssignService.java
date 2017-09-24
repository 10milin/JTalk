package com.jtalk.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dao.MessageDAO;

public class AdminAssignService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		int result = 0;
		
		String email = request.getParameter("email");
		String status = request.getParameter("status");
		
		MemberDAO dao = MemberDAO.getInstance();
		result = dao.adminAssign(email, status);
		
		json = "{\"result\": \"" + result +"\"}";
		
		return json;
	}

}
