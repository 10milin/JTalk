package com.jtalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class LoginService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		/*κΈ°λ³Έ ?΄? ??΄μ§?*/
		String resURL = "/pages/login/login.jsp";
		
		String command = request.getParameter("command");
		
		/* *
		 * command? ?°?Ό ??? λΉμ???€ λ‘μ§ ??
		 * DAO? ? κ·Όν?¬ ??? κ°μ²΄λ₯? request.setAttributeλ₯? ?΅?΄ ?€? 
		 * */
		
		if(command != null) {
			switch(command) {
			case "action":
				// λ‘κ·Έ?Έ ?? λ‘μ§
				// DBκ°κ³Ό λΉκ΅??¬ ??΄μ§? λ©μΈμ§?λ₯? ?΄κ±°λ resURL λ³?κ²?
				break;
			default:
				// ?λͺ»λ μ»€λ§¨? ?? ₯? μ²λ¦¬
			}
			
		}

		return resURL;
	}

}
