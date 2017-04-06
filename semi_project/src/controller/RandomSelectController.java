package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;

public class RandomSelectController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String name = StoreDAO.getInstance().getRandStore();
		System.out.println(name);
		return "DispatcherServlet?command=detailStore&storeName="+name;
	}

}
