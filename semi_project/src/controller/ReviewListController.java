package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;
import model.ReviewVO;

public class ReviewListController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<ReviewVO> list = ReviewDAO.getInstance().getReviewList();
		request.setAttribute("list", list);
		return "board/review.jsp";
	}

}
