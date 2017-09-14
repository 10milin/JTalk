package com.jtalk.action;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Action;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dto.NewCommentDTO;

public class IndexAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/main.jsp";
		ServletContext ctx =  request.getServletContext();
		ctx.setAttribute("version", "Alpha");
		
		//알림창
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		if(member != null) {
			NewCommentDAO newDAO = NewCommentDAO.getInstance();
			ArrayList<NewCommentDTO> newComment = newDAO.getOneNew(member.getEmail());
			int allNew = newDAO.getAllNew(member.getEmail());
			
			request.setAttribute("allNew", allNew);
			request.setAttribute("newComment", newComment);
		}
		
		return resURL;
	}
	
}
