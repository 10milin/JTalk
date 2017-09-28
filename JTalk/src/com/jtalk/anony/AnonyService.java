package com.jtalk.anony;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.AnonyDAO;
import com.jtalk.dao.AwesomeDAO;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dto.AnonyDTO;
import com.jtalk.dto.CommentDTO;
import com.jtalk.dto.MemberDTO;

public class AnonyService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = "/pages/anony/anony.jsp";
		
		//DB를 통해 ArrayList객체를 받아옴
		String currentPage = request.getParameter("currentPage");
		
		String totalPage = String.valueOf(1); //전체 페이지의 초기값
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		AnonyDAO dao = AnonyDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		ArrayList<AnonyDTO> anonyList;
		ArrayList<AnonyDTO> currentList = new ArrayList<AnonyDTO>();
		ArrayList<Integer> countList = new ArrayList<Integer>();
		ArrayList<ArrayList<CommentDTO>> cmtList = new ArrayList<ArrayList<CommentDTO>>();
		ArrayList awesomeArray = new ArrayList();
		AwesomeDAO awesomeDAO = AwesomeDAO.getInstance();
		
		if(currentPage == null) currentPage = "1";
		
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
					cmtList.add(commentDAO.getCommentList("anony", anonyList.get(j).getNum()));
					if(member != null) awesomeArray.add(awesomeDAO.checkLike(anonyList.get(j).getNum(), member.getEmail()));
				}
			}
			if(i != Integer.parseInt(currentPage) - 1)
			{
				currentList = new ArrayList<AnonyDTO>();
				countList = new ArrayList<Integer>();
			}
		}
		
		totalPage = String.valueOf(total);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("anonyList", anonyList);
		request.setAttribute("cmtList", cmtList);
		request.setAttribute("currentList", currentList);
		request.setAttribute("countList", countList);
		request.setAttribute("awesomeArray", awesomeArray);
		
		return resURL;
	}

}
