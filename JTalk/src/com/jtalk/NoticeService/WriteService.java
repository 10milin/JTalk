package com.jtalk.NoticeService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.NoticeDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteService implements Service{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String resURL = "/pages/notice/write.jsp";
		
		String command = request.getParameter("command");
		
		if(command != null) {
			switch(command) {
			case "action":
				String savePath = "file";
				int uploadFileSizeLimit = 5 * 1024 *1024;
				String encType = "UTF-8";
				
				ServletContext context = request.getSession().getServletContext();
				String uploadFilePath = context.getRealPath(savePath);
				
				try {
					MultipartRequest multi = new MultipartRequest(
							request,
							uploadFilePath,
							uploadFileSizeLimit,
							encType,
							new DefaultFileRenamePolicy());
					
					String title = multi.getParameter("title");
					String content = multi.getParameter("content");
					String writerId = multi.getParameter("writerId");
					String writerName = multi.getParameter("writerName");
					String fileName = multi.getFilesystemName("fileName");
					
					NoticeDTO notice = new NoticeDTO();
					
					notice.setTitle(title);
					notice.setContent(content);
					notice.setWriterId(writerId);
					notice.setWriterName(writerName);
					notice.setFileName(fileName);
					
					NoticeDAO dao = NoticeDAO.getInstance();
					dao.insertNotice(notice);
					
					resURL = "/pages/notice/notice.jsp";
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				break;
			}
		}
		
		return resURL;
	}

}
