package com.jtalk.service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.LogDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.LogDTO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dto.NoticeDTO;
import com.jtalk.dto.ProjectDTO;

public class DeleteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		if(member != null) {
			if(member.getActive().equals("2") || member.getActive().equals("3")) {
				LogDAO logDao = LogDAO.getInstance();
				NoticeDTO dto = dao.getNotice(num);
				
				if(!member.getEmail().equals(dto.getWriterId())) {
					LogDTO log = new LogDTO();
					log.setBoard("공지사항");
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
		
		newDAO.deleteNew("notice", num);
		commentDAO.postDeleteComment("notice", num);
		dao.deleteNotice(num);
		
		resURL = "notice.action?command=notice";
		
		return resURL;
	}
}
