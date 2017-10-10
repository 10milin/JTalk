package com.jtalk.project;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.ProjectDAO;
import com.jtalk.dao.StudyDAO;
import com.jtalk.dao.WeDAO;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dto.CommentDTO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dto.ProjectDTO;
import com.jtalk.dto.StudyDTO;
import com.jtalk.dto.WeDTO;

public class DetailService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		ProjectDAO projectDAO = ProjectDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		//쿠키를 생성하여 한번 읽은 글은 조회수 증가가 되지 않도록 막는다.
		Cookie[] cookie = request.getCookies();
		boolean check = false;
		
		for(int i = 0; i < cookie.length; i++) {
			if(cookie[i].getName().equals("project")) {
				if(cookie[i].getValue().equals(String.valueOf(num))) {
					check = true;
					break;
				}
			}
		}
		
		if(!check) {
			long today = System.currentTimeMillis();
			Calendar tomorrow = Calendar.getInstance();
			
			tomorrow.add(Calendar.DAY_OF_MONTH, 1);
			tomorrow.set(Calendar.HOUR_OF_DAY, 0);
			tomorrow.set(Calendar.MINUTE, 0);
			tomorrow.set(Calendar.SECOND, 0);
			tomorrow.set(Calendar.MILLISECOND, 0);
			
			long to = tomorrow.getTime().getTime();
						
			int time = (int)(to - today) / 1000;
			Cookie noticeCookie = new Cookie("project", String.valueOf(num));
			
			noticeCookie.setMaxAge(time);
			response.addCookie(noticeCookie);
			projectDAO.hitUp(num);
		}
		
		//게시글과 댓글을 읽어옴
		ProjectDTO notice = projectDAO.getProject(num);
		ArrayList<CommentDTO> commentList = commentDAO.getCommentList("project", num);
		ArrayList<String> profileList = new ArrayList<String>();
		
		//글쓴이가 글을 읽은 경우 새 댓글 알림 초기화
		if(member.getEmail().equals(notice.getWriterId())) {
			newDAO.resetNew("project", num);
		}
		
		//댓글의 프로필 사진 파일명
		for(int i = 0; i < commentList.size(); i++) {
			profileList.add(memberDAO.getPicture(commentList.get(i).getWriterId()));
		}
		
		//댓글의 총 갯수
		int countComment = commentDAO.countComment("project", num);
		
		request.setAttribute("project", notice);
		request.setAttribute("commentList", commentList);
		request.setAttribute("profileList", profileList);
		request.setAttribute("countComment", countComment);
				
		resURL = "/pages/project/detail.jsp";
		
		return resURL;
	}

}