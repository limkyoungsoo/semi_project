package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;
import model.StoreVO;

public class AdminStoreListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String url="/board/admin_store.jsp";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		ArrayList<StoreVO> list   = StoreDAO.getInstance().getAdminStoreList();
		
		request.setAttribute("list", list);
		
		return url;
	}

}
