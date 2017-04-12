package controller;

import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StoreDAO;
import model.StoreVO;

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

		StoreVO vo  =   StoreDAO.getInstance().getAdminStoreModify(saveName);
		
		if(vo.getStoreName() != null){
			System.out.println("무결성 제약 조건");
		}
			int result = StoreDAO.getInstance().insertStore(name,loc,tel,time,saveName);
			url ="redirect:DispatcherServlet?command=adminStore";
		
		return url;
		
	}

}
