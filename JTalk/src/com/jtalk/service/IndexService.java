package com.jtalk.service;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;

public class IndexService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/login/login.jsp";
		
		HttpSession session = request.getSession();
		if(session.getAttribute("member") !=null) {
			/*version information to ApplicationScope*/
			ServletContext ctx =  request.getServletContext();
			ctx.setAttribute("version", "Alpha");
			resURL = "/pages/main.jsp"; 
		}
		
		return resURL;
	}
	
}
