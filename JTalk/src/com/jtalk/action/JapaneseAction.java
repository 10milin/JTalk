package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.service.japanese.DeleteService;
import com.jtalk.service.japanese.DetailService;
import com.jtalk.service.japanese.DownloadService;
import com.jtalk.service.japanese.JapaneseService;
import com.jtalk.service.japanese.ModifyFormService;
import com.jtalk.service.japanese.ModifyService;
import com.jtalk.service.japanese.WriteService;

public class JapaneseAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/japanese/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "japanese": service = new JapaneseService(); break;
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
