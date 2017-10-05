package com.jtalk.life;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.LifeDAO;
import com.jtalk.dao.NewCommentDAO;

public class DeleteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		LifeDAO dao = LifeDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		newDAO.deleteNew("life", num);
		commentDAO.postDeleteComment("life", num);
		dao.deleteLife(num);
		
		resURL = "life.action?command=life";
		
		return resURL;
	}
}
