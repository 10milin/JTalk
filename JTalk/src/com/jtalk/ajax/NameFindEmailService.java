package com.jtalk.ajax;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.dao.MemberDAO;

public class NameFindEmailService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String json = null;
		
		String name = request.getParameter("name");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		ArrayList<String> email = memberDAO.nameFindEmail(name);
		
		
		return json;
	}

}
