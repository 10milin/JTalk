package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class LoginService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/login/login.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			switch(command) {
			case "action":
				String errorMsg = "이메일 혹은 비밀번호가 올바르지 않습니다.<br>다시 한번 확인해주세요.";
				request.setAttribute("errorMsg", errorMsg);
				resURL = "/pages/login/login.jsp";
				break;
			default:
				
			}
			
		}

		return resURL;
	}

}
