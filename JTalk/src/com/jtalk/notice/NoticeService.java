package com.jtalk.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class NoticeService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		
		//DB를 통해 ArrayList객체를 받아옴
		
		
		
		String totalPage = String.valueOf(30);   // ArrayList의 사이즈 전체 게시글의 페이지수
		String currentPage = request.getParameter("currentPage");
		String search = request.getParameter("search");
		
		if(currentPage == null) currentPage = "1";
		
		if(search == null){
			//검색하지 않고 전체목록에서 페이지를 넘긴경우
			
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
