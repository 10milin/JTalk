package com.jtalk.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class SearchService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		// pageForm에서 search 파라미터를 가져옴
		String search = request.getParameter("search");

		//DB를 통해 검색결과의 ArrayList객체를 받아옴
		
		String totalPage = String.valueOf(30); // 검색결과의 ArrayList의 사이즈 전체 게시글의 갯수 
		
		request.setAttribute("currentPage", 1);
		// 무조건 첫 검색 결과는 1페이지로 나온다.
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("search", search);
		
		resURL = "/pages/notice/notice.jsp";
		return resURL;
	}

}
