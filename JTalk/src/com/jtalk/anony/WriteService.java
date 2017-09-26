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
		
		String content = request.getParameter("content");
		
		AnonyDTO anony = new AnonyDTO();
		anony.setWriterId("anony");
		anony.setContent(content);
		
		AnonyDAO dao = AnonyDAO.getInstance();
		dao.insertAnony(anony);
		
		resURL = "/anony.action?command=anony";
		
		return resURL;
	}

}
