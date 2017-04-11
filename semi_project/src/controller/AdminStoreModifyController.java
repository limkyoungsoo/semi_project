package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;
import model.StoreVO;

public class AdminStoreModifyController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url ="board/admin_store_modify.jsp";
		String no = request.getParameter("no");
		String name = request.getParameter("name");
		
		StoreVO vo = StoreDAO.getInstance().getAdminStoreModify(name);
		request.setAttribute("vo", vo);
		
		
		return url;
	}

}
