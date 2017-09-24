package com.jtalk.ajax;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jtalk.core.Action;
import com.jtalk.dao.AnonyDAO;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.AnonyDTO;
import com.jtalk.dto.MemberDTO;

public class AnonyPageService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		
		String currentPage = request.getParameter("page");
		
		JSONObject jsonObject = new JSONObject();
		
		String totalPage = String.valueOf(1); //전체 페이지의 초기값
		
		AnonyDAO dao = AnonyDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		ArrayList<AnonyDTO> anonyList;
		ArrayList<AnonyDTO> currentList = new ArrayList<AnonyDTO>();
		ArrayList<Integer> countList = new ArrayList<Integer>();
		
		anonyList = dao.getAllAnony();
		
		int total = anonyList.size() / 5;
		
		if(anonyList.size() % 5 != 0)
		{
			total++;
		}
		
		if(total == 0)
		{
			total++;
		}
		
		for(int i = 0 ; i < Integer.parseInt(currentPage) ; i++)
		{
			if(anonyList.size() > i*5)
			{
				for(int j = i*5 ; j < (i*5)+5 && j < anonyList.size() ; j++)
				{
					currentList.add(anonyList.get(j));
					countList.add(commentDAO.countComment("anony", anonyList.get(j).getNum()));
				}
			}
			if(i != Integer.parseInt(currentPage) - 1)
			{
				currentList = new ArrayList<AnonyDTO>();
				countList = new ArrayList<Integer>();
			}
		}
		
		totalPage = String.valueOf(total);
		
		
		
		
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
