package com.jtalk.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.ProjectDAO;
import com.jtalk.dao.StudyDAO;
import com.jtalk.dao.WeDAO;

public class DeleteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProjectDAO dao = ProjectDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		newDAO.deleteNew("project", num);
		commentDAO.postDeleteComment("project", num);
		dao.deleteProject(num);
		
		resURL = "project.action?command=project";
		
		return resURL;
	}
}
