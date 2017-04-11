package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import model.MemberVO;
import model.PagingBean;
import model.ReviewDAO;
import model.ReviewListVO;
import model.ReviewVO;

public class WriteReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String hidden = request.getParameter("hidden");
		String storeName = request.getParameter("storeName");
		if (hidden == null) {
			HttpSession session = request.getSession(false);
			MemberVO mvo = (MemberVO) session.getAttribute("member");
			String mid = mvo.getmId();
			String review = request.getParameter("comment");
			String starInput = request.getParameter("star-input");
			float grade = Float.parseFloat(starInput);
			String menuOption = request.getParameter("menuOption");
			System.out.println("메뉴 옵션 : " + menuOption);
			int menuNo = Integer.parseInt(menuOption);

			ReviewVO rvo = new ReviewVO(grade, review, mid, menuNo);

			System.out.println(rvo.toString() + "   가게 : " + storeName);

			ReviewDAO.getInstance().writeReview(rvo);
		}

		// paging bean
		int totalCount = ReviewDAO.getInstance().getTotalReivewCount(storeName);
		System.out.println(totalCount);

		String pno = request.getParameter("pageNo");
		System.out.println(pno + " pno");
		PagingBean pagingBean = null;
		pagingBean = new PagingBean(totalCount, Integer.parseInt(pno));

		System.out.println("총 리뷰 수 : " + totalCount);

		ArrayList<ReviewVO> rlist = ReviewDAO.getInstance().getAllReviewList(pagingBean,storeName);
		System.out.println("수" + rlist.size());
		System.out.println("zzzz" + rlist.toString());
		ReviewListVO listVO = new ReviewListVO(rlist, pagingBean);
		JSONObject ja = new JSONObject(listVO);
		out.print(ja.toString());
		out.close();

		return "AjaxView";
	}

}