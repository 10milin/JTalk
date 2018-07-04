package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.service.it.DeleteService;
import com.jtalk.service.it.DetailService;
import com.jtalk.service.it.DownloadService;
import com.jtalk.service.it.ItService;
import com.jtalk.service.it.ModifyFormService;
import com.jtalk.service.it.ModifyService;
import com.jtalk.service.it.WriteService;

public class ItAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/it/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "it": service = new ItService(); break;
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
