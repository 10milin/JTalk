package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.speech.DeleteService;
import com.jtalk.speech.DetailService;
import com.jtalk.speech.DownloadService;
import com.jtalk.speech.ModifyFormService;
import com.jtalk.speech.ModifyService;
import com.jtalk.speech.WriteService;
import com.jtalk.speech.SpeechService;

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
