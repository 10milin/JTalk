package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class RecoveryService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/*κΈ°λ³Έ ?΄? ??΄μ§?*/
		String resURL = "/pages/login/recovery.jsp";
		
		String command = request.getParameter("command");
		
		/* *
		 * command? ?°?Ό ??? λΉμ???€ λ‘μ§ ??
		 * DAO? ? κ·Όν?¬ ??? κ°μ²΄λ₯? request.setAttributeλ₯? ?΅?΄ ?€? 
		 * */
		
		if(command != null) {
			
			switch(command) {
			case "action":
				
				break;
			default:
				
			}
			
		}

		return resURL;
	}

}
