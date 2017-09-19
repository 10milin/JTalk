package com.jtalk.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.MessageDAO;
import com.jtalk.dto.MessageDTO;

public class SendService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = "/pages/profile/profile.jsp";
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String sendId = request.getParameter("sendId");
		String sendName = request.getParameter("sendName");
		String receiveId = request.getParameter("receiveId");
		
		MessageDTO message = new MessageDTO(title, content, sendId, sendName, receiveId);
		MessageDAO messageDAO = MessageDAO.getInstance();
		
		messageDAO.sendMessage(message);
		return resURL;
	}

}
