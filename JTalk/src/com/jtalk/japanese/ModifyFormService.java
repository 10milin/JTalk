package com.jtalk.japanese;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dto.JapaneseDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		JapaneseDAO dao = JapaneseDAO.getInstance();
		JapaneseDTO notice = dao.getJapanese(num);
		
		request.setAttribute("japanese", notice);
		
		resURL = "/pages/japanese/modify.jsp";
		
		return resURL;
	}

}
