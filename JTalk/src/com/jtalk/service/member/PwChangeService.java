package com.jtalk.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.jtalk.core.Service;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.MemberDTO;

public class PwChangeService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = null;
		
		BCryptPasswordEncoder bcp = new BCryptPasswordEncoder();
		
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("member");
		
		String email = dto.getEmail();

		
		
		String oldpass = request.getParameter("oldpass");
		
		String newpass = request.getParameter("newpass");
		String newpasscheck = request.getParameter("newpasscheck");
		
		String errorMsg = null;
		String passwordChangeSuccessMsg = null;
		
		// 게스트 계정의 경우 비밀번호 변경이 불가능 하도록 처리
		if(email.equalsIgnoreCase("guest")) 
		{
			errorMsg = "손님 계정은 변경할 수 없습니다.";
			resURL = "/pages/profile/password.jsp";
			request.setAttribute("errorMsg", errorMsg);
		}else if(!bcp.matches(oldpass, dto.getPass())){
			errorMsg = "현재 비밀번호와 일치하지 않습니다.<br>다시 입력해주세요.";
			resURL = "/pages/profile/password.jsp";
			request.setAttribute("errorMsg", errorMsg);
		}else if(!newpass.equals(newpasscheck)){
			errorMsg = "입력하신 비밀번호와 일치하지 않습니다.<br>다시 입력해주세요.";
			resURL = "/pages/profile/password.jsp";
			request.setAttribute("errorMsg", errorMsg);
		}else if(newpass.length() < 4){
			errorMsg = "비밀번호는 최소 4자 이상입니다.<br>다시 입력해주세요.";
			resURL = "/pages/profile/password.jsp";
			request.setAttribute("errorMsg", errorMsg);
		}else {
			MemberDAO dao = MemberDAO.getInstance();
			
			String encodedNewPass = bcp.encode(newpass);
			
			dao.passChange(email,encodedNewPass);
			//세션에 추가 로직이 필요함
			passwordChangeSuccessMsg = "성공적으로 비밀번호가 변경되었습니다.<br>다시 로그인해주세요.";
			request.setAttribute("passwordChangeSuccessMsg", passwordChangeSuccessMsg);
			resURL = "/pages/login/login.jsp";
			session.invalidate();
		}
		
		
		return resURL;
	}

}
