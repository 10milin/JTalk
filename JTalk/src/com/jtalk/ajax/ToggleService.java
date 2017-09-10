package com.jtalk.ajax;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Action;

public class ToggleService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		HttpSession session = request.getSession();
		
		String toggle = (String)session.getAttribute("toggle");
		
		if(toggle == null) {
			session.setAttribute("toggle", "0");
		}
		
		if(toggle.equals("0")) {
			session.setAttribute("toggle", "1");
			session.setAttribute("body", "skin-blue-light sidebar-mini wysihtml5-supported fixed sidebar-mini-expand-feature sidebar-collapse");
		}else{
			session.setAttribute("toggle", "0");
			session.setAttribute("body", "skin-blue-light sidebar-mini wysihtml5-supported fixed sidebar-mini-expand-feature");
		}
		
		String value = (String)session.getAttribute("toggle");
		
		json = "{\"toggle\": \"" + value +"\"}";
		
		return json;
	}
}
