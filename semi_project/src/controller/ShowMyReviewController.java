package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;
import model.MyReviewVO;
import model.PagingBean;
import model.ReviewDAO;
import model.ReviewListVO;
import model.ReviewVO;

public class ShowMyReviewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session=request.getSession(false);
		String mid=((MemberVO)session.getAttribute("member")).getmId();
		
		int totalCount = ReviewDAO.getInstance().getTotalMyReivewCount(mid);

		String pno = request.getParameter("pageNo");
		PagingBean pagingBean = null;
		if (pno == null) {
			pagingBean = new PagingBean(totalCount);
		} else {
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pno));
		}

/*		ArrayList<ReviewVO> list = ReviewDAO.getInstance().getAllReviewList(pagingBean, mid);
		ReviewListVO listVO = new ReviewListVO(list, pagingBean);
		request.setAttribute("rlistVO", listVO);*/
		
		ArrayList<ReviewVO> myReviewList=ReviewDAO.getInstance().showMyReview(pagingBean,mid);
		ReviewListVO mylistVO = new ReviewListVO(myReviewList, pagingBean);
		request.setAttribute("myReview", mylistVO);
		System.out.println("sdfsdfdsfdsfds"+mylistVO);
		return "/board/updateReviewInfo.jsp";
	}

}












