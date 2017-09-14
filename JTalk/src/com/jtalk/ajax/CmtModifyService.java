package com.jtalk.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.dao.CommentDAO;

public class CmtModifyService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("content");
		
		CommentDAO dao = CommentDAO.getInstance();
		
		int result = dao.modifyComment(content, num);
		
		json = "{\"result\": \"" + result +"\"}";
		
		return json;
	}

}
