package com.jtalk.service.study;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dao.StudyDAO;
import com.jtalk.dao.WeDAO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.NoticeDTO;
import com.jtalk.dto.StudyDTO;
import com.jtalk.dto.WeDTO;
import com.jtalk.security.MultipartWrapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteService implements Service{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		String savePath = "upload";
		int uploadFileSizeLimit = 10 * 1024 *1024;
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
			String writerId = multi.getParameter("writerId");
			String writerName = multi.getParameter("writerName");
			String fileName = multi.getFilesystemName("file");
			String originFileName = multi.getOriginalFileName("file");
			int period = Integer.parseInt(multi.getParameter("period"));
			String category = multi.getParameter("category");
			int recruitNum = Integer.parseInt(multi.getParameter("recruitNum"));
			String closingDate = multi.getParameter("closingDate");
			
			StudyDTO notice = new StudyDTO();
			
			notice.setTitle(title);
			notice.setContent(content);
			notice.setWriterId(writerId);
			notice.setWriterName(writerName);
			notice.setFileName(fileName);
			notice.setOriginFileName(originFileName);
			notice.setPeriod(period);
			notice.setCategory(category);
			notice.setRecruitNum(recruitNum);
			
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date to = new java.sql.Date(transFormat.parse(closingDate).getTime());
			
			notice.setClosingDate(to);
			
			StudyDAO dao = StudyDAO.getInstance();
			NewCommentDAO newDAO = NewCommentDAO.getInstance();
			dao.insertStudy(notice);
			
			newDAO.insertNew("study", dao.getLastNum(), writerId);
			resURL = "/study.action?command=study";

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
