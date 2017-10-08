package com.jtalk.we;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dao.WeDAO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.NoticeDTO;
import com.jtalk.dto.WeDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		String savePath = "upload";
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
			String fileName = multi.getFilesystemName("file");
			String originFileName = multi.getOriginalFileName("file");
			int period = Integer.parseInt(multi.getParameter("period"));
			
			WeDTO notice = new WeDTO();
			
			notice.setTitle(title);
			notice.setContent(content);
			notice.setWriterId(writerId);
			notice.setWriterName(writerName);
			notice.setFileName(fileName);
			notice.setOriginFileName(originFileName);
			notice.setPeriod(period);
			
			WeDAO dao = WeDAO.getInstance();
			NewCommentDAO newDAO = NewCommentDAO.getInstance();
			dao.insertWe(notice);
			
			newDAO.insertNew("we", dao.getLastNum(), writerId);
			resURL = "/we.action?command=we";

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return resURL;
	}
}
