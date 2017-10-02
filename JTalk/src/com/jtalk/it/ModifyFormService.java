package com.jtalk.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.ItDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.ItDTO;
import com.jtalk.dto.NoticeDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ItDAO dao = ItDAO.getInstance();
		ItDTO notice = dao.getIt(num);
		
		request.setAttribute("it", notice);
		
		resURL = "/pages/it/modify.jsp";
		
		return resURL;
	}

}
