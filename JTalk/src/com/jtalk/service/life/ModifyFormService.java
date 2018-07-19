package com.jtalk.service.life;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.LifeDAO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.LifeDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		LifeDAO dao = LifeDAO.getInstance();
		LifeDTO notice = dao.getLife(num);
		
		request.setAttribute("life", notice);
		
		resURL = "/pages/life/modify.jsp";
		
		return resURL;
	}

}
