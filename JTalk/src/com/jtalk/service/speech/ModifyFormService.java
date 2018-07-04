package com.jtalk.service.speech;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.ExchangeDAO;
import com.jtalk.dao.SpeechDAO;
import com.jtalk.dto.ExchangeDTO;
import com.jtalk.dto.SpeechDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		SpeechDAO dao = SpeechDAO.getInstance();
		SpeechDTO notice = dao.getSpeech(num);
		
		request.setAttribute("speech", notice);
		
		resURL = "/pages/speech/modify.jsp";
		
		return resURL;
	}

}
