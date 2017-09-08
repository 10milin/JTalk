package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class NoticeService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/notice/notice.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			/* Params */
			
			String currentPage = null; // 현재 보여주는 페이지
			String totalPage = null; // DB를 통해 페이지수를 계산하여 처리
			String search = null; // 검색어
			
			switch(command) {
			case "action":
				//DB를 통해 ArrayList객체를 받아옴
				
				totalPage = String.valueOf(4); // ArrayList의 사이즈 전체 게시글의 갯수 
				
				// Attribute 설정
				request.setAttribute("currentPage", 1);
				request.setAttribute("totalPage", totalPage);
				break;
			case "page":
				//DB를 통해 ArrayList객체를 받아옴
				
				currentPage = request.getParameter("page");
				
				// pageForm에서 search 파라미터를 가져옴
				search = request.getParameter("search");
				
				if(search == null){
					//검색하지 않고 전체목록에서 페이지를 넘긴경우
					
				}else{
					//검색후 다음페이지로 넘긴경우
					totalPage = String.valueOf(3); // 검색결과의 ArrayList의 사이즈 전체 게시글의 갯수 
					request.setAttribute("search", search); // 해당 검색어를 계속 저장
					
				}
				
				// Attribute 설정
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("totalPage", totalPage);
				
				break;
			case "search":
				// pageForm에서 search 파라미터를 가져옴
				search = request.getParameter("search");

				//DB를 통해 검색결과의 ArrayList객체를 받아옴
				
				totalPage = String.valueOf(3); // 검색결과의 ArrayList의 사이즈 전체 게시글의 갯수 
				
				request.setAttribute("currentPage", 1);
				// 무조건 검색 결과는 1페이지로 나온다.
				request.setAttribute("totalPage", totalPage);
				request.setAttribute("search", search);
				
				break;
			case "write":
				resURL = "/pages/notice/write.jsp";
				break;
			
			default:
			
			}
			
		}

		return resURL;
	}

}
