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
import com.jtalk.notice.*;

public class NoticeAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/notice/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "notice": service = new NoticeService(); break;
			case "detail": service = new DetailService(); break;
			case "write": service = new WriteService(); break;
			case "modify": service = new ModifyService(); break;
			case "delete": service = new DeleteService(); break;
			case "download": service = new DownloadService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
		
		//알림창
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
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
