package com.jtalk.validation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ToggleValidator {
	public static void validate(HttpServletRequest request, HttpServletResponse response) {
				
		HttpSession session = request.getSession();
		if(session.getAttribute("toggle") == null) {
			session.setAttribute("toggle", "0");
			session.setAttribute("body", "skin-blue-light layout-boxed sidebar-mini");
		}

	}
}
