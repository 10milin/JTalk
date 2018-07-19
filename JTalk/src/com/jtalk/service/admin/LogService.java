package com.jtalk.service.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.LogDAO;
import com.jtalk.dto.ItDTO;
import com.jtalk.dto.LogDTO;

public class LogService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = null;
		
		
		//DB를 통해 ArrayList객체를 받아옴
		String currentPage = request.getParameter("currentPage");
		String search = request.getParameter("search");
		String totalPage = String.valueOf(1); //전체 페이지의 초기값
		LogDAO dao = LogDAO.getInstance();
		
		ArrayList<LogDTO> noticeList; //전체 목록
		ArrayList<LogDTO> currentList = new ArrayList<LogDTO>(); //현재 페이지 목록
		if(currentPage == null) currentPage = "1";
		if(search == null || search.equals("")){
			//검색하지 않고 전체목록에서 페이지를 넘긴경우
			noticeList = dao.getAllLog();
			
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
					}
				}
				if(i != Integer.parseInt(currentPage) - 1) {
					currentList = new ArrayList<LogDTO>();
				}
			}
			
			totalPage = String.valueOf(total);
			request.setAttribute("currentList", currentList);
		}else{
			//검색후 다음페이지로 넘긴경우
			noticeList = dao.searchLog(search);
			
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
					}
				}
				if(i != Integer.parseInt(currentPage) - 1) {
					currentList = new ArrayList<LogDTO>();
				}
			}
			
			totalPage = String.valueOf(total); // 검색결과의 ArrayList의 사이즈 전체 게시글의 갯수
			request.setAttribute("search", search); // 해당 검색어를 계속 저장
			request.setAttribute("currentList", currentList);
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		
		resURL = "/pages/admin/log.jsp";
		
		return resURL;
	}

}
