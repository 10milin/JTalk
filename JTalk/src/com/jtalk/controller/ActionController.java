package com.jtalk.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.action.*;
import com.jtalk.core.Action;
import com.jtalk.dao.MessageDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dto.MessageDTO;
import com.jtalk.dto.NewCommentDTO;
import com.jtalk.validation.*;

@WebServlet("*.action")
public class ActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("/pages/error/404.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/* Encoding setting UTF-8 */
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String action = uri.substring(conPath.length());

		Action service = null;
		String resURL = null;
		
		switch(action) {
		case "/login.action": service = new LoginAction(); break;
		case "/logout.action": service = new LogoutAction(); break;
		case "/recovery.action": service = new RecoveryAction(); break;
		case "/register.action": service = new RegisterAction(); break;
		case "/auth.action" : service = new AuthAction(); break;
		case "/index.action": service = new IndexAction(); break;
		case "/notice.action": service = new NoticeAction(); break;
		case "/profile.action": service = new ProfileAction(); break;
		case "/comment.action" : service = new CommentAction(); break;
		case "/message.action" : service = new MessageAction(); break;
		default : resURL = "/index.action";
		}

		
		if(service !=null) resURL = service.execute(request, response);
		
		if(SessionValidator.validate(request, response)) {
			resURL = "/pages/login/login.jsp";
		}else {
			//알림창
			HttpSession session = request.getSession();
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			if(member != null) {
				//새 댓글 알림
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
				
				session.setAttribute("allNew", allNew);
				session.setAttribute("newComment", newComment);
				session.setAttribute("tableName", tableName);
				
				//새 메시지 알림
				MessageDAO messageDAO = MessageDAO.getInstance();
				ArrayList<MessageDTO> newMessageList = messageDAO.getNotReadMessage(member.getEmail());
				ArrayList<MessageDTO> allMessageList = messageDAO.getAllMessage(member.getEmail());
				request.setAttribute("newMessage", newMessageList.size());
				request.setAttribute("newMessageList", newMessageList);
				request.setAttribute("allMessageList", allMessageList);
			}
		}
		ToggleValidator.validate(request, response);
		
		request.getRequestDispatcher(resURL).forward(request, response);
		
	}

}
