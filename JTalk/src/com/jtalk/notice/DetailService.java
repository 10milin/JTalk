package com.jtalk.notice;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
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
		
		//쿠키를 생성하여 한번 읽은 글은 조회수 증가가 되지 않도록 막는다.
		Cookie[] cookie = request.getCookies();
		boolean check = false;
		
		for(int i = 0; i < cookie.length; i++) {
			if(cookie[i].getName().equals("notice")) {
				if(cookie[i].getValue().equals(String.valueOf(num))) {
					check = true;
					break;
				}
			}
		}
		
		if(!check) {
			Cookie noticeCookie = new Cookie("notice", String.valueOf(num));
			noticeCookie.setMaxAge(60 * 60 * 24);
			response.addCookie(noticeCookie);
			noticeDAO.hitUp(num);
		}
		
		//게시글과 댓글을 읽어옴
		NoticeDTO notice = noticeDAO.getNotice(num);
		ArrayList<CommentDTO> commentList = commentDAO.getCommentList("notice", num);
		ArrayList<String> profileList = new ArrayList<String>();
		
		//글쓴이가 글을 읽은 경우 새 댓글 알림 초기화
		if(member.getEmail().equals(notice.getWriterId())) {
			newDAO.resetNew("notice", num);
		}
		
		//댓글의 프로필 사진 파일명
		for(int i = 0; i < commentList.size(); i++) {
			profileList.add(memberDAO.getPicture(commentList.get(i).getWriterId()));
		}
		
		//댓글의 총 갯수
		int countComment = commentDAO.countComment("notice", num);
		
		request.setAttribute("notice", notice);
		request.setAttribute("commentList", commentList);
		request.setAttribute("profileList", profileList);
		request.setAttribute("countComment", countComment);
				
		resURL = "/pages/notice/detail.jsp";
		
		return resURL;
	}

}
