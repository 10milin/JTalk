package com.jtalk.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;

public class DeleteService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
				
		int num = Integer.parseInt(request.getParameter("num"));
		
		CommentDAO dao = CommentDAO.getInstance();
		
		int postNum = dao.getPostNum(num);
		dao.deleteComment(num);
		
		resURL = "/notice.action?command=detail&num=" + postNum;
		
		return resURL;
	}

}
