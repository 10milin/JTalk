package com.jtalk.trade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dao.TradeDAO;

public class DeleteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		TradeDAO dao = TradeDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		newDAO.deleteNew("trade", num);
		commentDAO.postDeleteComment("trade", num);
		dao.deleteTrade(num);
		
		resURL = "trade.action?command=trade";
		
		return resURL;
	}
}
