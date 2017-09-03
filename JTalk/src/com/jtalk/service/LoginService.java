package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class LoginService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		/*기본 ?��?�� ?��?���?*/
		String resURL = "/pages/login/login.jsp";
		
		String command = request.getParameter("command");
		
		/* *
		 * command?�� ?��?�� ?��?��?�� 비�??��?�� 로직 ?��?��
		 * DAO?�� ?��근하?�� ?��?��?�� 객체�? request.setAttribute�? ?��?�� ?��?��
		 * */
		
		if(command != null) {
			switch(command) {
			case "action":
				// 로그?�� ?��?�� 로직
				// DB값과 비교?��?�� ?��?���? 메세�?�? ?��거나 resURL �?�?
				break;
			default:
				// ?��못된 커맨?�� ?��?��?�� 처리
			}
			
		}

		return resURL;
	}

}
