package com.jtalk.ajax;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jtalk.core.Action;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.MemberDTO;

public class NameFindEmailService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		
		String name = request.getParameter("name");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		ArrayList<MemberDTO> email = memberDAO.nameFindEmail(name);
		
		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i<email.size(); i++) {
			MemberDTO member = email.get(i);
			JSONObject memberDTO = new JSONObject();
			memberDTO.put("period", member.getPeriod());
			memberDTO.put("name", member.getName());
			memberDTO.put("email", member.getEmail());
			jsonArray.add(memberDTO);
		}
		
		json = jsonArray.toJSONString();
		
		return json;
	}

}
