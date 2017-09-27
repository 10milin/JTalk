package com.jtalk.ajax;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Action;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.MemberDAO;
import com.jtalk.dao.MessageDAO;
import com.jtalk.dao.NewCommentDAO;
import com.jtalk.dto.CommentDTO;
import com.jtalk.dto.MemberDTO;

public class AnonyCmtService implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String json = null;
		int result = 0;
		
		String tableName = request.getParameter("tableName");
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String active = member.getActive();
		
		CommentDTO comment = new CommentDTO();
		comment.setTableName(tableName);
		comment.setPostNum(postNum);
		comment.setWriterId("anony");
		comment.setWriterName("anony");
		comment.setContent(content);
		
		CommentDAO dao = CommentDAO.getInstance();
		result = dao.insertComment(comment);
		int num = dao.getMaxNum();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		json = "{\"result\": \"" + result + "\", \"active\": \"" + active + "\", \"num\": \"" + num + "\", \"writeDate\": \"" + date +"\"}";
		
		return json;
	}

}
