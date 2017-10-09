package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.exchange.ExchangeService;
import com.jtalk.exchange.DeleteService;
import com.jtalk.exchange.DetailService;
import com.jtalk.exchange.DownloadService;
import com.jtalk.exchange.ModifyFormService;
import com.jtalk.exchange.ModifyService;
import com.jtalk.exchange.WriteService;

public class ExchangeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/exchange/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "exchange": service = new ExchangeService(); break;
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
