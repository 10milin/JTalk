package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.service.trade.DeleteService;
import com.jtalk.service.trade.DetailService;
import com.jtalk.service.trade.ModifyFormService;
import com.jtalk.service.trade.ModifyService;
import com.jtalk.service.trade.ReSoldService;
import com.jtalk.service.trade.SoldoutService;
import com.jtalk.service.trade.TradeService;
import com.jtalk.service.trade.WriteService;

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
				case "soldout" : service = new SoldoutService(); break;
				case "resold" : service = new ReSoldService(); break;
			}
			
			if(service != null) resURL = service.process(request, response);
		}
		
		return resURL;
	}

}
