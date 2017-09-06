package com.jtalk.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.service.*;

@WebServlet("*.do")
public class Controller extends HttpServlet {
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

		Service service = null;
		String resURL = null;

		switch(action) {
		case "/index.do": service = new IndexService(); break;
		case "/login.do": service = new LoginService(); break;
		case "/logout.do": service = new LogoutService(); break;
		case "/recovery.do": service = new RecoveryService(); break;
		case "/register.do": service = new RegisterService(); break;
		case "/auth.do" : service = new AuthService(); break;
		default : resURL = "/index.do";
		}
		
		if(service !=null) resURL = service.execute(request, response);

		request.getRequestDispatcher(resURL).forward(request, response);
		
	}

}
