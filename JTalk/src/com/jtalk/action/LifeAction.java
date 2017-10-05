package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.life.DeleteService;
import com.jtalk.life.DetailService;
import com.jtalk.life.DownloadService;
import com.jtalk.life.ModifyFormService;
import com.jtalk.life.ModifyService;
import com.jtalk.life.LifeService;
import com.jtalk.life.WriteService;

public class LifeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/life/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "life": service = new LifeService(); break;
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
