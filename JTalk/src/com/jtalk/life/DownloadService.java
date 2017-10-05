package com.jtalk.life;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;

public class DownloadService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
						
		String fileName = request.getParameter("fileName");
		String originFileName = request.getParameter("originFileName");
		
		ServletContext context = request.getServletContext();
		String filePath = context.getRealPath("/upload");
			
		File file = new File(filePath,fileName);
		
		if(file.exists() && file.isFile())
		{
			long fileSize = file.length();
            
            response.setContentType("application/octet-stream"); 

            response.setContentLength((int)fileSize);
            
            String strClient = request.getHeader("user-agent");
            
            if(strClient.indexOf("MSIE 5.5") != -1)
            {
            	response.setHeader("Content-Disposition", "fileName="+originFileName+";");
            }
            else
            {
                try
                {
                	originFileName = URLEncoder.encode(originFileName, "UTF-8").replaceAll("\\+", "%20");
				}
                catch (UnsupportedEncodingException e)
                {
					e.printStackTrace();
				}
                response.setHeader("Content-Disposition", "attachment; fileName="+originFileName+";");
            }
            
            response.setHeader("Content-Length", String.valueOf(fileSize));
            response.setHeader("Content-Transfer-Encoding", "binary;");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "private");
            
            byte b[] = new byte[(int)fileSize];
            
            BufferedInputStream ins = null;
            BufferedOutputStream outs = null;
			try {
				ins = new BufferedInputStream(new FileInputStream(file));
				outs = new BufferedOutputStream(response.getOutputStream());
			}
			catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            int read=0;
            
            try {
				while((read=ins.read(b)) != -1){
				    outs.write(b, 0, read);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            try {
				outs.flush();
				outs.close();
	            ins.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            
		}
		else
		{
			System.out.println("파일다운 에러");
		}
		
		return null;
	}

}
