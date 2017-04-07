package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewVO;
import model.ReviewDAO;
import model.ReviewListVO;
import model.MenuVO;
import model.PagingBean;
import model.ReviewVO;
import model.ReviewDAO;

import model.MenuVO;

import model.StoreDAO;
import model.StoreVO;

public class DetailStoreController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String storeName = request.getParameter("storeName");
		// 강정호. storeName을 이용해서 store, menu 정보를 가져오는 메서드입니다
		StoreVO storeVO = StoreDAO.getInstance().getStoreMenuList(storeName);
		// menuList : list page 의 전체 식당 보여줌
		// 강정호. storeName을 이용해서 메뉴 사진 3개를 불러오는 메서드입니다
		ArrayList<MenuVO> menuImgList = StoreDAO.getInstance().getMenuImgByStoreName(storeName);
		request.setAttribute("menuList", storeVO);

		//////////////////////////////////////////////////////////////////////////////
		// paging bean
		int totalCount = ReviewDAO.getInstance().getTotalReivewCount(storeName);
	
		System.out.println("총 리뷰 수 : "+totalCount);
		PagingBean pagingBean = new PagingBean(totalCount);
		
		ArrayList<ReviewVO> list = ReviewDAO.getInstance().getAllReviewList(pagingBean);
		ReviewListVO listVO = new ReviewListVO(list, pagingBean);
		request.setAttribute("rlistVo", listVO);
		
		
		ArrayList<ReviewVO> reviewList = ReviewDAO.getInstance().getReviewList(storeName);
		// reviewList : 해당식당의 전체 review 보여줌
		request.setAttribute("reviewList", reviewList);
		// storeMenuName : reviewList 의 조건 설정의 menuName 보여줌

		request.setAttribute("menuImgList", menuImgList);

		return "/board/detailStore.jsp";
	}

}
