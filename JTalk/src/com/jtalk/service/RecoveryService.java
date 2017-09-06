package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.MemberCore;
import com.jtalk.core.Service;
import com.jtalk.dao.MemberDAO;

public class RecoveryService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/login/recovery.jsp";
		request.setAttribute("validate", false);
		
		String command = request.getParameter("command");
		
		if(command != null) {
			
			switch(command) {
			case "action":
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				int period = Integer.parseInt(request.getParameter("period"));
				
				MemberDAO dao = MemberDAO.getInstance();
				int result = dao.findCheck(email, name, period);
				String newPass = "";
				if(result == 1) {
					for(int i = 0; i < 5; i++) {
						double rand = Math.random();
						int value = (int)(rand * 10) + 1;
						
						if(value == 10) {
							value = value - (int)(Math.random() * 10) + 1;
						}
						
						newPass += value;
					}
					
					dao.findPass(newPass, email);
					
					MemberCore.send(email, newPass, "find");
					
					String successMsg = email + "으로<br>임시 비밀번호를 전송하였습니다.";
					request.setAttribute("successMsg", successMsg);
				}else {
					String errorMsg = "입력하신 정보와 일치하는 회원이 존재하지<br>않습니다. 다시 한번 확인해주세요.";
					request.setAttribute("errorMsg", errorMsg);
				}
				break;
			}
		}
		return resURL;
	}
}
