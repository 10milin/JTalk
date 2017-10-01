package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.nanum.DeleteService;
import com.jtalk.nanum.DetailService;
import com.jtalk.nanum.ModifyFormService;
import com.jtalk.nanum.ModifyService;
import com.jtalk.nanum.ReSoldService;
import com.jtalk.nanum.SoldoutService;
import com.jtalk.nanum.NanumService;
import com.jtalk.nanum.WriteService;

public class NanumAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null)
		{
			Service service = null;
			switch(command)
			{
				case "writeForm" : resURL = "/pages/nanum/write.jsp"; break;
				case "nanum": service = new NanumService(); break;
				case "write": service = new WriteService(); break;
				case "detail": service = new DetailService(); break;
				case "delete" : service = new DeleteService(); break;
				case "modifyform": service = new ModifyFormService(); break;
				case "modify" : service = new ModifyService(); break;
				case "soldout" : service = new SoldoutService(); break;
				case "resold" : service = new ReSoldService(); break;
			}
			
			if(service != null) resURL = service.process(request, response);
		}
		
		return resURL;
	}

}
