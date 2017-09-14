package com.jtalk.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.CommentDTO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dto.NoticeDTO;

public class DetailService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		NoticeDTO notice = noticeDAO.getNotice(num);
		ArrayList<CommentDTO> commentList = commentDAO.getCommentList("notice", num);
		ArrayList<String> profileList = new ArrayList<String>();
		
		if(member.getEmail().equals(notice.getWriterId())) {
			newDAO.resetNew("notice", num);
		}
		
		for(int i = 0; i < commentList.size(); i++) {
			profileList.add(memberDAO.getPicture(commentList.get(i).getWriterId()));
		}
		int countComment = commentDAO.countComment("notice", num);
		request.setAttribute("notice", notice);
		request.setAttribute("commentList", commentList);
		request.setAttribute("profileList", profileList);
		request.setAttribute("countComment", countComment);
				
		resURL = "/pages/notice/detail.jsp";
		
		return resURL;
	}

}
