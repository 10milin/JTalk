package com.jtalk.service.food;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.FoodDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dto.FoodDTO;
import com.jtalk.security.MultipartWrapper;
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
			MultipartWrapper multi = new MultipartWrapper(
					request,
					uploadFilePath,
					uploadFileSizeLimit,
					encType,
					new DefaultFileRenamePolicy());
			
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String address = multi.getParameter("address");
			String writerId = multi.getParameter("writerId");
			String writerName = multi.getParameter("writerName");
			String fileName = multi.getFilesystemName("file");
			String originFileName = multi.getOriginalFileName("file");
			
			FoodDTO notice = new FoodDTO();
			
			notice.setTitle(title);
			notice.setContent(content);
			notice.setAddress(address);
			notice.setWriterId(writerId);
			notice.setWriterName(writerName);
			notice.setFileName(fileName);
			notice.setOriginFileName(originFileName);
			
			FoodDAO dao = FoodDAO.getInstance();
			NewCommentDAO newDAO = NewCommentDAO.getInstance();
			dao.insertFood(notice);
			
			newDAO.insertNew("food", dao.getLastNum(), writerId);
			resURL = "/food.action?command=food";

		} catch(IOException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error", "업로드 파일용량 초과 및 파일 확장자 불일치");
			resURL = "/applicaion.exception";
			
		} catch(SQLException e){
			
			request.setAttribute("exception", e);
			request.setAttribute("error", "데이터베이스 접근 에러");
			resURL = "/applicaion.exception";
			
		} catch(Exception e){
			
			request.setAttribute("exception", e);
			request.setAttribute("error", "원인을 알수 없는 에러");
			resURL = "/applicaion.exception";
			
		}
		
		return resURL;
	}
}
