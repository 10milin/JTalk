package com.jtalk.speech;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.ExchangeDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.SpeechDAO;

public class DeleteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		SpeechDAO dao = SpeechDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		newDAO.deleteNew("speech", num);
		commentDAO.postDeleteComment("speech", num);
		dao.deleteSpeech(num);
		
		resURL = "speech.action?command=speech";
		
		return resURL;
	}
}
