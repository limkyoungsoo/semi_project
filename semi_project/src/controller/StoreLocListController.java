package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import model.StoreDAO;

public class StoreLocListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		ArrayList<String> locList = StoreDAO.getInstance().getStoreLocList();
		JSONArray jList = new JSONArray(locList);
		out.print(jList.toString());
		System.out.println(jList.toString());
		out.close();
		return "AjaxView";
	}

}
