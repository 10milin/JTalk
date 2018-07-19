package com.jtalk.service.member;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Service;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.security.MultipartWrapper;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PfModifyService implements Service {

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
			
			String name = multi.getParameter("name");
			int period = Integer.parseInt(multi.getParameter("period"));
			String prtmp = multi.getParameter("pr");
			String pr = prtmp.replace(System.getProperty("line.separator"),"<br>");
			String fileName = multi.getFilesystemName("file");
			
			HttpSession session = request.getSession();
			String email = ((MemberDTO)session.getAttribute("member")).getEmail();
			
			if(fileName==null)
			{
				fileName = ((MemberDTO)session.getAttribute("member")).getProfile();
			}
			
			MemberDTO dto = new MemberDTO();
			
			dto.setEmail(email);
			dto.setName(name);
			dto.setPeriod(period);
			dto.setPr(pr);
			dto.setProfile(fileName);
			
			MemberDAO dao = MemberDAO.getInstance();
			dao.updateProfile(dto);
			
			dto = dao.getMember(email);
			
			resURL = "/pages/profile/profile.jsp";
			session.setAttribute("member", dto);

		}catch(Exception e) {
					e.printStackTrace();
		}
		
		return resURL;
	}

}
