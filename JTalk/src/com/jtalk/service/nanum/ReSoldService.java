package com.jtalk.service.nanum;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.NanumDAO;

public class ReSoldService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		NanumDAO dao = NanumDAO.getInstance();

		dao.modifyisSoldOut(num, "0");
		
		resURL = "nanum.action?command=detail&num=" + num;
		
		return resURL;
	}
}
