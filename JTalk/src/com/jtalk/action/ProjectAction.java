package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.project.ProjectService;
import com.jtalk.project.DeleteService;
import com.jtalk.project.DetailService;
import com.jtalk.project.DownloadService;
import com.jtalk.project.ModifyFormService;
import com.jtalk.project.ModifyService;
import com.jtalk.project.WriteService;

public class ProjectAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/project/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "project": service = new ProjectService(); break;
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
