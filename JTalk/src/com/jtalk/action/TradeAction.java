package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.trade.DeleteService;
import com.jtalk.trade.DetailService;
import com.jtalk.trade.ModifyFormService;
import com.jtalk.trade.ModifyService;
import com.jtalk.trade.TradeService;
import com.jtalk.trade.WriteService;

public class TradeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null)
		{
			Service service = null;
			switch(command)
			{
				case "writeForm" : resURL = "/pages/trade/write.jsp"; break;
				case "trade": service = new TradeService(); break;
				case "write": service = new WriteService(); break;
				case "detail": service = new DetailService(); break;
				case "delete" : service = new DeleteService(); break;
				case "modifyform": service = new ModifyFormService(); break;
				case "modify" : service = new ModifyService(); break;
			}
			
			if(service != null) resURL = service.process(request, response);
		}
		
		return resURL;
	}

}
