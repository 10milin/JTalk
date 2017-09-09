package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.member.LoginService;

public class LoginAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/login/login.jsp";
		request.setAttribute("validate", false);
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "login": service = new LoginService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
		
		return resURL;
	}
}
