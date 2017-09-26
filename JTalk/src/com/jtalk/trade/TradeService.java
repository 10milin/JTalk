package com.jtalk.trade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class TradeService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = "/pages/trade/trade.jsp";
		
		return resURL;
	}

}
