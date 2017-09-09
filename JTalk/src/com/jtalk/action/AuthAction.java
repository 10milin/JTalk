package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.member.AuthService;

public class AuthAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = "/pages/error/404.jsp";
		request.setAttribute("validate", false);
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "auth": service = new AuthService(); break;
			
			}
			if(service !=null) resURL = service.process(request, response);
			
		}
		
		return resURL;
	}

}
