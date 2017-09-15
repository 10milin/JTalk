package com.jtalk.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Action;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.NewCommentDAO;

public class NewCmtResetService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		
		String email = request.getParameter("email");
		
		NewCommentDAO dao = NewCommentDAO.getInstance();
		dao.resetAll(email);
		
		HttpSession session = request.getSession();
		session.removeAttribute("allNew");
		session.removeAttribute("newComment");
		session.removeAttribute("tableName");
		
		json = "{\"result\": \"" + "1" +"\"}";
		
		return json;
	}

}
