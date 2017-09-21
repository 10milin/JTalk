package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.anony.AnonyService;
import com.jtalk.core.Action;
import com.jtalk.core.Service;

public class AnonyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {

			case "anony": service = new AnonyService(); break;

			
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
		
		return resURL;
	}

}
