package com.jtalk.service.nanum;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.NanumDAO;
import com.jtalk.dto.NanumDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		NanumDAO dao = NanumDAO.getInstance();
		NanumDTO trade = dao.getNanum(num);
		
		request.setAttribute("nanum", trade);
		
		resURL = "/pages/nanum/modify.jsp";
		
		return resURL;
	}

}
