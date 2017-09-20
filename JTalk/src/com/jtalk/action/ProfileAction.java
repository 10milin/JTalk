package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.member.PfModifyService;
import com.jtalk.member.PwChangeService;

public class ProfileAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = "/pages/profile/profile.jsp";
		
		String command = request.getParameter("command");

		if(command != null) {
			Service service = null;
			switch(command) {
				case "passform": resURL = "/pages/profile/password.jsp"; break;
				case "profileform": resURL = "/pages/profile/modify.jsp"; break;
				case "messagetab" : request.setAttribute("tab", "message"); break;
				case "passchange": service = new PwChangeService(); break;
				case "profilemodify": service = new PfModifyService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
				
		return resURL;
	}

}
