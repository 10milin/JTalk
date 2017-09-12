package com.jtalk.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.NoticeDTO;

public class DetailService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeDTO notice = dao.getNotice(num);
		
		request.setAttribute("notice", notice);
		
		resURL = "/pages/notice/detail.jsp";
		
		return resURL;
	}

}
