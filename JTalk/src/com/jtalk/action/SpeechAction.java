package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.service.speech.DeleteService;
import com.jtalk.service.speech.DetailService;
import com.jtalk.service.speech.DownloadService;
import com.jtalk.service.speech.ModifyFormService;
import com.jtalk.service.speech.ModifyService;
import com.jtalk.service.speech.SpeechService;
import com.jtalk.service.speech.WriteService;

public class SpeechAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/speech/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "speech": service = new SpeechService(); break;
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
