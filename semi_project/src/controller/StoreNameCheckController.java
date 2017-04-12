package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;

public class StoreNameCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String storeName=request.getParameter("storeName");
		System.out.println(storeName);
		boolean flag =StoreDAO.getInstance().findStoreByStoreName(storeName);
		if(flag == true){
			out.print("true");
		}
		else{
			out.print("false");
		}
		out.close();
		return "AjaxView";
	}

}
