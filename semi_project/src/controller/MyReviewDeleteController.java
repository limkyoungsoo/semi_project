package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;

public class MyReviewDeleteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int reviewNo=Integer.parseInt(request.getParameter("reviewNo"));
		System.out.println("dldsjf;ldsjfi;odsjfi;o 리뷰"+reviewNo);
		ReviewDAO.getInstance().myReviewDelete(reviewNo);
		return "AjaxView";
	}

}
