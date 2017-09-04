package com.jtalk.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.dao.MemberDAO;

/**
 * Servlet implementation class AuthServlet
 */
@WebServlet("/auth.action")
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberDAO dao = MemberDAO.getInstance();
		String email = request.getParameter("email");
		String link = request.getParameter("link");
		
		int check = dao.activeMember(email, link);
		String resURL = "/pages/error/404.jsp";
		
		if(check > 0) {
			resURL = "/pages/login/login.jsp";
		}
		RequestDispatcher rdp = request.getRequestDispatcher(resURL);
		rdp.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
