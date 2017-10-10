package com.jtalk.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.anony.AnonyService;
import com.jtalk.anony.DeleteService;
import com.jtalk.anony.WriteService;
import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.dto.MemberDTO;

public class AdminAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/admin/main.jsp";
		ServletContext ctx =  request.getServletContext();
		ctx.setAttribute("version", "Alpha");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
				case "anony": service = new AnonyService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
		
		return resURL;
	}
	
}
