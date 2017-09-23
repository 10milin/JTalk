package com.jtalk.anony;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.AnonyDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dto.AnonyDTO;
import com.jtalk.dto.MemberDTO;

public class WriteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		HttpSession session = request.getSession();
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String content = request.getParameter("content");
		String writerId = member.getEmail();
		
		AnonyDTO anony = new AnonyDTO();
		anony.setWriterId(writerId);
		anony.setContent(content);
		
		AnonyDAO dao = AnonyDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		dao.insertAnony(anony);
		
		newDAO.insertNew("anony", dao.getLastNum(), writerId);
		resURL = "/anony.action?command=anony";
		
		return resURL;
	}

}
