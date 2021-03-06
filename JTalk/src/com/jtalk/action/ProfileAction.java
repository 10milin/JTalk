package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.service.admin.AdminAccessService;
import com.jtalk.service.member.PfModifyService;
import com.jtalk.service.member.ProFileService;
import com.jtalk.service.member.PwChangeService;

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
				case "profile" : service = new ProFileService(); break;
				case "passchange": service = new PwChangeService(); break;
				case "profilemodify": service = new PfModifyService(); break;
				case "adminaccess" : service = new AdminAccessService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
				
		return resURL;
	}

}
