package com.jtalk.we;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dao.WeDAO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dto.NoticeDTO;
import com.jtalk.dto.WeDTO;

public class WeService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		//DB를 통해 ArrayList객체를 받아옴
		String currentPage = request.getParameter("currentPage");
		String search = request.getParameter("search");
		int period = member.getPeriod();
		String totalPage = String.valueOf(1); //전체 페이지의 초기값
		WeDAO dao = WeDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		
		
		ArrayList<WeDTO> noticeList; //전체 목록
		ArrayList<WeDTO> currentList = new ArrayList<WeDTO>(); //현재 페이지 목록
		ArrayList<Integer> countList = new ArrayList<Integer>();
		if(currentPage == null) currentPage = "1";
		if(search == null || search.equals("")){
			//검색하지 않고 전체목록에서 페이지를 넘긴경우
			if(member.getActive().equals("1")) {
				noticeList = dao.getAllWe(period);
			}else {
				noticeList = dao.getAllWe();
			}
			
			
			int total = noticeList.size() / 20; // ArrayList의 사이즈 전체 게시글의 페이지수
			
			if(noticeList.size() % 20 != 0) { //페이징 이후 남아있는 글 확인하여 페이지 할당
				total++;
			}
			
			if(total == 0) { // 게시글이 없는 경우 초기 1페이지
				total++;
			}
			
			for(int i = 0; i < Integer.parseInt(currentPage); i++) {
				if(noticeList.size() > i*20) {
					for(int j = i*20; j < (i*20)+20 && j < noticeList.size(); j++) {
						currentList.add(noticeList.get(j));
						countList.add(commentDAO.countComment("we", noticeList.get(j).getNum()));
					}
				}
				if(i != Integer.parseInt(currentPage) - 1) {
					currentList = new ArrayList<WeDTO>();
					countList = new ArrayList<Integer>();
				}
			}
			
			totalPage = String.valueOf(total);
			request.setAttribute("weList", noticeList);
			request.setAttribute("currentList", currentList);
			request.setAttribute("countList", countList);
		}else{
			//검색후 다음페이지로 넘긴경우
			if(member.getActive().equals("1")) {
				noticeList = dao.searchWe(search, period);
			}else {
				noticeList = dao.searchWe(search);
			}
			
			
			int total = noticeList.size() / 20; // 검색결과의 총 페이지 수
			
			if(noticeList.size() % 20 != 0) { //페이징 이후 남아있는 글 확인하여 페이지 할당
				total++;
			}
			
			if(total == 0) { // 게시글이 없는 경우 초기 1페이지
				total++;
			}
			
			for(int i = 0; i < Integer.parseInt(currentPage); i++) {
				if(noticeList.size() > i*20) {
					for(int j = i*20; j < (i*20)+20 && j < noticeList.size(); j++) {
						currentList.add(noticeList.get(j));
						countList.add(commentDAO.countComment("we", noticeList.get(j).getNum()));
					}
				}
				if(i != Integer.parseInt(currentPage) - 1) {
					currentList = new ArrayList<WeDTO>();
					countList = new ArrayList<Integer>();
				}
			}
			
			totalPage = String.valueOf(total); // 검색결과의 ArrayList의 사이즈 전체 게시글의 갯수
			request.setAttribute("search", search); // 해당 검색어를 계속 저장
			request.setAttribute("weList", noticeList);
			request.setAttribute("currentList", currentList);
			request.setAttribute("countList", countList);
		}
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		
		resURL = "/pages/we/we.jsp";
		return resURL;
	}

}
