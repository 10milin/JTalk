package com.jtalk.service.message;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.MessageDAO;
import com.jtalk.dao.TradeDAO;
import com.jtalk.dto.MemberDTO;

public class DeleteChoiceService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = "/pages/profile/profile.jsp";
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		TradeDAO tradeDAO = TradeDAO.getInstance();
		ArrayList marketList = tradeDAO.getMarketList(member.getEmail());
		
		request.setAttribute("marketList", marketList);
		
		String[] checked = request.getParameterValues("selected");
		
		if(checked != null) {
			MessageDAO messageDAO = MessageDAO.getInstance();
			for(int i = 0; i<checked.length; i++) {
				messageDAO.deleteMessage(Integer.parseInt(checked[i]));
			}
		}
		
		return resURL;
	}

}
