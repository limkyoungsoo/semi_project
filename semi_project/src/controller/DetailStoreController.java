package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;
import model.StoreVO;

public class DetailStoreController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String storeName=request.getParameter("storeName");
		StoreVO storeVO=StoreDAO.getInstance().getStoreMenuList(storeName);
		// 각 가게당 있는 메뉴사진 3개를 불러오기 위해, 메뉴 번호를 이용하여 사진을 가져온다
		int menuNo=storeVO.getMenuVO().getMenuNo();
		System.out.println("메뉴넘버: "+menuNo);
		StoreVO menuImgVO=StoreDAO.getInstance().getMenuImgByMenuNo(menuNo);
		request.setAttribute("menuList", storeVO);
		request.setAttribute("menuImgList", menuImgVO);
		return "/board/detailStore.jsp";
	}
	
}
