package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class RegisterService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/*ê¸°ë³¸ ?´?™ ?˜?´ì§?*/
		String resURL = "/pages/login/register.jsp";
		
		String command = request.getParameter("command");
		
		/* *
		 * command?— ?”°?¼ ?•„?š”?•œ ë¹„ì??‹ˆ?Š¤ ë¡œì§ ?ˆ˜?–‰
		 * DAO?— ? ‘ê·¼í•˜?—¬ ?•„?š”?•œ ê°ì²´ë¥? request.setAttributeë¥? ?†µ?•´ ?„¤? •
		 * */
		
		if(command != null) {
			
			switch(command) {
			case "action":
				//?šŒ?›?“±ë¡? ë¡œì§ ?ˆ˜?–‰
				break;
			default:
				
			}
			
		}

		return resURL;
	}

}
