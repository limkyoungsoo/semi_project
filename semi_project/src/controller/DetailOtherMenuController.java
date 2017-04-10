package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.StoreDAO;
import model.StoreVO;

public class DetailOtherMenuController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String menuNo=request.getParameter("menuNo");
		StoreVO storeVO=StoreDAO.getInstance().getOtherMenuInfoByMenuNo(Integer.parseInt(menuNo));
		JSONObject json=new JSONObject(storeVO);
		out.println(json.toString());
		out.close();
		return "AjaxView";
	}

}
