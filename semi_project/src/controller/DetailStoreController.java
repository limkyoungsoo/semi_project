package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewVO;
import model.ReviewDAO;
import model.StoreDAO;
import model.StoreVO;

public class DetailStoreController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String storeName=request.getParameter("storeName");
		StoreVO storeVO=StoreDAO.getInstance().getStoreMenuList(storeName);
		//menuList : list page 의 전체 식당 보여줌
		request.setAttribute("menuList", storeVO);
		ArrayList<ReviewVO> reviewList = ReviewDAO.getInstance().getReviewList(storeName);
		//reviewList : 해당식당의 전체 review 보여줌
		request.setAttribute("reviewList", reviewList);
		//storeMenuName : reviewList 의 조건 설정의 menuName 보여줌
		return "/board/detailStore.jsp";
	}
	
}
