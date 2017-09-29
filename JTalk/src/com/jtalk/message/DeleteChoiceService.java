package com.jtalk.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.MessageDAO;

public class DeleteChoiceService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = "/pages/profile/profile.jsp";
		
		String[] checked = request.getParameterValues("selected");
		
		if(checked != null) {
			MessageDAO messageDAO = MessageDAO.getInstance();
			for(int i = 0; i<checked.length; i++) {
				messageDAO.deleteMessage(Integer.parseInt(checked[i]));
			}
		}
		
		return resURL;
	}

}
