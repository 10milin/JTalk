package com.jtalk.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.MessageDAO;

public class ShowService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = "/pages/profile/profile.jsp";
		
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("showmsg", String.valueOf(num));
		
		MessageDAO dto = MessageDAO.getInstance();
		dto.readMessage(num);
		
		return resURL;
	}

}
