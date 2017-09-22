package com.jtalk.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dao.MessageDAO;
import com.jtalk.dto.MemberDTO;

public class EmailCheckService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		
		String email = request.getParameter("email");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		if(dao.getMember(email) == null) {
			json = "{\"result\": \"" + "1" +"\"}"; // 사용가능
		}else {
			json = "{\"result\": \"" + "0" +"\"}"; // 사용불가
		}
		
		return json;
	}

}
