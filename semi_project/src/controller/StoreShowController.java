package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.StoreDAO;
import model.StoreVO;

public class StoreShowController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<StoreVO> storeList = StoreDAO.getInstance().getStoreShowList();
		ArrayList<StoreVO> storeLocList = StoreDAO.getInstance().getStoreNameList();
		System.out.println("가게 수 :" + storeList.size());
		HttpSession session = request.getSession();
		session.setAttribute("storeLocList", storeLocList);
		request.setAttribute("storeList", storeList);
		return "/index.jsp";
	}
}
