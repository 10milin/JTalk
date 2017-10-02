package com.jtalk.food;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.FoodDAO;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dto.FoodDTO;
import com.jtalk.dto.JapaneseDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		FoodDAO dao = FoodDAO.getInstance();
		FoodDTO notice = dao.getFood(num);
		
		request.setAttribute("food", notice);
		
		resURL = "/pages/food/modify.jsp";
		
		return resURL;
	}

}
