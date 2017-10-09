package com.jtalk.project;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dao.ProjectDAO;
import com.jtalk.dao.StudyDAO;
import com.jtalk.dao.WeDAO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.NoticeDTO;
import com.jtalk.dto.ProjectDTO;
import com.jtalk.dto.StudyDTO;
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
			String category = multi.getParameter("category");
			String closingDate = multi.getParameter("closingDate");
			String teamName = multi.getParameter("teamName");
			String teamMember = multi.getParameter("teamMember");
			
			ProjectDTO notice = new ProjectDTO();
			
			notice.setTitle(title);
			notice.setContent(content);
			notice.setWriterId(writerId);
			notice.setWriterName(writerName);
			notice.setFileName(fileName);
			notice.setOriginFileName(originFileName);
			notice.setPeriod(period);
			notice.setCategory(category);
			notice.setClosingDate(closingDate);
			notice.setTeamName(teamName);
			notice.setTeamMember(teamMember);
			
			ProjectDAO dao = ProjectDAO.getInstance();
			NewCommentDAO newDAO = NewCommentDAO.getInstance();
			dao.insertProject(notice);
			
			newDAO.insertNew("project", dao.getLastNum(), writerId);
			resURL = "/project.action?command=project";

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return resURL;
	}
}
