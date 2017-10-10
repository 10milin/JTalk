package com.jtalk.we;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.WeDAO;

public class DeleteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		WeDAO dao = WeDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		newDAO.deleteNew("we", num);
		commentDAO.postDeleteComment("we", num);
		dao.deleteWe(num);
		
		resURL = "we.action?command=we";
		
		return resURL;
	}
}