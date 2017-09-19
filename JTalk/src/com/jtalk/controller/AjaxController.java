package com.jtalk.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.ajax.*;
import com.jtalk.core.Action;

@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("/pages/error/404.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String action = uri.substring(conPath.length());

		Action service = null;
		String json = null;
		
		switch(action) {
		case "/wysiwyg-img.ajax": service = new WysiwygService(); break;
		case "/toggle.ajax" : service = new ToggleService(); break;
		case "/cmtmodify.ajax" : service = new CmtModifyService(); break;
		case "/newcmtreset.ajax": service = new NewCmtResetService(); break;
		case "/profile.ajax": service = new ProfileService(); break;
		case "/findEmail.ajax": service = new NameFindEmailService(); break;
		default : 
		}
		
		if(service !=null) json = service.execute(request, response);
		
		response.getWriter().write(json);
	}

}
