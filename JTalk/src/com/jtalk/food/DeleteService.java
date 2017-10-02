package com.jtalk.food;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jtalk.core.Service;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.FoodDAO;
import com.jtalk.dao.NewCommentDAO;

public class DeleteService implements Service {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String resURL = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		FoodDAO dao = FoodDAO.getInstance();
		NewCommentDAO newDAO = NewCommentDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		newDAO.deleteNew("food", num);
		commentDAO.postDeleteComment("food", num);
		dao.deleteFood(num);
		
		resURL = "food.action?command=food";
		
		return resURL;
	}
}
