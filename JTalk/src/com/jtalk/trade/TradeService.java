package com.jtalk.trade;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.TradeDAO;
import com.jtalk.dto.TradeDTO;

public class TradeService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		String currentPage = request.getParameter("currentPage");
		String search = request.getParameter("search");
		String totalPage = String.valueOf(1); //전체 페이지의 초기값
		TradeDAO dao = TradeDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		ArrayList<TradeDTO> tradeList;
		ArrayList<TradeDTO> currentList = new ArrayList<TradeDTO>();
		ArrayList<Integer> countList = new ArrayList<Integer>();
		
		int PageViewCount = 6;
		
		if(currentPage == null) currentPage = "1";
		if(search == null || search.equals(""))
		{
			tradeList = dao.getAllTrade();
			
			int total = tradeList.size() / PageViewCount;
			
			if(tradeList.size() % PageViewCount != 0)
			{
				total++;
			}
			
			if(total == 0)
			{
				total++;
			}
			
			for(int i = 0 ; i < Integer.parseInt(currentPage) ; i++)
			{
				if(tradeList.size() > i*PageViewCount)
				{
					for(int j = i*PageViewCount ; j < (i*PageViewCount)+PageViewCount && j < tradeList.size() ; j++)
					{
						currentList.add(tradeList.get(j));
						countList.add(commentDAO.countComment("trade", tradeList.get(j).getNum()));
					}
				}
				if(i != Integer.parseInt(currentPage)-1)
				{
					currentList = new ArrayList<TradeDTO>();
					countList = new ArrayList<Integer>();
				}
			}
			
			totalPage = String.valueOf(total);
			request.setAttribute("tradeList", tradeList);
			request.setAttribute("currentList", currentList);
			request.setAttribute("countList", countList);
		}
		else
		{
			tradeList = dao.searchTrade(search);
			
			int total = tradeList.size() / PageViewCount;
			
			if(tradeList.size() % PageViewCount != 0)
			{
				total++;
			}
			
			if(total == 0)
			{
				total++;
			}
			
			for(int i = 0 ; i < Integer.parseInt(currentPage) ; i++)
			{
				if(tradeList.size() > i*PageViewCount)
				{
					for(int j = i * PageViewCount ; j < (i * PageViewCount) + PageViewCount && j < tradeList.size() ; j++)
					{
						currentList.add(tradeList.get(j));
						countList.add(commentDAO.countComment("trade", tradeList.get(j).getNum()));
					}
				}
				if(i != Integer.parseInt(currentPage)-1)
				{
					currentList = new ArrayList<TradeDTO>();
					countList = new ArrayList<Integer>();
				}
			}
			
			totalPage = String.valueOf(total); // 검색결과의 ArrayList의 사이즈 전체 게시글의 갯수
			request.setAttribute("search", search); // 해당 검색어를 계속 저장
			request.setAttribute("tradeList", tradeList);
			request.setAttribute("currentList", currentList);
			request.setAttribute("countList", countList);
		}
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		
		resURL = "/pages/trade/trade.jsp";
		return resURL;
	}

}
