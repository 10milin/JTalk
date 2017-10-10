package com.jtalk.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.DatabaseDAO;
import com.jtalk.dao.FoodDAO;
import com.jtalk.dao.ItDAO;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.LifeDAO;
import com.jtalk.dao.LogDAO;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.MemberDTO;

public class MainService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = "/pages/admin/main.jsp";
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		LogDAO logDAO = LogDAO.getInstance();
		DatabaseDAO dbDAO = DatabaseDAO.getInstance();
		ItDAO itDAO = ItDAO.getInstance();
		JapaneseDAO japaneseDAO = JapaneseDAO.getInstance();
		FoodDAO foodDAO = FoodDAO.getInstance();
		LifeDAO lifeDAO = LifeDAO.getInstance();
		
		int itSize = itDAO.getCount();
		int japaneseSize = japaneseDAO.getCount();
		int foodSize = foodDAO.getCount();
		int lifeSize = lifeDAO.getCount();
		
		int inforSize = itSize + japaneseSize + foodSize + lifeSize;
		
		request.setAttribute("memberCount", memberDAO.getMemberCount());
		request.setAttribute("memberAdminCount", memberDAO.getMemberAdminCount());
		request.setAttribute("logCount", logDAO.getLogCount());
		request.setAttribute("dbCapacity", dbDAO.getDatabaseCapacity());
		
		request.setAttribute("ItSize", itSize);
		request.setAttribute("JapaneseSize", japaneseSize);
		request.setAttribute("FoodSize", foodSize);
		request.setAttribute("LifeSize", lifeSize);
		request.setAttribute("InforSize", inforSize);
		
		request.setAttribute("ItNew", itDAO.getNewCount());
		request.setAttribute("JapaneseNew", japaneseDAO.getNewCount());
		request.setAttribute("FoodNew", foodDAO.getNewCount());
		request.setAttribute("LifeNew", lifeDAO.getNewCount());
		
		
		return resURL;
	}

}
