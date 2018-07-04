package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.service.we.DeleteService;
import com.jtalk.service.we.DetailService;
import com.jtalk.service.we.DownloadService;
import com.jtalk.service.we.ModifyFormService;
import com.jtalk.service.we.ModifyService;
import com.jtalk.service.we.WeService;
import com.jtalk.service.we.WriteService;

public class WeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/we/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "we": service = new WeService(); break;
			case "detail": service = new DetailService(); break;
			case "write": service = new WriteService(); break;
			case "modify": service = new ModifyService(); break;
			case "delete": service = new DeleteService(); break;
			case "download": service = new DownloadService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
		
		return resURL;
	}

}
