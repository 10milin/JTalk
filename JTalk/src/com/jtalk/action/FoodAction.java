package com.jtalk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.jtalk.core.Service;
import com.jtalk.food.FoodService;
import com.jtalk.food.DeleteService;
import com.jtalk.food.DetailService;
import com.jtalk.food.DownloadService;
import com.jtalk.food.ModifyFormService;
import com.jtalk.food.ModifyService;
import com.jtalk.food.WriteService;

public class FoodAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/error/500.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			Service service = null;
			switch(command) {
			case "writeform": resURL = "/pages/food/write.jsp"; break;
			case "modifyform" : service = new ModifyFormService(); break;
			case "food": service = new FoodService(); break;
			case "detail": service = new DetailService(); break;
			case "write": service = new WriteService(); break;
			case "modify": service = new ModifyService(); break;
			case "delete": service = new DeleteService(); break;
			case "download": service = new DownloadService(); break;
			}
			
			if(service !=null) resURL = service.process(request, response);
		}
		
		return resURL;
	}

}
