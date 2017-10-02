package com.jtalk.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dao.TradeDAO;
import com.jtalk.dto.MemberDTO;

public class ProFileService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		TradeDAO tradeDAO = TradeDAO.getInstance();
		ArrayList marketList = tradeDAO.getMarketList(member.getEmail());
		
		request.setAttribute("marketList", marketList);

		resURL = "/pages/profile/profile.jsp";

		
		return resURL;
	}

}
