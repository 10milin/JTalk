package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class RecoveryService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/login/recovery.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			
			switch(command) {
			case "action":
				
				break;
			default:
				
			}
			
		}

		return resURL;
	}

}
