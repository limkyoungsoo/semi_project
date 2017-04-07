package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import model.MenuVO;
import model.ReviewDAO;
import model.ReviewVO;
import model.StoreVO;

public class WriteReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String command = request.getParameter("command");
		System.out.println(command);
				
		String review = request.getParameter("comment");
		
		String starInput = request.getParameter("star-input");
		float grade = Float.parseFloat(starInput);		
		
		String menuOption = request.getParameter("menuOption");
		int menuNo = Integer.parseInt(menuOption.substring(menuOption.length()-1,menuOption.length()));
				
		// mid가 session 에서 오는가 파라미터로 받는가
		// 해결 과제임 
		String mid = request.getParameter("mid");
		mid = "hgt";	
				
		ReviewVO rvo = new ReviewVO(grade, review, mid, menuNo);
		
		ReviewDAO.getInstance().writeReview(rvo);
		
		String storeName=request.getParameter("storeName");
		System.out.println(storeName);
		ArrayList<ReviewVO> list =
		ReviewDAO.getInstance().getReviewList(storeName);
		System.out.println(list);
		JSONArray ja = new JSONArray(list);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(ja.toString());
		out.close();
		
		return "AjaxView";
	}

}
