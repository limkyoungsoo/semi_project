package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MenuVO;
import model.StoreDAO;
import model.StoreVO;

public class DetailStoreController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String storeName=request.getParameter("storeName");
		// 강정호. storeName을 이용해서 store, menu 정보를 가져오는 메서드입니다
		StoreVO storeVO=StoreDAO.getInstance().getStoreMenuList(storeName);
		// 강정호. storeName을 이용해서 메뉴 사진 3개를 불러오는 메서드입니다
		ArrayList<MenuVO> menuImgList=StoreDAO.getInstance().getMenuImgByStoreName(storeName);
		
		
		request.setAttribute("menuList", storeVO);
		request.setAttribute("menuImgList", menuImgList);
		return "/board/detailStore.jsp";
	}
	
}
