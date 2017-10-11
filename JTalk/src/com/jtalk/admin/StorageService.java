package com.jtalk.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.DatabaseDAO;
import com.jtalk.dto.DatabaseDTO;

public class StorageService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = null;

		DatabaseDAO dao = DatabaseDAO.getInstance();
		
		ArrayList<DatabaseDTO> noticeList; //전체 목록
		
		noticeList = dao.getStorage();
			
			
		request.setAttribute("currentList", noticeList);
		
		resURL = "/pages/admin/storage.jsp";
		
		return resURL;
	}

}
