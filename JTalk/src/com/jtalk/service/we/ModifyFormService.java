package com.jtalk.service.we;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.WeDAO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.WeDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		WeDAO dao = WeDAO.getInstance();
		WeDTO notice = dao.getWe(num);
		
		request.setAttribute("we", notice);
		
		resURL = "/pages/we/modify.jsp";
		
		return resURL;
	}

}
