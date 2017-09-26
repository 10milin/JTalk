package com.jtalk.ajax;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dao.MessageDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dto.CommentDTO;

public class AnonyCmtDeleteService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		int num = Integer.parseInt(request.getParameter("num"));
		int result = 0;
		
		CommentDAO dao = CommentDAO.getInstance();

		result = dao.deleteComment(num);
				
		json = "{\"result\": \"" + result +"\"}";
		
		return json;
	}

}
