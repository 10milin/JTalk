package com.jtalk.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.CommentDTO;
import com.jtalk.dto.NoticeDTO;

public class DetailService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		NoticeDTO notice = dao.getNotice(num);
		ArrayList<CommentDTO> commentList = commentDAO.getCommentList("notice", num);
		
		request.setAttribute("notice", notice);
		request.setAttribute("commentList", commentList);
		
		resURL = "/pages/notice/detail.jsp";
		
		return resURL;
	}

}
