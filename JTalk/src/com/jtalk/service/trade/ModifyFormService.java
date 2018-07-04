package com.jtalk.service.trade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.TradeDAO;
import com.jtalk.dto.TradeDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		TradeDAO dao = TradeDAO.getInstance();
		TradeDTO trade = dao.getTrade(num);
		
		request.setAttribute("trade", trade);
		
		resURL = "/pages/trade/modify.jsp";
		
		return resURL;
	}

}
