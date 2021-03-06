package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.service.study.DeleteService;
import com.jtalk.service.study.DetailService;
import com.jtalk.service.study.DownloadService;
import com.jtalk.service.study.ModifyFormService;
import com.jtalk.service.study.ModifyService;
import com.jtalk.service.study.StudyService;
import com.jtalk.service.study.WriteService;

public class StudyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/study/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "study": service = new StudyService(); break;
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
