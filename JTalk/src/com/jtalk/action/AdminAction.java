package com.jtalk.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.admin.AdminService;
import com.jtalk.admin.LogService;
import com.jtalk.admin.MainService;
import com.jtalk.admin.MemberService;
import com.jtalk.admin.StorageService;
import com.jtalk.core.Action;
import com.jtalk.core.Service;

public class AdminAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		ServletContext ctx =  request.getServletContext();
		ctx.setAttribute("version", "Alpha");
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
				case "main": service = new MainService(); break;
				case "log" : service = new LogService(); break;
				case "member" : service = new MemberService(); break;
				case "admin" : service = new AdminService(); break;
				case "storage" : service = new StorageService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
		
		return resURL;
	}
	
}
