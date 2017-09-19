package com.jtalk.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.MessageDAO;

public class DeleteService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = "/pages/profile/profile.jsp";
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		MessageDAO messageDAO = MessageDAO.getInstance();
		
		messageDAO.deleteMessage(num);
		return resURL;
	}

}
