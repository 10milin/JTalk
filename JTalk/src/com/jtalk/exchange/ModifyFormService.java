package com.jtalk.exchange;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.ExchangeDAO;
import com.jtalk.dto.ExchangeDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ExchangeDAO dao = ExchangeDAO.getInstance();
		ExchangeDTO notice = dao.getExchange(num);
		
		request.setAttribute("exchange", notice);
		
		resURL = "/pages/exchange/modify.jsp";
		
		return resURL;
	}

}
