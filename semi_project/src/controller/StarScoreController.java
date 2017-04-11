package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.PagingBean;
import model.ReviewDAO;
import model.ReviewListVO;
import model.ReviewVO;

public class StarScoreController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String menuName = request.getParameter("menuName");
		String storeName = request.getParameter("storeName");
		System.out.println("식당이름: " + storeName);
		System.out.println("메뉴이름: " + menuName);
		HashMap<String, ReviewListVO> menuAndAvgList = new HashMap<String, ReviewListVO>();
		int totalCount = 0;
		String pno = request.getParameter("pageNo");
		if (pno == null) {
			pno = "1";
		}
		PagingBean pagingBean = null;
		menuAndAvgList.put("avgList", new ReviewListVO(ReviewDAO.getInstance().avgGrade(storeName, menuName)));
		ReviewListVO menuList = null;
		if (menuName == "") {
			totalCount = ReviewDAO.getInstance().getTotalReivewCount(storeName);
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pno));
			ArrayList<ReviewVO> rlist = ReviewDAO.getInstance().getAllReviewList(pagingBean, storeName);
			menuList = new ReviewListVO(rlist, pagingBean);
		} else {
			totalCount = ReviewDAO.getInstance().getTotalMenuReivewCount(storeName, menuName);
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pno));
			ArrayList<ReviewVO> rlist = ReviewDAO.getInstance().selectR(pagingBean, storeName, menuName);
			menuList = new ReviewListVO(rlist, pagingBean);
		}
		menuAndAvgList.put("menuList", menuList);
		JSONObject obj = new JSONObject(menuAndAvgList);
		System.out.println("이전 페이지 있니? "+pagingBean.isPreviousPageGroup());
		System.out.println(obj.toString());
		out.print(obj.toString());
		out.close();
		return "AjaxView";

	}
}
