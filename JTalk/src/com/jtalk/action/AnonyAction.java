package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.service.anony.AnonyService;
import com.jtalk.service.anony.DeleteService;
import com.jtalk.service.anony.WriteService;

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
				case "write": service = new WriteService(); break;
				case "delete": service =  new DeleteService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
		
		return resURL;
	}

}
