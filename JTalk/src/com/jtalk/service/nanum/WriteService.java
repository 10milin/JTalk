package com.jtalk.service.nanum;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.NanumDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dto.NanumDTO;
import com.jtalk.security.MultipartWrapper;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		String savePath = "upload";
		int uploadFileSizeLimit = 5*1024*1024;
		String encType = "UTF-8";
		
		ServletContext context = request.getSession().getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		
		try
		{
			MultipartWrapper multi = new MultipartWrapper(
					request,
					uploadFilePath,
					uploadFileSizeLimit,
					encType,
					new DefaultFileRenamePolicy());
			
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String writerID = multi.getParameter("writerId");
			String writerName = multi.getParameter("writerName");
			String photo = multi.getFilesystemName("file");
			String originphoto = multi.getOriginalFileName("file");
			String price = multi.getParameter("price");
			String phone = multi.getParameter("phone");
			
			if(photo == null) photo = "noimg.png";
			if(originphoto == null) originphoto = "noimg.png";
			
			NanumDTO trade = new NanumDTO();

			trade.setTitle(title);
			trade.setPhoto(photo);
			trade.setOriginphoto(originphoto);
			trade.setContent(content);
			trade.setWriterID(writerID);
			trade.setWriterName(writerName);
			trade.setPhone(phone);
			trade.setPrice(price);
			
			NanumDAO dao = NanumDAO.getInstance();
			NewCommentDAO newDAO = NewCommentDAO.getInstance();
			dao.insertNanum(trade);
			
			newDAO.insertNew("nanum", dao.getLastNum(), writerID);
			resURL = "/nanum.action?command=nanum";
		} catch(IOException e) {
			
			request.setAttribute("exception", e);
			request.setAttribute("error", "업로드 파일용량 초과 및 파일 확장자 불일치");
			
		} catch(SQLException e){
			
			request.setAttribute("exception", e);
			request.setAttribute("error", "데이터베이스 접근 에러");
			
		} catch(Exception e){
			
			request.setAttribute("exception", e);
			request.setAttribute("error", "원인을 알수 없는 에러");
			
		} finally {
			
			resURL = "/applicaion.exception";
			
		}
		
		return resURL;
	}

}
