package com.jtalk.ajax;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jtalk.core.Action;
import com.jtalk.dao.AnonyDAO;
import com.jtalk.dao.AwesomeDAO;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.AnonyDTO;
import com.jtalk.dto.CommentDTO;
import com.jtalk.dto.MemberDTO;

public class AnonyPageService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		
		String currentPage = request.getParameter("page");
		
		JSONObject jsonObject = new JSONObject();
		JSONArray anonyArray = new JSONArray();
		JSONArray commentArray = new JSONArray();
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String active = member.getActive();
		
		String totalPage = String.valueOf(1); //전체 페이지의 초기값
		
		AnonyDAO dao = AnonyDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		ArrayList<AnonyDTO> anonyList;
		ArrayList<Integer> countList = new ArrayList<Integer>();
		
		anonyList = dao.getAllAnony();
		int size = anonyList.size();
		for(int i = Integer.parseInt(currentPage)*5; i < Integer.parseInt(currentPage)*5+5; i++) {
			if(i >= size) break;
			AnonyDTO dto = anonyList.get(i);

			JSONObject jsonDto = new JSONObject();
			jsonDto.put("num", String.valueOf(dto.getNum()));
			jsonDto.put("content", dto.getContent());
			SimpleDateFormat sdp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdp.format(dto.getWriteDate());
			jsonDto.put("writeDate", date);
			
			AwesomeDAO awesomeDAO = AwesomeDAO.getInstance();
			int awesomeCount = awesomeDAO.getLikeCount(dto.getNum());		
			if(awesomeDAO.checkLike(dto.getNum(), member.getEmail())) {
				jsonDto.put("checklike", String.valueOf("like"));
			}
			jsonDto.put("awesome", String.valueOf(awesomeCount));
			jsonDto.put("commentCount", String.valueOf(commentDAO.countComment("anony", anonyList.get(i).getNum())));
			anonyArray.add(jsonDto);
			
			JSONArray thisArray = new JSONArray();
			ArrayList<CommentDTO> cmtList = commentDAO.getCommentList("anony", dto.getNum());
			for(int j = 0; j <cmtList.size(); j++) {
				CommentDTO cmtDto = cmtList.get(j);
				JSONObject jsonCmtDto = new JSONObject();
				jsonCmtDto.put("num", String.valueOf(cmtDto.getNum()));
				jsonCmtDto.put("content", cmtDto.getContent());
				String cmtDate = sdp.format(cmtDto.getWriteDate());
				jsonCmtDto.put("writeDate", cmtDate);
				thisArray.add(jsonCmtDto);
			}
			commentArray.add(thisArray);
		}
		jsonObject.put("anony", anonyArray);
		jsonObject.put("comment", commentArray);
		jsonObject.put("active", active);
		json = jsonObject.toJSONString();
		
		return json;
	}

}
