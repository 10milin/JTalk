package com.jtalk.trade;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dao.TradeDAO;
import com.jtalk.dto.NoticeDTO;
import com.jtalk.dto.TradeDTO;
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
			String writerID = multi.getParameter("writerId");
			String writerName = multi.getParameter("writerName");
			String photo = multi.getFilesystemName("file");
			String originphoto = multi.getOriginalFileName("file");
			String price = multi.getParameter("price");
			String phone = multi.getParameter("phone");

			TradeDTO trade = new TradeDTO();
			trade.setNum(num);
			trade.setTitle(title);
			if(photo!=null)
			{
				trade.setPhoto(photo);
			}
			if(originphoto!=null)
			{
				trade.setOriginphoto(originphoto);
			}
			trade.setContent(content);
			trade.setWriterID(writerID);
			trade.setWriterName(writerName);
			trade.setPhone(phone);
			trade.setPrice(price);

			TradeDAO dao = TradeDAO.getInstance();
			dao.modifyTrade(trade);
			
			resURL = "/trade.action?command=trade";

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return resURL;
	}

}
