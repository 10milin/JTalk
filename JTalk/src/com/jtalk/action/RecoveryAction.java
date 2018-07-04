package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.service.member.RecoveryService;
import com.jtalk.core.Action;

public class RecoveryAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/login/recovery.jsp";
		request.setAttribute("validate", false);
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "recovery": service = new RecoveryService(); break;
			
			}
			if(service !=null) resURL = service.process(request, response);
		}
		return resURL;
	}
}
