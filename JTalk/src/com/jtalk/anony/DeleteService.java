package com.jtalk.anony;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.AnonyDAO;
import com.jtalk.dao.CommentDAO;

public class DeleteService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		int result = 0;
		
		AnonyDAO dao = AnonyDAO.getInstance();
		result = dao.deleteAnony(num);
		
		if(result > 0){
			resURL = "/anony.action?command=anony";
		}
		
		return resURL;
	}

}
