package com.jtalk.study;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.StudyDAO;
import com.jtalk.dto.StudyDTO;
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
			String writerId = multi.getParameter("writerId");
			String writerName = multi.getParameter("writerName");
			String fileName = multi.getFilesystemName("file");
			String originFileName = multi.getOriginalFileName("file");
			int period = Integer.parseInt(multi.getParameter("period"));
			String category = multi.getParameter("category");
			int recruitNum = Integer.parseInt(multi.getParameter("recruitNum"));
			String closingDate = multi.getParameter("closingDate");
			
			StudyDTO notice = new StudyDTO();
			
			notice.setNum(num);
			notice.setTitle(title);
			notice.setContent(content);
			notice.setWriterId(writerId);
			notice.setWriterName(writerName);
			notice.setPeriod(period);
			notice.setCategory(category);
			notice.setRecruitNum(recruitNum);
			
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date to = new java.sql.Date(transFormat.parse(closingDate).getTime());
			
			notice.setClosingDate(to);
			
			if(fileName!=null)
			{
				notice.setFileName(fileName);
				notice.setOriginFileName(originFileName);
			}
			
			StudyDAO dao = StudyDAO.getInstance();
			dao.modifyStudy(notice);
			
			resURL = "/study.action?command=study";

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return resURL;
	}

}
