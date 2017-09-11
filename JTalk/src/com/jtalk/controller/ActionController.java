package com.jtalk.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.action.*;
import com.jtalk.core.Action;
import com.jtalk.validation.SessionValidator;
import com.jtalk.validation.ToggleValidator;

@WebServlet("*.action")
public class ActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("/pages/error/404.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/* Encoding setting UTF-8 */
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String action = uri.substring(conPath.length());

		Action service = null;
		String resURL = null;
		
		switch(action) {
		case "/login.action": service = new LoginAction(); break;
		case "/logout.action": service = new LogoutAction(); break;
		case "/recovery.action": service = new RecoveryAction(); break;
		case "/register.action": service = new RegisterAction(); break;
		case "/auth.action" : service = new AuthAction(); break;
		case "/index.action": service = new IndexAction(); break;
		case "/notice.action": service = new NoticeAction(); break;
		case "/profile.action": service = new ProfileAction(); break;
		case "/password.action": service = new PasswordAction(); break;
		default : resURL = "/index.action";
		}

		
		if(service !=null) resURL = service.execute(request, response);
		
		if(SessionValidator.validate(request, response)) {
			resURL = "/pages/login/login.jsp";
		}
		ToggleValidator.validate(request, response);
		
		request.getRequestDispatcher(resURL).forward(request, response);
		
	}

}
