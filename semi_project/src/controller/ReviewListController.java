package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import model.ReviewDAO;
import model.ReviewVO;

public class ReviewListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String storeName=request.getParameter("storeName");
		PrintWriter out = response.getWriter();
		JSONArray reviewJson = new JSONArray(ReviewDAO.getInstance().getReviewList(storeName));
		out.println(reviewJson.toString());
		System.out.println(reviewJson.toString());
		out.close();
		return "AjaxView";
	}
}
