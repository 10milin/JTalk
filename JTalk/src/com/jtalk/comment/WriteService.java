package com.jtalk.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dto.CommentDTO;

public class WriteService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		String tableName = request.getParameter("tableName");
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		String writerId = request.getParameter("writerId");
		String writerName = request.getParameter("writerName");
		String content = request.getParameter("content");
		
		CommentDTO comment = new CommentDTO();
		comment.setTableName(tableName);
		comment.setPostNum(postNum);
		comment.setWriterId(writerId);
		comment.setWriterName(writerName);
		comment.setContent(content);
		
		CommentDAO dao = CommentDAO.getInstance();
		
		dao.insertComment(comment);
		
		
		resURL = "/notice.action?command=detail&num=" + postNum;
		
		return resURL;
	}
}
