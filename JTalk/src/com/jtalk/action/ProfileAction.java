package com.jtalk.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dto.NewCommentDTO;
import com.jtalk.member.PfModifyService;
import com.jtalk.member.PwChangeService;

public class ProfileAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = "/pages/profile/profile.jsp";
		
		String command = request.getParameter("command");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		if(command != null) {
			Service service = null;
			switch(command) {
				case "passform": resURL = "/pages/profile/password.jsp"; break;
				case "profileform": resURL = "/pages/profile/modify.jsp"; break;
				case "passchange": service = new PwChangeService(); break;
				case "profilemodify": service = new PfModifyService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
		
		//알림창
		
		
		if(member != null) {
			NewCommentDAO newDAO = NewCommentDAO.getInstance();
			ArrayList<NewCommentDTO> newComment = newDAO.getOneNew(member.getEmail());
			int allNew = newDAO.getAllNew(member.getEmail());
			ArrayList<String> tableName = new ArrayList<String>();
			
			for(int i = 0; i < newComment.size(); i++) {
				switch(newComment.get(i).getTableName()) {
				case "notice":
					tableName.add("공지사항");
					break;
				}
			}
			
			request.setAttribute("allNew", allNew);
			request.setAttribute("newComment", newComment);
			request.setAttribute("tableName", tableName);
		}
		
		return resURL;
	}

}
