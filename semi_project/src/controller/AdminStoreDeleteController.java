package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;

public class AdminStoreDeleteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String storeName=request.getParameter("storeName");
		StoreDAO.getInstance().adminStoreDelete(storeName);
		
		return "AjaxView";
	}

}
