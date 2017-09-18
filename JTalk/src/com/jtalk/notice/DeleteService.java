package com.jtalk.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.NoticeDAO;

public class DeleteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		newDAO.deleteNew("notice", num);
		commentDAO.postDeleteComment("notice", num);
		dao.deleteNotice(num);
		
		resURL = "notice.action?command=notice";
		
		return resURL;
	}
}
