package com.jtalk.notice;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.NoticeDTO;

public class DownloadService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		
		String resURL = "/pages/notice/detail.jsp";
		int num = Integer.parseInt(request.getParameter("num"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeDTO notice = dao.getNotice(num);
		
		File file = new File("/JTalk/upload/"+notice.getFileName());
		
		
		return resURL;
	}

}
