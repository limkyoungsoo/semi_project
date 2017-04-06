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
		
		String storeName = request.getParameter("storeName");
		StoreVO storeVO = StoreDAO.getInstance().getStoreMenuList(storeName);
		System.out.println("추천음식"+storeName);
		ArrayList<MenuVO> menuImgList = StoreDAO.getInstance().getMenuImgByMenuNo(storeName);
		System.out.println(menuImgList.toString());
		request.setAttribute("menuList", storeVO);
		request.setAttribute("menuImgList", menuImgList);
		return "/board/detailStore.jsp";
	}

}
