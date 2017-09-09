package com.jtalk.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.AuthEmail;
import com.jtalk.core.Service;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.MemberDTO;

public class RegisterService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		int period = Integer.parseInt(request.getParameter("period"));
		String link = AuthEmail.makeCode(email);
		 
		MemberDTO member = new MemberDTO(email, pass, name, period, link);
		MemberDAO dao = MemberDAO.getInstance();
		dao.insertMember(member);
		
		AuthEmail.send(email, link, "insert");
		
		request.setAttribute("successMsg", name + "님 환영합니다.<br>" +email + "로 인증메일이<br>전송 되었습니다.");
		request.setAttribute("email", email);
		
		resURL = "/pages/login/login.jsp";
		
		return resURL;
	}

}
