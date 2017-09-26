package com.jtalk.action;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.NoticeDTO;

public class IndexAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/main.jsp";
		ServletContext ctx =  request.getServletContext();
		ctx.setAttribute("version", "Alpha");
		
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		ArrayList<NoticeDTO> notice = noticeDAO.getAllNotice();
		if(notice.size() != 0) {
			request.setAttribute("newNotice", notice.get(0));
		}
		return resURL;
	}
	
}
