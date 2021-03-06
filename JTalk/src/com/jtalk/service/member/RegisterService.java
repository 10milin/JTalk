package com.jtalk.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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
		
		BCryptPasswordEncoder bcp = new BCryptPasswordEncoder();
		
		String encodedPass = bcp.encode(pass);
		
		MemberDTO member = new MemberDTO(email, encodedPass, name, period, link);
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.insertMember(member);
		
		if(result > 0) {
			AuthEmail.setRequest(request);
			try {
				AuthEmail.send(email, name, link, "insert");
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("successMsg", name + "님 환영합니다.<br>" +email + "로 인증메일이<br>전송 되었습니다.");
			request.setAttribute("email", email);
			
			resURL = "/pages/login/login.jsp";
		}else {
			resURL = "/pages/error/500.jsp";
		}
		
		return resURL;
	}

}
