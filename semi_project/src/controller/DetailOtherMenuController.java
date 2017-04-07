package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;
import model.StoreVO;

public class DetailOtherMenuController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String menuNo=request.getParameter("menuNo");
		System.out.println("다른 메뉴 번호:"+menuNo);
		StoreVO storeVO=StoreDAO.getInstance().getOtherMenuInfoByMenuNo(Integer.parseInt(menuNo));
		out.println(storeVO);
		out.close();
		return "AjaxView";
	}

}
