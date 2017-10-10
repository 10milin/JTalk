package com.jtalk.trade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.LogDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dao.TradeDAO;
import com.jtalk.dto.LogDTO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dto.TradeDTO;
import com.jtalk.dto.WeDTO;

public class DeleteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		TradeDAO dao = TradeDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		if(member != null) {
			if(member.getActive().equals("2") || member.getActive().equals("3")) {
				LogDAO logDao = LogDAO.getInstance();
				TradeDTO dto = dao.getTrade(num);
				
				if(!member.getEmail().equals(dto.getWriterID())) {
					LogDTO log = new LogDTO();
					log.setBoard("중고나라");
					log.setTitle(dto.getTitle());
					log.setContent(dto.getContent());
					log.setWriterId(dto.getWriterID());
					log.setWriterName(dto.getWriterName());
					log.setDeleteId(member.getEmail());
					log.setDeleteName(member.getName());
					
					logDao.insertLog(log);
				}
			}
		}
		
		newDAO.deleteNew("trade", num);
		commentDAO.postDeleteComment("trade", num);
		dao.deleteTrade(num);
		
		resURL = "trade.action?command=trade";
		
		return resURL;
	}
}
