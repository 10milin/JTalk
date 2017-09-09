package com.jtalk.ajax;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Action;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WysiwygService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		
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
			
			String fileName = multi.getFilesystemName("file");
			String original = multi.getOriginalFileName("file");
			json = "{\"filename\": \"" + fileName + "\", \"original\": \"" + original +"\"}";
		}catch(Exception e) {
			e.printStackTrace();
		}
		return json;
	}
}
