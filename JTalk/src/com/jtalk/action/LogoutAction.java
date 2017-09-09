package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Action;

public class LogoutAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		/* Default URL */
		String resURL = "/index.jsp";
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return resURL;
	}
}
