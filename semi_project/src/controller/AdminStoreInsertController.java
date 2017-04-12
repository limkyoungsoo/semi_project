package controller;

import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;

public class AdminStoreInsertController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception,SQLIntegrityConstraintViolationException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=utf-8");
		String name = request.getParameter("name");
		String loc = request.getParameter("loc");
		String tel = request.getParameter("tel");
		String time = request.getParameter("time");
		String saveName = request.getParameter("saveName");
		String url = "";
	
		StoreDAO.getInstance().insertStore(name,loc,tel,time,saveName);
			url ="redirect:DispatcherServlet?command=adminStore";
		
		return url;
		
	}

}
