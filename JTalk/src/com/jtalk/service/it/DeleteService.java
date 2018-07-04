package com.jtalk.service.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dto.ItDTO;
import com.jtalk.dto.LogDTO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dao.ItDAO;
import com.jtalk.dao.LogDAO;

public class DeleteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ItDAO dao = ItDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		if(member != null) {
			if(member.getActive().equals("2") || member.getActive().equals("3")) {
				LogDAO logDao = LogDAO.getInstance();
				ItDTO dto = dao.getIt(num);
				
				if(!member.getEmail().equals(dto.getWriterId())) {
					LogDTO log = new LogDTO();
					log.setBoard("IT");
					log.setTitle(dto.getTitle());
					log.setContent(dto.getContent());
					log.setWriterId(dto.getWriterId());
					log.setWriterName(dto.getWriterName());
					log.setDeleteId(member.getEmail());
					log.setDeleteName(member.getName());
					
					logDao.insertLog(log);
				}
			}
		}
		
		newDAO.deleteNew("it", num);
		commentDAO.postDeleteComment("it", num);
		dao.deleteIt(num);
		
		resURL = "it.action?command=it";
		
		return resURL;
	}
}
