package com.jtalk.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionValidator {
	public static boolean validate(HttpServletRequest request, HttpServletResponse response) {
		
		boolean validator = false;
				
		HttpSession session = request.getSession();
		if(session.getAttribute("member") == null && request.getAttribute("validate") == null) {
			validator = true;
		}
		return validator;
		
	}
}
