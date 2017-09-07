package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class NoticeService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/notice/notice.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			/* Params */
			
			String currentPage = request.getParameter("page"); // 현재 보여주는 페이지
			String totalPage = String.valueOf(30); // DB를 통해 페이지수를 계산하여 처리
			
			switch(command) {
			case "action":
				request.setAttribute("currentPage", 1);
				request.setAttribute("totalPage", totalPage);
				break;
			case "page":
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("totalPage", totalPage);
				break;
			case "search":
				request.setAttribute("currentPage", 1);
				break;
			default:
				
			}
			
		}

		return resURL;
	}

}
