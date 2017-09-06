package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.LoginManager;
import com.jtalk.core.Service;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.MemberDTO;

public class LoginService implements Service{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/login/login.jsp";
		request.setAttribute("validate", false);
		
		String command = request.getParameter("command");
		
		if(command != null) {
			switch(command) {
			case "action":
				String email = request.getParameter("email");
				String pass = request.getParameter("pass");
				
				MemberDAO dao = MemberDAO.getInstance();
				
				int check = dao.memberCheck(email, pass);
				String errorMsg = null;
				boolean result = false;
				
				switch(check) {
				case 0:
					errorMsg = "이메일 혹은 비밀번호가 올바르지 않습니다.<br>다시 한번 확인해주세요.";
					request.setAttribute("email", email);
					break;
				case 1:
					errorMsg = "계정이 비활성화 되어 있습니다.<br/>인증 메일의 링크를 클릭해주세요.";
					request.setAttribute("email", email);
					break;
				case 2:
					errorMsg = "계정이 정지되었습니다.<br/>관리자에게 문의해주세요.";
					break;
				case 3:
					LoginManager manager = LoginManager.getInstance();
					MemberDTO member = dao.getMember(email);
					if(manager.isUsing(email)) {
						manager.removeSession(email);
					}
					
					HttpSession session = request.getSession();
					session.setAttribute("member", member);
					session.setAttribute("listener", manager);
					result = true;
					
					break;
				}
				request.setAttribute("errorMsg", errorMsg);
				
				if(result) {
					resURL = "/index.jsp";
				}else {
					resURL = "/pages/login/login.jsp";
				}
				break;
			}
			
		}
		return resURL;
	}
}
