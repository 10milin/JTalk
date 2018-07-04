package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.service.notice.DeleteService;
import com.jtalk.service.notice.DetailService;
import com.jtalk.service.notice.DownloadService;
import com.jtalk.service.notice.ModifyFormService;
import com.jtalk.service.notice.ModifyService;
import com.jtalk.service.notice.NoticeService;
import com.jtalk.service.notice.WriteService;

public class NoticeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/notice/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "notice": service = new NoticeService(); break;
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
