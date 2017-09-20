package com.jtalk.ajax;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Action;
import com.jtalk.dao.MessageDAO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dto.MessageDTO;

public class MessageSendService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String sendId = request.getParameter("sendId");
		String sendName = request.getParameter("sendName");
		String receiveId = request.getParameter("receiveId");
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		MessageDTO message = new MessageDTO(title, content, sendId, sendName, member.getProfile(), receiveId);
		MessageDAO messageDAO = MessageDAO.getInstance();
		
		messageDAO.sendMessage(message);
		
		json = "{\"receiveId\": \"" + receiveId + "\", \"sendName\": \"" + sendName +"\"}";
		
		return json;
	}
}
