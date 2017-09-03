package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;

public class IndexService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String resURL = "/pages/login/login.jsp";
		
		HttpSession session = request.getSession();
		if(session.getAttribute("member") !=null) resURL = "/pages/main.jsp"; 
		
		return resURL;
	}
	
}
