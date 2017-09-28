package com.jtalk.action;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.dao.AnonyDAO;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.AnonyDTO;
import com.jtalk.dto.CommentDTO;
import com.jtalk.dto.NoticeDTO;

public class IndexAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/main.jsp";
		ServletContext ctx =  request.getServletContext();
		ctx.setAttribute("version", "Alpha");
		
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		AnonyDAO anonyDAO = AnonyDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		ArrayList<NoticeDTO> notice = noticeDAO.getAllNotice();
		ArrayList<NoticeDTO> newNotice = new ArrayList<NoticeDTO>();
		ArrayList<AnonyDTO> anony = anonyDAO.getAllAnony();
		ArrayList<AnonyDTO> newAnony = new ArrayList<AnonyDTO>();
		ArrayList<ArrayList<CommentDTO>> cmtList = new ArrayList<ArrayList<CommentDTO>>();
		ArrayList<Integer> countList = new ArrayList<Integer>();
		
		//공지사항
		if(notice.size() != 0) {
			for(int i = 0; i < notice.size(); i++) {
				if(i > 4) {
					break;
				}
				newNotice.add(notice.get(i));
			}
		}
		
		//대나무숲
		if(anony.size() != 0) {
			for(int i = 0; i < anony.size(); i++) {
				if(i > 1) {
					break;
				}
				newAnony.add(anony.get(i));
				countList.add(commentDAO.countComment("anony", anony.get(i).getNum()));
				cmtList.add(commentDAO.getCommentList("anony", anony.get(i).getNum()));
			}
		}
		
		request.setAttribute("newNotice", newNotice);
		request.setAttribute("newAnony", newAnony);
		request.setAttribute("countList", countList);
		request.setAttribute("commentList", cmtList);
		return resURL;
	}
	
}
