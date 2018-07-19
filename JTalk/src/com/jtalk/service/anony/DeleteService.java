package com.jtalk.service.anony;

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
		String main = request.getParameter("main");
		int result = 0;
		
		AnonyDAO dao = AnonyDAO.getInstance();
		result = dao.deleteAnony(num);
		
		if(result > 0){
			if(main != null && main.equals("main")) {
				resURL = "/index.action";
			}else {
				resURL = "/anony.action?command=anony";
			}
		}
		
		return resURL;
	}

}
