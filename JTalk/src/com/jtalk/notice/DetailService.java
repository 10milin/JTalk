package com.jtalk.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.CommentDTO;
import com.jtalk.dto.NoticeDTO;

public class DetailService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		NoticeDTO notice = noticeDAO.getNotice(num);
		ArrayList<CommentDTO> commentList = commentDAO.getCommentList("notice", num);
		ArrayList<String> profileList = new ArrayList<String>();
		
		for(int i = 0; i < commentList.size(); i++) {
			profileList.add(memberDAO.getPicture(commentList.get(i).getWriterId()));
		}
		
		request.setAttribute("notice", notice);
		request.setAttribute("commentList", commentList);
		request.setAttribute("profileList", profileList);
		
		resURL = "/pages/notice/detail.jsp";
		
		return resURL;
	}

}
