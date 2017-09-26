package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.trade.TradeService;

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
				case "trade": service = new TradeService(); break;
			}
			
			if(service != null) resURL = service.process(request, response);
		}
		
		return resURL;
	}

}