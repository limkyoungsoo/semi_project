package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import model.ReviewDAO;
import model.ReviewVO;
import model.StoreVO;

public class WriteReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String command = request.getParameter("command");
		System.out.println(command);
	
		int grade = Integer.parseInt(request.getParameter("star-input"));		
		String review = request.getParameter("comment");
		
		
		// mid가 session 에서 오는가 파라미터로 받는가
		// 해결 과제임 
		String mid = request.getParameter("mid");
		
		
		int menuNo = Integer.parseInt(request.getParameter("menuOption"));
				
		ReviewVO rvo = new ReviewVO(grade, review, mid, menuNo);
		
		ReviewDAO.getInstance().writeReview(rvo);
				
		ArrayList<ReviewVO> list =
		ReviewDAO.getInstance().getReviewList(((StoreVO)request.getAttribute("storeList")).getStoreName());
		
		JSONArray ja = new JSONArray(list);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(ja.toString());
		out.close();
		
		return "AjaxView";
	}

}
