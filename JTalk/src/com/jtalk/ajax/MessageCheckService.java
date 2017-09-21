package com.jtalk.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.dao.MessageDAO;

public class MessageCheckService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		MessageDAO dto = MessageDAO.getInstance();
		dto.readMessage(num);
		
		json = "{\"result\": \"" + "1" +"\"}";
		
		return json;
	}

}
