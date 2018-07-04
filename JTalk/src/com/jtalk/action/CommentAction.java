package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.service.comment.DeleteService;
import com.jtalk.service.comment.WriteService;
public class CommentAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "write": service = new WriteService(); break;
			case "delete": service = new DeleteService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}

		return resURL;
	}

}
