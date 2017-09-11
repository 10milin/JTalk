package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.member.LoginService;

public class PasswordAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		/* Default URL */
		String resURL = "/pages/profile/password.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
		
		return resURL;
	}

}
