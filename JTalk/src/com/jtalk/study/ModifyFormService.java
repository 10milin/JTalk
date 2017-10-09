package com.jtalk.study;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.StudyDAO;
import com.jtalk.dao.WeDAO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.StudyDTO;
import com.jtalk.dto.WeDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		StudyDAO dao = StudyDAO.getInstance();
		StudyDTO notice = dao.getStudy(num);
		
		request.setAttribute("study", notice);
		
		resURL = "/pages/study/modify.jsp";
		
		return resURL;
	}

}
