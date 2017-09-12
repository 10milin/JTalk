package com.jtalk.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.NoticeDTO;

public class NoticeService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		
		//DB를 통해 ArrayList객체를 받아옴
		
		
		
		String totalPage = String.valueOf(30);   // ArrayList의 사이즈 전체 게시글의 페이지수
		String currentPage = request.getParameter("currentPage");
		String search = request.getParameter("search");
		
		if(currentPage == null) currentPage = "1";

		if(search == null || search.equals("")){
			//검색하지 않고 전체목록에서 페이지를 넘긴경우
			
			NoticeDAO dao = NoticeDAO.getInstance();
			ArrayList<NoticeDTO> noticeList = dao.getAllNotice();
			ArrayList<NoticeDTO> currentList = new ArrayList<NoticeDTO>();
			
			for(int i = 0; i < Integer.parseInt(currentPage); i++) {
				if(noticeList.size() > i*20) {
					for(int j = i*20; j < (i*20)+20 && j < noticeList.size(); j++) {
						currentList.add(noticeList.get(j));
					}
				}
				if(!(i == Integer.parseInt(currentPage) - 1)) {
					currentList = new ArrayList<NoticeDTO>();
				}
			}
			
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("currentList", currentList);
		}else{
			//검색후 다음페이지로 넘긴경우
			totalPage = String.valueOf(30); // 검색결과의 ArrayList의 사이즈 전체 게시글의 갯수 
			request.setAttribute("search", search); // 해당 검색어를 계속 저장
			
		}
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		
		resURL = "/pages/notice/notice.jsp";
		return resURL;
	}

}
