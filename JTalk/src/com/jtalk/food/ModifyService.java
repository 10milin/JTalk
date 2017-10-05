package com.jtalk.food;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.FoodDAO;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dto.FoodDTO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.NoticeDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ModifyService implements Service {

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
			
			int num = Integer.parseInt(multi.getParameter("num"));
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String address = multi.getParameter("address");
			String writerId = multi.getParameter("writerId");
			String writerName = multi.getParameter("writerName");
			String fileName = multi.getFilesystemName("file");
			String originFileName = multi.getOriginalFileName("file");
			
			FoodDTO notice = new FoodDTO();
			
			notice.setNum(num);
			notice.setTitle(title);
			notice.setContent(content);
			notice.setAddress(address);
			notice.setWriterId(writerId);
			notice.setWriterName(writerName);
			if(fileName!=null)
			{
				notice.setFileName(fileName);
				notice.setOriginFileName(originFileName);
			}
			
			FoodDAO dao = FoodDAO.getInstance();
			dao.modifyFood(notice);
			
			resURL = "/food.action?command=food";

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return resURL;
	}

}
