package com.jtalk.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;

public class LogoutService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		/* Default URL */
		String resURL = "/index.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			
			switch(command) {
			case "action":
				HttpSession session = request.getSession();
				session.invalidate();
				break;
			}
		}
		return resURL;
	}
}
