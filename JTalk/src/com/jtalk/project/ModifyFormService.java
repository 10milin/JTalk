package com.jtalk.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.ProjectDAO;
import com.jtalk.dao.StudyDAO;
import com.jtalk.dao.WeDAO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.ProjectDTO;
import com.jtalk.dto.StudyDTO;
import com.jtalk.dto.WeDTO;

public class ModifyFormService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProjectDAO dao = ProjectDAO.getInstance();
		ProjectDTO notice = dao.getProject(num);
		
		request.setAttribute("project", notice);
		
		resURL = "/pages/project/modify.jsp";
		
		return resURL;
	}

}
