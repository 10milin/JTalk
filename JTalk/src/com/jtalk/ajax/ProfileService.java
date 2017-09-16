package com.jtalk.ajax;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jtalk.core.Action;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.MemberDTO;

public class ProfileService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		
		String email = request.getParameter("email");
		
		JSONObject jsonObject = new JSONObject();
		
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getMember(email);
		
		SimpleDateFormat sdp = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdp.format(dto.getRegisterDate());
		
		jsonObject.put("email", dto.getEmail());
		jsonObject.put("name", dto.getName());
		jsonObject.put("period", String.valueOf(dto.getPeriod()));
		jsonObject.put("ban", dto.getBan());
		jsonObject.put("active", dto.getActive());
		jsonObject.put("registerDate", date);
		jsonObject.put("profile", dto.getProfile());
		jsonObject.put("pr", dto.getPr());
		
		json = jsonObject.toJSONString();
		
		return json;
	}

}
