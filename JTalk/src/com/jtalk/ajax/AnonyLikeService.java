package com.jtalk.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Action;
import com.jtalk.dao.AnonyDAO;
import com.jtalk.dao.AwesomeDAO;
import com.jtalk.dto.MemberDTO;

public class AnonyLikeService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String email = member.getEmail();
		int result = 0;
		
		AwesomeDAO awesomeDAO = AwesomeDAO.getInstance();
		AnonyDAO anonyDAO = AnonyDAO.getInstance();
		
		if(awesomeDAO.checkLike(postNum, email)) {
			awesomeDAO.deleteLike(postNum, email);
			anonyDAO.updateLike(awesomeDAO.getLikeCount(postNum), postNum);
		}else {
			awesomeDAO.insertLike(postNum, email);
			anonyDAO.updateLike(awesomeDAO.getLikeCount(postNum), postNum);
		}
		
		result = awesomeDAO.getLikeCount(postNum);
		
		json = "{\"result\": \"" + result +"\"}";
		
		return json;
	}

}
