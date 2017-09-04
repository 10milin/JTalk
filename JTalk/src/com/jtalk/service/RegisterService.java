package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.MemberCore;
import com.jtalk.core.Service;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.MemberDTO;

public class RegisterService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		/* Default URL */
		String resURL = "/pages/login/register.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			switch(command) {
			case "action":
				String email = request.getParameter("email");
				String pass = request.getParameter("pass");
				String name = request.getParameter("name");
				int period = Integer.parseInt(request.getParameter("period"));
				String link = MemberCore.makeCode(email);
				
				MemberDTO member = new MemberDTO(email, pass, name, period, link);
				MemberDAO dao = MemberDAO.getInstance();
				dao.insertMember(member);
				
				MemberCore.send(email, link);
				resURL = "/pages/login/login.jsp";
				break;
			}
		}
		return resURL;
	}
}
