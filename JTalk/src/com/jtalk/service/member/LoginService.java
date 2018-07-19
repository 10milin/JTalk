package com.jtalk.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.jtalk.core.LoginManager;
import com.jtalk.core.Service;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.MemberDTO;

public class LoginService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = null;
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");		
		
		BCryptPasswordEncoder bcp = new BCryptPasswordEncoder();
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO member = dao.getMember(email);

		String errorMsg = null;
		boolean result = false;
		
		if(member != null) {
			
			if(!bcp.matches(pass, member.getPass())){
			
				errorMsg = "이메일 혹은 비밀번호가 올바르지 않습니다.<br>다시 한번 확인해주세요.";
				request.setAttribute("email", email);
				
			} else if("0".equals(member.getActive())) {
				
				errorMsg = "계정이 비활성화 되어 있습니다.<br/>인증 메일의 링크를 클릭해주세요.";
				request.setAttribute("email", email);
				
			} else if("1".equals(member.getBan())) {
				
				errorMsg = "계정이 정지되었습니다.<br/>관리자에게 문의해주세요.";
				
			} else {
				
				LoginManager manager = LoginManager.getInstance();
				if(manager.isUsing(email)) {
					manager.removeSession(email);
				}
				
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
				session.setAttribute("listener", manager);
				result = true;
				
			}
			
		} else {
			
			errorMsg = "이메일 혹은 비밀번호가 올바르지 않습니다.<br>다시 한번 확인해주세요.";
			request.setAttribute("email", email);
			
		}

		request.setAttribute("errorMsg", errorMsg);
		
		if(result) {
			resURL = "/index.jsp";
		}else {
			resURL = "/pages/login/login.jsp";
		}
		
		return resURL;
	}

}
