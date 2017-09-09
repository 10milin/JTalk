package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.notice.NoticeService;
import com.jtalk.notice.SearchService;
import com.jtalk.notice.WriteService;

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
			case "notice": service = new NoticeService(); break;
			case "search": service = new SearchService(); break;
			case "write": service = new WriteService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}

		return resURL;
	}

}
