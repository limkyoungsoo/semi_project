package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;

public class MarkDeleteController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      //response.setContentType("text/html;charset=utf-8");
	      //PrintWriter out = response.getWriter();
	      int menuNo=Integer.parseInt(request.getParameter("menuNo"));
	      StoreDAO.getInstance().deleteMenumark(menuNo);
	      
	      return "AjaxView";
	   }

}
